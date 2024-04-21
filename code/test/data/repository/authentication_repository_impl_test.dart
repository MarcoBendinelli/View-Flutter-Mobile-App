import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/cache/view_user_cache.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/data/repository/authentication_repository_impl.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';

const _mockFirebaseUserUid = 'mock-uid';
const _mockFirebaseUserEmail = 'mock-email';

class MockCacheClient extends Mock implements ViewUserCache {}

class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockFirebaseStorage extends Mock implements FirebaseStorage {}

class MockFirebaseCore extends Mock
    with MockPlatformInterfaceMixin
    implements FirebasePlatform {}

class MockFirebaseUser extends Mock implements firebase_auth.User {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserCredential extends Mock implements firebase_auth.UserCredential {}

class FakeAuthCredential extends Fake implements firebase_auth.AuthCredential {}

class FakeAuthProvider extends Fake implements AuthProvider {}

/// This Dart file contains unit tests for the [AuthenticationRepositoryImpl] class:
///
///   1. Signing up with email and password.
///   2. Logging in with Google.
///   3. Logging in with email and password.
///   4. Logging out.
///   5. User stream updates.
///   6. Retrieving the current user.
///   7. Saving the current user inside the database.
///
/// [Mock] and [Fake] classes are used to isolate dependencies such as Firebase.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const email = 'test@gmail.com';
  const password = 't0ps3cret42';
  ViewUser user = ViewUser(
    id: _mockFirebaseUserUid,
    email: _mockFirebaseUserEmail,
    username: 'test_name',
    profession: '',
    photoUrl: '',
    topics: const [],
    following: const [],
    followers: const [],
    createdAt: Timestamp(0, 0),
  );

