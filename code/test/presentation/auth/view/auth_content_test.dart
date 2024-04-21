import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/app.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/data/repository/authentication_repository_impl.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';
import 'package:view_app/data/repository/first_user_selection_repository_impl.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/presentation/auth/auth.dart';
import 'package:view_app/presentation/first_user_selection/first_user_selection.dart';
import 'package:view_app/presentation/home/home.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';
import 'package:view_app/presentation/sign_up/view/sign_up_screen.dart';
import 'package:view_app/core/keys.dart';

import '../../../app/view/app_test.dart';
import '../../../utils/utils.dart';

class MockAuthenticationRepositoryImpl extends Mock
    implements AuthenticationRepositoryImpl {}

class MockPostRepository extends Mock implements PostRepository {}

class MockFirstUserSelectionRepositoryImpl extends Mock
    implements FirstUserSelectionRepositoryImpl {}

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

/// This test file contains tests for the [AuthContent] widget:
///   1. Ensuring that the log-in with Google button triggers the [logInWithGoogle] method in [AuthCubit].
///   2. Verifying that the main buttons (log in with Google, sign up, and sign in) are correctly rendered.
///   3. Navigating to [SignInScreen] when the "Sign In" button is pressed.
///   4. Navigating to [SignUpScreen] when the "Sign Up" button is pressed.
///   5. Navigating to [HomeScreen] when the "Google" button is pressed and already signed up.
///   6. Navigating to [TopicSelectionScreen] when the "Google" button is pressed and not already signed up.
void main() {
  group('AuthContent', () {
    late AuthCubit authCubit;
    late AppBloc appBloc;
    late AuthenticationRepository mockAuthRepository;
    late FirstUserSelectionRepository firstUserSelectionRepository;
    late PostRepository mockPostRepository;

    setUpAll(() {
      authCubit = MockAuthCubit();
      appBloc = MockAppBloc();
      mockAuthRepository = MockAuthenticationRepositoryImpl();
      firstUserSelectionRepository = MockFirstUserSelectionRepositoryImpl();
      when(() => authCubit.state).thenReturn(const AuthState());
      when(() => authCubit.logInWithGoogle()).thenAnswer((_) async {
        return true;
      });
      when(() => mockAuthRepository.logInWithGoogle()).thenAnswer((_) async {
        return true;
      });
      when(() => appBloc.startingSelectionPhase()).thenAnswer((_) {});
      when(() => appBloc.selectionPhaseEnded()).thenAnswer((_) {});
      when(() => appBloc.state).thenAnswer((_) {
        return AppState.initial();
      });
    });

    group('calls', () {
      testWidgets('logInWithGoogle when sign in with google button is pressed',
          (tester) async {
        await tester.pumpWidget(getTestApp(
            homeTestApp: Scaffold(
          body: BlocProvider.value(
            value: appBloc,
            child: BlocProvider.value(
              value: authCubit,
              child: const AuthContent(),
            ),
          ),
        )));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.googleButtonKey));
        verify(() => authCubit.logInWithGoogle()).called(1);
      });
    });

    group('renders', () {
      testWidgets('the main buttons are correctly rendered', (tester) async {
        await tester.pumpWidget(getTestApp(
            homeTestApp: Scaffold(
          body: BlocProvider.value(
            value: authCubit,
            child: const AuthContent(),
          ),
        )));
        await tester.pumpAndSettle();
        expect(find.byKey(Keys.googleButtonKey), findsOneWidget);
        expect(find.byKey(Keys.signUpButtonKey), findsOneWidget);
        expect(find.byKey(Keys.signInButtonKey), findsOneWidget);
      });
    });

    group('navigates', () {
      testWidgets('to SignInScreen on click logIn button', (tester) async {
        await tester.pumpWidget(getRouterTestApp(
            authRepository: mockAuthRepository, appBloc: appBloc));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signInButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SignInScreen), findsOneWidget);
      });

      testWidgets('to SignUpScreen on click ContinueWithEmail button',
          (tester) async {
        await tester.pumpWidget(
          getRouterTestApp(
              authRepository: mockAuthRepository, appBloc: appBloc),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signUpButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SignUpScreen), findsOneWidget);
      });

      group('navigates on clicking Google button', () {
        setUp(() {
          mockPostRepository = MockPostRepository();
          getIt.registerSingleton<PostRepository>(mockPostRepository);
          when(() => mockPostRepository.getFollowingPosts(
                  numOfPostsToDisplay: any(named: 'numOfPostsToDisplay')))
              .thenAnswer(
            (_) => Stream.value([]),
          );
          when(() => mockPostRepository.getForYouPosts(
              numOfPostsToDisplay: any(named: 'numOfPostsToDisplay'),
              filter: any(named: 'filter'))).thenAnswer(
            (_) => Stream.value([]),
          );
          when(() => mockPostRepository.getTrendingNowPosts()).thenAnswer(
            (_) => Stream.value([]),
          );
          when(() => mockAuthRepository.user).thenAnswer((_) {
            return Stream.fromIterable([ViewUser.empty]);
          });
          when(() => mockAuthRepository.currentUser).thenAnswer((_) {
            return ViewUser.empty;
          });
          when(() => authCubit.logInWithGoogle()).thenAnswer((_) async {
            return true;
          });
          when(() => mockAuthRepository.logInWithGoogle())
              .thenAnswer((_) async {
            return true;
          });
        });

        testWidgets(
            'to HomeScreen on click Google login button and already signed up',
            (tester) async {
          await tester.pumpWidget(
            getRouterTestApp(
                authRepository: mockAuthRepository,
                appBloc: AppBloc(authenticationRepository: mockAuthRepository)),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(Keys.googleButtonKey));
          await tester.pumpAndSettle();
          expect(find.byType(HomeScreen), findsOneWidget);
        });
      });

      group('navigates on clicking Google button', () {
        setUp(() {
          when(() => mockAuthRepository.user).thenAnswer((_) {
            return Stream.fromIterable([ViewUser.empty]);
          });
          when(() => mockAuthRepository.currentUser).thenAnswer((_) {
            return ViewUser.empty;
          });
          when(() => authCubit.logInWithGoogle()).thenAnswer((_) async {
            return false;
          });
          when(() => mockAuthRepository.logInWithGoogle())
              .thenAnswer((_) async {
            return false;
          });
          when(() => firstUserSelectionRepository.getTopics()).thenAnswer((_) {
            return [const ViewTopic(topicName: "topicName")];
          });
          getIt.registerSingleton<FirstUserSelectionRepository>(
              firstUserSelectionRepository);
        });

        testWidgets('to TopicSelectionScreen if not already signed up',
            (tester) async {
          await tester.pumpWidget(
            getRouterTestApp(
                authRepository: mockAuthRepository,
                appBloc: AppBloc(authenticationRepository: mockAuthRepository)),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(Keys.googleButtonKey));
          await tester.pumpAndSettle();
          expect(find.byType(TopicSelectionScreen), findsOneWidget);
        });
      });
    });
  });
}
