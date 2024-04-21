import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/email.dart';
import 'package:view_app/presentation/forgot_password/cubit/forgot_password_cubit.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [ForgotPasswordCubit]:
///
///   1. Checking the initial state of [ForgotPasswordCubit].
///   2. Verifying the behavior of [emailChanged] method.
///   3. Testing the [sendPasswordResetEmail] method with different states and outcomes.
void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = Email.dirty(invalidEmailString);

  const validEmailString = 'test@gmail.com';
  const validEmail = Email.dirty(validEmailString);

  group('ForgotPasswordCubit', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      when(
        () => authenticationRepository.sendPasswordResetEmail(
            email: any(named: "email")),
      ).thenAnswer((_) async {
        return;
      });
    });

    test('initial state is SignInState', () {
      expect(
          ForgotPasswordCubit(
                  authenticationRepository: authenticationRepository,
                  notBlankMessage: "",
                  invalidEmailMessage: "")
              .state,
          const ForgotPasswordState());
    });

    group('emailChanged', () {
      blocTest<ForgotPasswordCubit, ForgotPasswordState>(
        'emits [invalid] when email is invalid',
        build: () => ForgotPasswordCubit(
            authenticationRepository: authenticationRepository,
            notBlankMessage: "",
            invalidEmailMessage: ""),
        act: (cubit) => cubit.emailChanged(invalidEmailString),
        expect: () => const <ForgotPasswordState>[
          ForgotPasswordState(email: invalidEmail)
        ],
      );

      blocTest<ForgotPasswordCubit, ForgotPasswordState>(
        'emits [valid] when email is valid',
        build: () => ForgotPasswordCubit(
            authenticationRepository: authenticationRepository,
            notBlankMessage: "",
            invalidEmailMessage: ""),
        act: (cubit) => cubit.emailChanged(validEmailString),
        expect: () => const <ForgotPasswordState>[
          ForgotPasswordState(
            email: validEmail,
            isValid: true,
          ),
        ],
      );
    });

    group('sendPasswordResetEmail', () {
      blocTest<ForgotPasswordCubit, ForgotPasswordState>(
        'calls sendPasswordResetEmail with correct email',
        build: () => ForgotPasswordCubit(
            authenticationRepository: authenticationRepository,
            notBlankMessage: "",
            invalidEmailMessage: ""),
        seed: () => const ForgotPasswordState(
          email: validEmail,
          isValid: true,
        ),
        act: (cubit) => cubit.sendPasswordResetEmail(),
        verify: (_) {
          verify(
            () => authenticationRepository.sendPasswordResetEmail(
              email: validEmailString,
            ),
          ).called(1);
        },
      );

      blocTest<ForgotPasswordCubit, ForgotPasswordState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when sendPasswordResetEmail succeeds',
        build: () => ForgotPasswordCubit(
            authenticationRepository: authenticationRepository,
            notBlankMessage: "",
            invalidEmailMessage: ""),
        seed: () => const ForgotPasswordState(
          email: validEmail,
          isValid: true,
        ),
        act: (cubit) => cubit.sendPasswordResetEmail(),
        expect: () => const <ForgotPasswordState>[
          ForgotPasswordState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            isValid: true,
          ),
          ForgotPasswordState(
            status: FormzSubmissionStatus.success,
            email: validEmail,
            isValid: true,
          ),
        ],
      );

      blocTest<ForgotPasswordCubit, ForgotPasswordState>(
        'emits [submissionInProgress, submissionFailure] '
        'when sendPasswordResetEmail fails '
        'due to SendPasswordResetEmailFailure',
        setUp: () {
          when(
            () => authenticationRepository.sendPasswordResetEmail(
              email: any(named: 'email'),
            ),
          ).thenThrow(const SendPasswordResetEmailFailure('oops'));
        },
        build: () => ForgotPasswordCubit(
            authenticationRepository: authenticationRepository,
            notBlankMessage: "",
            invalidEmailMessage: ""),
        seed: () => const ForgotPasswordState(
          email: validEmail,
          isValid: true,
        ),
        act: (cubit) => cubit.sendPasswordResetEmail(),
        expect: () => const <ForgotPasswordState>[
          ForgotPasswordState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            isValid: true,
          ),
          ForgotPasswordState(
            status: FormzSubmissionStatus.failure,
            errorMessage: 'oops',
            email: validEmail,
            isValid: true,
          ),
        ],
      );

      blocTest<ForgotPasswordCubit, ForgotPasswordState>(
        'emits [submissionInProgress, submissionFailure] '
        'when sendPasswordResetEmail fails due to generic exception',
        setUp: () {
          when(
            () => authenticationRepository.sendPasswordResetEmail(
              email: any(named: 'email'),
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => ForgotPasswordCubit(
            authenticationRepository: authenticationRepository,
            notBlankMessage: "",
            invalidEmailMessage: ""),
        seed: () => const ForgotPasswordState(
          email: validEmail,
          isValid: true,
        ),
        act: (cubit) => cubit.sendPasswordResetEmail(),
        expect: () => const <ForgotPasswordState>[
          ForgotPasswordState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            isValid: true,
          ),
          ForgotPasswordState(
            status: FormzSubmissionStatus.failure,
            email: validEmail,
            isValid: true,
          ),
        ],
      );
    });
  });
}
