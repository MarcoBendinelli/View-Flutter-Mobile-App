import 'package:test/test.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';

/// This test file contains unit tests for the [Password] class:
///
///   1. Creating a pure instance of [Password] and ensuring it has an empty value.
///   2. Creating a dirty instance of [Password] and verifying it has the provided value.
///   3. Validating that the validator returns null when the password is valid.
///   4. Validating that the validator returns a [TooShortPassword] error when the password is too short.
///   5. Validating that the validator returns a [MissingLetterOrDigitPassword] error when the password lacks a digit.
///   6. Validating that the validator returns a [MissingLetterOrDigitPassword] error when the password lacks a letter.
///   7. Validating that the validator returns a [TooShortPassword] error when the password is null.
void main() {
  group('Password', () {
    test('pure() instance should have an empty value', () {
      const password = Password.pure();
      expect(password.value, '');
    });

    test('dirty() instance should have the provided value', () {
      const password = Password.dirty('test');
      expect(password.value, 'test');
    });

    test('validator should return null when password is valid', () {
      const password = Password.dirty('Test123');
      expect(password.validator('Test123'), isNull);
    });

    test('validator should return TooShortPassword when password is too short',
        () {
      const password = Password.dirty('abc');
      final result = password.validator('abc');
      expect(result, isA<TooShortPassword>());
    });

    test(
        'validator should return MissingLetterOrDigitPassword when password lacks a digit',
        () {
      const password = Password.dirty('qwerty_qwerty_qwerty');
      final result = password.validator('qwerty_qwerty_qwerty');
      expect(result, isA<MissingLetterOrDigitPassword>());
    });

    test(
        'validator should return MissingLetterOrDigitPassword when password lacks a letter',
        () {
      const password = Password.dirty('12345678910');
      final result = password.validator('12345678910');
      expect(result, isA<MissingLetterOrDigitPassword>());
    });

    test('validator should return TooShortPassword when password is null', () {
      const password = Password.dirty('');
      final result = password.validator(null);
      expect(result, isA<TooShortPassword>());
    });
  });
}