  group('AuthenticationRepository', () {
    late ViewUserCache cache;
    late firebase_auth.FirebaseAuth firebaseAuth;
    late FirebaseFirestore firebaseFirestore;
    late FirebaseStorage firebaseStorage;
    late GoogleSignIn googleSignIn;
    late AuthenticationRepositoryImpl authenticationRepository;
    late UserCredential userCredential;
    late User firebaseUser;
    late ViewUser viewUser;

    setUpAll(() {
      registerFallbackValue(FakeAuthCredential());
      registerFallbackValue(FakeAuthProvider());
      registerFallbackValue(user);
    });

    setUp(() {
      const options = FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      );
      final platformApp = FirebaseAppPlatform(defaultFirebaseAppName, options);
      final firebaseCore = MockFirebaseCore();

      when(() => firebaseCore.apps).thenReturn([platformApp]);
      when(firebaseCore.app).thenReturn(platformApp);
      when(
        () => firebaseCore.initializeApp(
          name: defaultFirebaseAppName,
          options: options,
        ),
      ).thenAnswer((_) async => platformApp);

      Firebase.delegatePackingProperty = firebaseCore;
      userCredential = MockUserCredential();
      firebaseUser = MockFirebaseUser();
      when(
        () => userCredential.user,
      ).thenAnswer((_) => firebaseUser);
      when(
        () => firebaseUser.uid,
      ).thenAnswer((_) => "test_id");
      when(
        () => firebaseUser.email,
      ).thenAnswer((_) => "test_email");
      when(
        () => firebaseUser.displayName,
      ).thenAnswer((_) => "test_name");
      when(
        () => firebaseUser.photoURL,
      ).thenAnswer((_) => "test_photo_url");

      cache = MockCacheClient();
      firebaseAuth = MockFirebaseAuth();
      googleSignIn = MockGoogleSignIn();
      firebaseFirestore = FakeFirebaseFirestore();
      firebaseFirestore
          .collection(Constants.usersCollection)
          .doc(_mockFirebaseUserUid)
          .set(user.toMap());
      firebaseStorage = MockFirebaseStorage();
      authenticationRepository = AuthenticationRepositoryImpl(
          viewUserCache: cache,
          firebaseAuth: firebaseAuth,
          googleSignIn: googleSignIn,
          firebaseFirestore: firebaseFirestore,
          firebaseStorage: firebaseStorage);
    });

    test('creates FirebaseAuth instance internally when not injected', () {
      expect(AuthenticationRepositoryImpl.new, isNot(throwsException));
    });

    group('signUp', () {
      setUp(() {
        when(
          () => firebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) => Future.value(userCredential));
      });

      test('calls createUserWithEmailAndPassword', () async {
        await authenticationRepository.signUp(email: email, password: password);
        verify(
          () => firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
      });

      test('succeeds when createUserWithEmailAndPassword succeeds', () async {
        expect(
          authenticationRepository.signUp(email: email, password: password),
          completes,
        );
      });

      test(
          'throws SignUpWithEmailAndPasswordFailure '
          'when createUserWithEmailAndPassword throws', () async {
        when(
          () => firebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception());
        expect(
          authenticationRepository.signUp(email: email, password: password),
          throwsA(isA<SignUpWithEmailAndPasswordFailure>()),
        );
      });
    });

    group('loginWithGoogle', () {
      const accessToken = 'access-token';
      const idToken = 'id-token';

      setUp(() {
        final googleSignInAuthentication = MockGoogleSignInAuthentication();
        final googleSignInAccount = MockGoogleSignInAccount();
        when(() => googleSignInAuthentication.accessToken)
            .thenReturn(accessToken);
        when(() => googleSignInAuthentication.idToken).thenReturn(idToken);
        when(() => googleSignInAccount.authentication)
            .thenAnswer((_) async => googleSignInAuthentication);
        when(() => googleSignIn.signIn())
            .thenAnswer((_) async => googleSignInAccount);
        when(() => firebaseAuth.signInWithCredential(any()))
            .thenAnswer((_) => Future.value(userCredential));
        when(() => firebaseAuth.signInWithPopup(any()))
            .thenAnswer((_) => Future.value(userCredential));
      });

      test('calls signIn authentication, and signInWithCredential', () async {
        await authenticationRepository.logInWithGoogle();
        verify(() => googleSignIn.signIn()).called(1);
        verify(() => firebaseAuth.signInWithCredential(any())).called(1);
      });

      test(
          'throws LogInWithGoogleFailure and calls signIn authentication, and '
          'signInWithPopup when authCredential is null and kIsWeb is true',
          () async {
        authenticationRepository.isWeb = true;
        await expectLater(
          () => authenticationRepository.logInWithGoogle(),
          throwsA(isA<LogInWithGoogleFailure>()),
        );
        verifyNever(() => googleSignIn.signIn());
        verify(() => firebaseAuth.signInWithPopup(any())).called(1);
      });

      test(
          'successfully calls signIn authentication, and '
          'signInWithPopup when authCredential is not null'
          ' and kIsWeb is true', () async {
        final credential = MockUserCredential();
        when(() => firebaseAuth.signInWithPopup(any()))
            .thenAnswer((_) async => credential);
        when(() => credential.credential).thenReturn(FakeAuthCredential());
        authenticationRepository.isWeb = true;
        await expectLater(
          authenticationRepository.logInWithGoogle(),
          completes,
        );
        verifyNever(() => googleSignIn.signIn());
        verify(() => firebaseAuth.signInWithPopup(any())).called(1);
      });

      test('succeeds when signIn succeeds', () {
        expect(authenticationRepository.logInWithGoogle(), completes);
      });

      test('throws LogInWithGoogleFailure when exception occurs', () async {
        when(() => firebaseAuth.signInWithCredential(any()))
            .thenThrow(Exception());
        expect(
          authenticationRepository.logInWithGoogle(),
          throwsA(isA<LogInWithGoogleFailure>()),
        );
      });
    });

    group('logInWithEmailAndPassword', () {
      setUp(() {
        when(
          () => firebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) => Future.value(MockUserCredential()));
      });

      test('calls signInWithEmailAndPassword', () async {
        await authenticationRepository.logInWithEmailAndPassword(
          email: email,
          password: password,
        );
        verify(
          () => firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
      });

      test('succeeds when signInWithEmailAndPassword succeeds', () async {
        expect(
          authenticationRepository.logInWithEmailAndPassword(
            email: email,
            password: password,
          ),
          completes,
        );
      });

      test(
          'throws LogInWithEmailAndPasswordFailure '
          'when signInWithEmailAndPassword throws', () async {
        when(
          () => firebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception());
        expect(
          authenticationRepository.logInWithEmailAndPassword(
            email: email,
            password: password,
          ),
          throwsA(isA<LogInWithEmailAndPasswordFailure>()),
        );
      });
    });

    group('saveUserToDb', () {
      setUp(() {
        viewUser = ViewUser(
          id: 'test_id',
          username: 'test_username',
          email: 'test@test.com',
          photoUrl: 'test_photo_url',
          profession: '',
          topics: const [],
          following: const [],
          followers: const [],
          createdAt: Timestamp(0, 0),
        );
      });

      test('should save new user data to Firestore', () async {
        final result =
            await authenticationRepository.saveUserToDb(user: viewUser);

        expect(result, false);
      });

      test('should return true if user already exists in Firestore', () async {
        await authenticationRepository.saveUserToDb(user: viewUser);
        final result =
            await authenticationRepository.saveUserToDb(user: viewUser);

        expect(result, true);
      });
    });

    group('logOut', () {
      test('calls signOut', () async {
        when(() => firebaseAuth.signOut()).thenAnswer((_) async {});
        when(() => googleSignIn.signOut()).thenAnswer((_) async => null);
        await authenticationRepository.logOut();
        verify(() => firebaseAuth.signOut()).called(1);
        verify(() => googleSignIn.signOut()).called(1);
      });

      test('throws LogOutFailure when signOut throws', () async {
        when(() => firebaseAuth.signOut()).thenThrow(Exception());
        expect(
          authenticationRepository.logOut(),
          throwsA(isA<LogOutFailure>()),
        );
      });
    });

    group('user', () {
      test('emits User.empty when firebase user is null', () async {
        when(() => firebaseAuth.authStateChanges())
            .thenAnswer((_) => Stream.value(null));
        await expectLater(
          authenticationRepository.user,
          emitsInOrder(<ViewUser>[ViewUser.empty]),
        );
      });

      test('emits User when firebase user is not null', () async {
        final firebaseUser = MockFirebaseUser();
        when(() => firebaseUser.uid).thenReturn(_mockFirebaseUserUid);
        when(() => firebaseUser.email).thenReturn(_mockFirebaseUserEmail);
        when(() => firebaseUser.displayName).thenReturn('test_name');
        when(() => firebaseUser.photoURL).thenReturn('');
        when(() => firebaseAuth.authStateChanges())
            .thenAnswer((_) => Stream.value(firebaseUser));
        await expectLater(
          authenticationRepository.user,
          emitsInOrder(<ViewUser>[user]),
        );
        verify(
          () => cache.write(value: any(named: "value")),
        ).called(1);
      });
    });

    group('currentUser', () {
      test('returns User.empty when cached user is null', () {
        when(
          () => cache.read(),
        ).thenReturn(ViewUser.empty);
        expect(
          authenticationRepository.currentUser,
          equals(ViewUser.empty),
        );
      });

      test('returns User when cached user is not null', () async {
        when(
          () => cache.read(),
        ).thenReturn(user);
        expect(authenticationRepository.currentUser, equals(user));
      });
    });
  });
}
