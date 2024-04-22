import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/email.dart';
import 'package:view_app/domain/form_inputs/password.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [SignInCubit]:
///
///   1. Checking the initial state of [SignInCubit].
///   2. Verifying the behavior of [emailChanged] and [passwordChanged] methods.
///   3. Testing the [logInWithCredentials] method with different states and outcomes.
void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = Email.dirty(invalidEmailString);

  const validEmailString = 'test@gmail.com';
  const validEmail = Email.dirty(validEmailString);

  const invalidPasswordString = 'invalid';
  const invalidPassword = Password.dirty(invalidPasswordString);

  const validPasswordString = 't0pS3cret1234';
  const validPassword = Password.dirty(validPasswordString);

  group('SignInCubit', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      when(
        () => authenticationRepository.logInWithGoogle(),
      ).thenAnswer((_) async {
        return true;
      });
      when(
        () => authenticationRepository.logInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});
    });

    test('initial state is SignInState', () {
      expect(
          SignInCubit(
                  authenticationRepository: authenticationRepository,
                  emailNotBlankMessage: "",
                  invalidEmailMessage: "",
                  tooShortPasswordMessage: "",
                  missingLetterOrDigitMessage: "")
              .state,
          const SignInState());
    });

    group('emailChanged', () {
      blocTest<SignInCubit, SignInState>(
        'emits [invalid] when email/password are invalid',
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        act: (cubit) => cubit.emailChanged(invalidEmailString),
        expect: () => const <SignInState>[SignInState(email: invalidEmail)],
      );

      blocTest<SignInCubit, SignInState>(
        'emits [valid] when email/password are valid',
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        seed: () => const SignInState(password: validPassword),
        act: (cubit) => cubit.emailChanged(validEmailString),
        expect: () => const <SignInState>[
          SignInState(
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('passwordChanged', () {
      blocTest<SignInCubit, SignInState>(
        'emits [invalid] when email/password are invalid',
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        act: (cubit) => cubit.passwordChanged(invalidPasswordString),
        expect: () =>
            <SignInState>[const SignInState(password: invalidPassword)],
      );

      blocTest<SignInCubit, SignInState>(
        'emits [valid] when email/password are valid',
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        seed: () => const SignInState(email: validEmail),
        act: (cubit) => cubit.passwordChanged(validPasswordString),
        expect: () => const <SignInState>[
          SignInState(
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('logInWithCredentials', () {
      blocTest<SignInCubit, SignInState>(
        'calls logInWithEmailAndPassword with correct email/password',
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        seed: () => const SignInState(
          email: validEmail,
          password: validPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.logInWithCredentials(),
        verify: (_) {
          verify(
            () => authenticationRepository.logInWithEmailAndPassword(
              email: validEmailString,
              password: validPasswordString,
            ),
          ).called(1);
        },
      );

      blocTest<SignInCubit, SignInState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when logInWithEmailAndPassword succeeds',
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        seed: () => const SignInState(
          email: validEmail,
          password: validPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.logInWithCredentials(),
        expect: () => const <SignInState>[
          SignInState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
          SignInState(
            status: FormzSubmissionStatus.success,
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'emits [submissionInProgress, submissionFailure] '
        'when logInWithEmailAndPassword fails '
        'due to LogInWithEmailAndPasswordFailure',
        setUp: () {
          when(
            () => authenticationRepository.logInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(const LogInWithEmailAndPasswordFailure('oops'));
        },
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        seed: () => const SignInState(
          email: validEmail,
          password: validPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.logInWithCredentials(),
        expect: () => const <SignInState>[
          SignInState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
          SignInState(
            status: FormzSubmissionStatus.failure,
            errorMessage: 'oops',
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'emits [submissionInProgress, submissionFailure] '
        'when logInWithEmailAndPassword fails due to generic exception',
        setUp: () {
          when(
            () => authenticationRepository.logInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => SignInCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            tooShortPasswordMessage: "",
            missingLetterOrDigitMessage: ""),
        seed: () => const SignInState(
          email: validEmail,
          password: validPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.logInWithCredentials(),
        expect: () => const <SignInState>[
          SignInState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
          SignInState(
            status: FormzSubmissionStatus.failure,
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
        ],
      );
    });
  });
}
