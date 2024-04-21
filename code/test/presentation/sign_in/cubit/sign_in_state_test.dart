import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';

/// This test file contains unit tests for the [SignInState] class:
///
///   1. Verify value comparisons for [SignInState] instances.
///   2. Verify [copyWith] feature.
void main() {
  const email = Email.dirty('email');
  const password = Password.dirty('password');

  group('SignInState', () {
    test('supports value comparisons', () {
      expect(const SignInState(), const SignInState());
    });

    test('returns same object when no properties are passed', () {
      expect(const SignInState().copyWith(), const SignInState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const SignInState().copyWith(status: FormzSubmissionStatus.initial),
        const SignInState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const SignInState().copyWith(email: email),
        const SignInState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const SignInState().copyWith(password: password),
        const SignInState(password: password),
      );
    });
  });
}
