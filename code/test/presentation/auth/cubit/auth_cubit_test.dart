import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/presentation/auth/auth.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [AuthCubit] class:
///
///   1. Verify the initial state of the AuthCubit
///   2. Verify the correct state transition during the [logInWithGoogle]
void main() {
  group('AuthCubit', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      when(
        () => authenticationRepository.logInWithGoogle(),
      ).thenAnswer((_) async {return true;});
    });

    test('initial state is AuthState', () {
      expect(AuthCubit(authenticationRepository).state, const AuthState());
    });

    group('logInWithGoogle', () {
      blocTest<AuthCubit, AuthState>(
        'calls logInWithGoogle',
        build: () => AuthCubit(authenticationRepository),
        act: (cubit) => cubit.logInWithGoogle(),
        verify: (_) {
          verify(() => authenticationRepository.logInWithGoogle()).called(1);
        },
      );

      blocTest<AuthCubit, AuthState>(
        'emits [inProgress, success] '
        'when logInWithGoogle succeeds',
        build: () => AuthCubit(authenticationRepository),
        act: (cubit) => cubit.logInWithGoogle(),
        expect: () => const <AuthState>[
          AuthState(status: FormzSubmissionStatus.inProgress),
          AuthState(status: FormzSubmissionStatus.success),
        ],
      );

      blocTest<AuthCubit, AuthState>(
        'emits [inProgress, failure] '
        'when logInWithGoogle fails due to LogInWithGoogleFailure',
        setUp: () {
          when(
            () => authenticationRepository.logInWithGoogle(),
          ).thenThrow(const LogInWithGoogleFailure('oops'));
        },
        build: () => AuthCubit(authenticationRepository),
        act: (cubit) => cubit.logInWithGoogle(),
        expect: () => const <AuthState>[
          AuthState(status: FormzSubmissionStatus.inProgress),
          AuthState(
            status: FormzSubmissionStatus.failure,
            errorMessage: 'oops',
          ),
        ],
      );

      blocTest<AuthCubit, AuthState>(
        'emits [inProgress, failure] '
        'when logInWithGoogle fails due to generic exception',
        setUp: () {
          when(
            () => authenticationRepository.logInWithGoogle(),
          ).thenThrow(Exception('oops'));
        },
        build: () => AuthCubit(authenticationRepository),
        act: (cubit) => cubit.logInWithGoogle(),
        expect: () => const <AuthState>[
          AuthState(status: FormzSubmissionStatus.inProgress),
          AuthState(status: FormzSubmissionStatus.failure),
        ],
      );
    });
  });
}
