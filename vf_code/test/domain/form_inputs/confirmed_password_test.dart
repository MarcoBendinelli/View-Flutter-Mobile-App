import 'package:test/test.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';

/// This test file contains unit tests for the [ConfirmedPassword] class:
///
///   1. Creating a pure instance of [ConfirmedPassword] and ensuring it has an empty value.
///   2. Creating a dirty instance of [ConfirmedPassword] and verifying it has the provided value.
///   3. Validating that the validator returns null when passwords match.
///   4. Validating that the validator returns a [NotMatchingPasswords] error when passwords do not match.
void main() {
  group('ConfirmedPassword', () {
    test('pure() instance should have an empty value', () {
      const confirmedPassword = ConfirmedPassword.pure();
      expect(confirmedPassword.value, '');
    });

    test('dirty() instance should have the provided value', () {
      const confirmedPassword =
          ConfirmedPassword.dirty(password: 'password', value: 'test');
      expect(confirmedPassword.value, 'test');
    });

    test('validator should return null when passwords match', () {
      const confirmedPassword =
          ConfirmedPassword.dirty(password: 'password', value: 'password');
      expect(confirmedPassword.validator('password'), isNull);
    });

    test(
        'validator should return NotMatchingPasswords when passwords do not match',
        () {
      const confirmedPassword = ConfirmedPassword.dirty(
          password: 'password', value: 'wrong_password');
      final result = confirmedPassword.validator('wrong_password');
      expect(result, isA<NotMatchingPasswords>());
    });
  });
}
