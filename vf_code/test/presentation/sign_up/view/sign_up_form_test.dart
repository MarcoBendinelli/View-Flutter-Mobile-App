import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/app/bloc/app_event.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';
import 'package:view_app/presentation/auth/view/auth_screen.dart';
import 'package:view_app/presentation/sign_up/sign_up.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:view_app/core/keys.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockSignUpCubit extends MockCubit<SignUpState> implements SignUpCubit {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}

class MockConfirmedPassword extends Mock implements ConfirmedPassword {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

/// This test file contains unit tests for the [SignUpForm] widget:
///
///   1. Ensuring that [emailChanged] is called when the email changes.
///   2. Ensuring that [passwordChanged] is called when the password changes.
///   3. Ensuring that [confirmedPasswordChanged] is called when the confirmed password changes.
///   4. Ensuring that [signUpFormSubmitted] is called when the sign-up button is pressed.
///   5. Rendering an `Sign Up Failure` SnackBar when submission fails.
///   6. Displaying invalid email/password error text when the email/password is invalid
///   7. Displaying invalid confirmed password error text when the passwords don't match.
///   8. Disabling/Enabling the sign up button when the status is validated/not validated
///   9. Navigating back to previous page when submission status is success and
///      there is not connection with [FirebaseAuth].
void main() {
  const testEmail = 'test@gmail.com';
  const testPassword = 'testP@ssw0rd1';
  const testConfirmedPassword = 'testP@ssw0rd1';

  group('SignUpForm', () {
    late SignUpCubit signUpCubit;
    late AppBloc appBloc;
    late AuthenticationRepository mockAuthRepository;

    setUp(() {
      signUpCubit = MockSignUpCubit();
      appBloc = MockAppBloc();
      mockAuthRepository = MockAuthenticationRepository();
      when(() => signUpCubit.state).thenReturn(const SignUpState());
      when(() => signUpCubit.signUpFormSubmitted()).thenAnswer((_) async {});
    });

    group('calls', () {
      testWidgets('emailChanged when email changes', (tester) async {
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.enterText(find.byKey(Keys.signUpEmailInputKey), testEmail);
        verify(() => signUpCubit.emailChanged(testEmail)).called(1);
      });

      testWidgets('passwordChanged when password changes', (tester) async {
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byKey(Keys.signUpPasswordInputKey), testPassword);
        verify(() => signUpCubit.passwordChanged(testPassword)).called(1);
      });

      testWidgets('confirmedPasswordChanged when confirmedPassword changes',
          (tester) async {
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.enterText(
          find.byKey(Keys.signUpConfirmedPasswordInputKey),
          testConfirmedPassword,
        );
        verify(
          () => signUpCubit.confirmedPasswordChanged(testConfirmedPassword),
        ).called(1);
      });

      testWidgets('signUpFormSubmitted when sign up button is pressed',
          (tester) async {
        when(() => signUpCubit.state).thenReturn(
          const SignUpState(isValid: true),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: appBloc,
              child: BlocProvider.value(
                value: signUpCubit,
                child: const SignUpForm(),
              ),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signUpFormButtonKey));
        verify(() => signUpCubit.signUpFormSubmitted()).called(1);
      });
    });

    group('renders', () {
      testWidgets('Sign Up Failure SnackBar when submission fails',
          (tester) async {
        whenListen(
          signUpCubit,
          Stream.fromIterable(const <SignUpState>[
            SignUpState(status: FormzSubmissionStatus.inProgress),
            SignUpState(status: FormzSubmissionStatus.failure),
          ]),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: appBloc,
              child: BlocProvider.value(
                value: signUpCubit,
                child: const SignUpForm(),
              ),
            ),
          )),
        );
        await tester.pumpAndSettle();
        expect(find.text('An error occurred'), findsOneWidget);
      });

      testWidgets('invalid email error text when email is invalid',
          (tester) async {
        final email = MockEmail();
        when(() => email.isPure).thenReturn(false);
        when(() => email.error).thenReturn(InvalidEmail());
        when(() => signUpCubit.state).thenReturn(SignUpState(
            email: email, emailValidationMessage: 'Invalid email address'));
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        expect(find.text('Invalid email address'), findsOneWidget);
      });

      testWidgets('invalid password error text when password is invalid',
          (tester) async {
        final password = MockPassword();
        when(() => password.isPure).thenReturn(false);
        when(
          () => password.error,
        ).thenReturn(TooShortPassword());
        when(() => signUpCubit.state).thenReturn(SignUpState(
            password: password,
            passwordValidationMessage:
                'Password must be at least 6 characters'));
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        expect(find.text('Password must be at least 6 characters'),
            findsOneWidget);
      });

      testWidgets(
          'invalid confirmedPassword error text'
          ' when confirmedPassword is invalid', (tester) async {
        final confirmedPassword = MockConfirmedPassword();
        when(() => confirmedPassword.isPure).thenReturn(false);
        when(
          () => confirmedPassword.error,
        ).thenReturn(NotMatchingPasswords());
        when(() => signUpCubit.state).thenReturn(SignUpState(
            confirmedPassword: confirmedPassword,
            confirmedPasswordValidationMessage: 'The passwords don\'t match'));
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        expect(find.text('The passwords don\'t match'), findsOneWidget);
      });

      testWidgets('disabled sign up button when status is not validated',
          (tester) async {
        when(() => signUpCubit.state).thenReturn(const SignUpState());
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        final signUpButton = tester.widget<ViewTextButton>(
          find.byKey(Keys.signUpFormButtonKey),
        );
        expect(signUpButton.enabled, isFalse);
      });

      testWidgets('enabled sign up button when status is validated',
          (tester) async {
        when(() => signUpCubit.state).thenReturn(
          const SignUpState(isValid: true),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        final signUpButton = tester.widget<ViewTextButton>(
          find.byKey(Keys.signUpFormButtonKey),
        );
        expect(signUpButton.enabled, isTrue);
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
        when(() => mockAuthRepository.signUp(
            email: any(named: "email"),
            password: any(named: "password"))).thenAnswer((_) async {
          return;
        });
        appBloc = AppBloc(authenticationRepository: mockAuthRepository);
      });

      testWidgets('back to previous page when submission status is success',
          (tester) async {
        await tester.pumpWidget(
          getRouterTestApp(
              authRepository: mockAuthRepository, appBloc: appBloc),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signUpButtonKey));
        await tester.pumpAndSettle();
        await tester.enterText(find.byKey(Keys.signUpEmailInputKey), testEmail);
        await tester.enterText(
            find.byKey(Keys.signUpPasswordInputKey), testPassword);
        await tester.enterText(
            find.byKey(Keys.signUpConfirmedPasswordInputKey), testPassword);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.signUpFormButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(AuthScreen), findsOneWidget);
      });
    });
  });
}
