import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';
import 'package:view_app/presentation/sign_up/sign_up.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [SignUpCubit] class:
///
///   1. Testing the initial state of [SignUpCubit].
///   2. Handling changes in email, password, and confirmed password.
///   3. Checking the behavior of [signUpFormSubmitted] method under different conditions.
///   4. Verifying the interaction with [AuthenticationRepository] during the sign-up process.
void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = Email.dirty(invalidEmailString);

  const validEmailString = 'test@gmail.com';
  const validEmail = Email.dirty(validEmailString);

  const invalidPasswordString = 'invalid';
  const invalidPassword = Password.dirty(invalidPasswordString);

  const validPasswordString = 't0pS3cret1234';
  const validPassword = Password.dirty(validPasswordString);

  const invalidConfirmedPasswordString = 'invalid';
  const invalidConfirmedPassword = ConfirmedPassword.dirty(
    password: validPasswordString,
    value: invalidConfirmedPasswordString,
  );

  const validConfirmedPasswordString = 't0pS3cret1234';
  const validConfirmedPassword = ConfirmedPassword.dirty(
    password: validPasswordString,
    value: validConfirmedPasswordString,
  );

  group('SignUpCubit', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      when(
        () => authenticationRepository.signUp(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});
    });

    test('initial state is SignUpState', () {
      expect(
          SignUpCubit(
                  authenticationRepository: authenticationRepository,
                  emailNotBlankMessage: "",
                  invalidEmailMessage: "",
                  shortPasswordMessage: "",
                  passwordLetterOrDigitPassword: "",
                  passwordsNotMatch: "")
              .state,
          const SignUpState());
    });

    group('emailChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        act: (cubit) => cubit.emailChanged(invalidEmailString),
        expect: () => const <SignUpState>[SignUpState(email: invalidEmail)],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when email/password/confirmedPassword are valid',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.emailChanged(validEmailString),
        expect: () => const <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('passwordChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        act: (cubit) => cubit.passwordChanged(invalidPasswordString),
        expect: () => const <SignUpState>[
          SignUpState(
            confirmedPassword: ConfirmedPassword.dirty(
              password: invalidPasswordString,
            ),
            password: invalidPassword,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when email/password/confirmedPassword are valid',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(
          email: validEmail,
          confirmedPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.passwordChanged(validPasswordString),
        expect: () => const <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when confirmedPasswordChanged is called first and then '
        'passwordChanged is called',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(
          email: validEmail,
        ),
        act: (cubit) => cubit
          ..confirmedPasswordChanged(validConfirmedPasswordString)
          ..passwordChanged(validPasswordString),
        expect: () => const <SignUpState>[
          SignUpState(
            email: validEmail,
            confirmedPassword: validConfirmedPassword,
          ),
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('confirmedPasswordChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        act: (cubit) {
          cubit.confirmedPasswordChanged(invalidConfirmedPasswordString);
        },
        expect: () => const <SignUpState>[
          SignUpState(confirmedPassword: invalidConfirmedPassword),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when email/password/confirmedPassword are valid',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () =>
            const SignUpState(email: validEmail, password: validPassword),
        act: (cubit) => cubit.confirmedPasswordChanged(
          validConfirmedPasswordString,
        ),
        expect: () => const <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when passwordChanged is called first and then '
        'confirmedPasswordChanged is called',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(email: validEmail),
        act: (cubit) => cubit
          ..passwordChanged(validPasswordString)
          ..confirmedPasswordChanged(validConfirmedPasswordString),
        expect: () => const <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: ConfirmedPassword.dirty(
              password: validPasswordString,
            ),
          ),
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('signUpFormSubmitted', () {
      blocTest<SignUpCubit, SignUpState>(
        'calls signUp with correct email/password/confirmedPassword',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.signUpFormSubmitted(),
        verify: (_) {
          verify(
            () => authenticationRepository.signUp(
              email: validEmailString,
              password: validPasswordString,
            ),
          ).called(1);
        },
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [inProgress, success] '
        'when signUp succeeds',
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.signUpFormSubmitted(),
        expect: () => const <SignUpState>[
          SignUpState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
          SignUpState(
            status: FormzSubmissionStatus.success,
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [inProgress, failure] '
        'when signUp fails due to SignUpWithEmailAndPasswordFailure',
        setUp: () {
          when(
            () => authenticationRepository.signUp(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(const SignUpWithEmailAndPasswordFailure('oops'));
        },
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.signUpFormSubmitted(),
        expect: () => const <SignUpState>[
          SignUpState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
          SignUpState(
            status: FormzSubmissionStatus.failure,
            errorMessage: 'oops',
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [inProgress, failure] '
        'when signUp fails due to generic exception',
        setUp: () {
          when(
            () => authenticationRepository.signUp(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => SignUpCubit(
            authenticationRepository: authenticationRepository,
            emailNotBlankMessage: "",
            invalidEmailMessage: "",
            shortPasswordMessage: "",
            passwordLetterOrDigitPassword: "",
            passwordsNotMatch: ""),
        seed: () => const SignUpState(
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.signUpFormSubmitted(),
        expect: () => const <SignUpState>[
          SignUpState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
          SignUpState(
            status: FormzSubmissionStatus.failure,
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );
    });
  });
}
