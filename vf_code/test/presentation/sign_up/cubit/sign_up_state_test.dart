import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';
import 'package:view_app/presentation/sign_up/sign_up.dart';

/// This test file contains unit tests for the [SignUpState] class:
///
///   1. Verify value comparisons for [SignUpState] instances.
///   2. Verify [copyWith] feature.
void main() {
  const email = Email.dirty('email');
  const passwordString = 'password';
  const password = Password.dirty(passwordString);
  const confirmedPassword = ConfirmedPassword.dirty(
    password: passwordString,
    value: passwordString,
  );

  group('SignUpState', () {
    test('supports value comparisons', () {
      expect(const SignUpState(), const SignUpState());
    });

    test('returns same object when no properties are passed', () {
      expect(const SignUpState().copyWith(), const SignUpState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const SignUpState().copyWith(status: FormzSubmissionStatus.initial),
        const SignUpState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const SignUpState().copyWith(email: email),
        const SignUpState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const SignUpState().copyWith(password: password),
        const SignUpState(password: password),
      );
    });

    test(
        'returns object with updated confirmedPassword'
        ' when confirmedPassword is passed', () {
      expect(
        const SignUpState().copyWith(confirmedPassword: confirmedPassword),
        const SignUpState(confirmedPassword: confirmedPassword),
      );
    });
  });
}
