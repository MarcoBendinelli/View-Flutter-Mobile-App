import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';
import 'package:view_app/presentation/forgot_password/forgot_password.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:view_app/core/keys.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockSignInCubit extends MockCubit<SignInState> implements SignInCubit {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}

/// This test file contains unit tests for the [SignInForm] widget:
///
///   1. Ensuring that [emailChanged] is called when the email changes.
///   2. Ensuring that [passwordChanged] is called when the password changes.
///   3. Ensuring that [logInWithCredentials] is called when the login button is pressed.
///   4. Rendering an [AuthenticationFailure] SnackBar when submission fails.
///   5. Displaying invalid email/password error text when the email/password is invalid.
///   6. Disabling/Enabling the login button when the status is validated/not validated.
///   7. Navigating to [ForgotPasswordScreen] when the forgotPassword button is pressed.
///   8. Navigating back to previous page when submission status is success and
///      there is not connection with [FirebaseAuth].

void main() {
  const testEmail = 'test@gmail.com';
  const testPassword = 'testP@ssw0rd1';

  group('SignInForm', () {
    late SignInCubit signInCubit;
    late AuthenticationRepository mockAuthRepository;
    late AppBloc appBloc;

    setUp(() {
      signInCubit = MockSignInCubit();
      mockAuthRepository = MockAuthenticationRepository();
      when(() => signInCubit.state).thenReturn(const SignInState());
      when(() => signInCubit.logInWithCredentials()).thenAnswer((_) async {});
    });

    group('calls', () {
      testWidgets('emailChanged when email changes', (tester) async {
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.enterText(find.byKey(Keys.signInEmailInputKey), testEmail);
        verify(() => signInCubit.emailChanged(testEmail)).called(1);
      });

      testWidgets('passwordChanged when password changes', (tester) async {
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byKey(Keys.signInPasswordInputKey), testPassword);
        verify(() => signInCubit.passwordChanged(testPassword)).called(1);
      });

      testWidgets('logInWithCredentials when login button is pressed',
          (tester) async {
        when(() => signInCubit.state).thenReturn(
          const SignInState(isValid: true),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signInFormButtonKey));
        verify(() => signInCubit.logInWithCredentials()).called(1);
      });
    });

    group('renders', () {
      testWidgets('AuthenticationFailure SnackBar when submission fails',
          (tester) async {
        whenListen(
          signInCubit,
          Stream.fromIterable(const <SignInState>[
            SignInState(status: FormzSubmissionStatus.inProgress),
            SignInState(status: FormzSubmissionStatus.failure),
          ]),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.pump();
        expect(find.text('An error occurred'), findsOneWidget);
      });

      testWidgets('invalid email error text when email is invalid',
          (tester) async {
        final email = MockEmail();
        when(() => email.isPure).thenReturn(false);
        when(() => email.error).thenReturn(BlankEmail());
        when(() => signInCubit.state).thenReturn(SignInState(
            email: email, emailValidationMessage: 'Email cannot be blank'));
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        expect(find.text('Email cannot be blank'), findsOneWidget);
      });

      testWidgets('invalid password error text when password is invalid',
          (tester) async {
        final password = MockPassword();
        when(() => password.isPure).thenReturn(false);
        when(
          () => password.error,
        ).thenReturn(TooShortPassword());
        when(() => signInCubit.state).thenReturn(SignInState(
            password: password,
            passwordValidationMessage:
                'Password must be at least 6 characters'));
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        expect(find.text('Password must be at least 6 characters'),
            findsOneWidget);
      });

      testWidgets('disabled login button when status is not validated',
          (tester) async {
        when(() => signInCubit.state).thenReturn(const SignInState());
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        final loginButton = tester.widget<ViewTextButton>(
          find.byKey(Keys.signInFormButtonKey),
        );
        expect(loginButton.enabled, isFalse);
      });

      testWidgets('enabled login button when status is validated',
          (tester) async {
        when(() => signInCubit.state).thenReturn(
          const SignInState(isValid: true),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signInCubit,
              child: const SignInForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        final loginButton = tester.widget<ViewTextButton>(
          find.byKey(Keys.signInFormButtonKey),
        );
        expect(loginButton.enabled, isTrue);
      });
    });

    group('navigates', () {
      setUp(() {
        when(() => mockAuthRepository.user).thenAnswer((_) {
          return Stream.fromIterable([ViewUser.empty]);
        });
        when(() => mockAuthRepository.currentUser).thenAnswer((_) {
          return ViewUser(
            id: "id",
            email: "email",
            username: '',
            profession: '',
            photoUrl: '',
            topics: const [],
            following: const [],
            followers: const [],
            createdAt: Timestamp(0, 0),
          );
        });
        when(() => mockAuthRepository.logInWithEmailAndPassword(
            email: any(named: "email"),
            password: any(named: "password"))).thenAnswer((_) async {
          return;
        });
        appBloc = AppBloc(authenticationRepository: mockAuthRepository);
      });
      testWidgets('to ForgotPasswordScreen when forgotPassword is pressed',
          (tester) async {
        await tester.pumpWidget(
          getRouterTestApp(
              authRepository: mockAuthRepository, appBloc: appBloc),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signInButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signInForgotPasswordButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(ForgotPasswordScreen), findsOneWidget);
      });

      // testWidgets('back to previous page when submission status is success',
      //     (tester) async {
      //   await tester.pumpWidget(
      //     getRouterTestApp(
      //         authRepository: mockAuthRepository, appBloc: appBloc),
      //   );
      //   await tester.pumpAndSettle();
      //   await tester.tap(find.byKey(Keys.signInButtonKey));
      //   await tester.pumpAndSettle();
      //   await tester.enterText(find.byKey(Keys.signInEmailInputKey), testEmail);
      //   await tester.enterText(
      //       find.byKey(Keys.signInPasswordInputKey), testPassword);
      //   await tester.pumpAndSettle();
      //   await tester.tap(find.byKey(Keys.signInFormButtonKey));
      //   await tester.pumpAndSettle();
      //   expect(find.byType(HomeScreen), findsOneWidget);
      // });
    });
  });
}
