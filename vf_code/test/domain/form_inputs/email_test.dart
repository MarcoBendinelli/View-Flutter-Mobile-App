import 'package:test/test.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';

/// This test file contains unit tests for the [Email] class:
///
///   1. Creating a pure instance of [Email] and ensuring it has an empty value.
///   2. Creating a dirty instance of [Email] and verifying it has the provided value.
///   3. Validating that the validator returns null when the email format is valid.
///   4. Validating that the validator returns an [InvalidEmail] error for an invalid email format.
///   5. Validating that the validator returns a [BlankEmail] error for a blank email.
///   6. Validating that the validator returns null when the provided value is null.
///   7. Validating that the validator returns a [BlankEmail] error for a null email.
void main() {
  group('Email', () {
    test('pure() instance should have an empty value', () {
      const email = Email.pure();
      expect(email.value, '');
    });

    test('dirty() instance should have the provided value', () {
      const email = Email.dirty('test@example.com');
      expect(email.value, 'test@example.com');
    });

    test('validator should return null for a valid email format', () {
      const email = Email.dirty('test@example.com');
      expect(email.validator('test@example.com'), isNull);
    });

    test('validator should return InvalidEmail for an invalid email format',
        () {
      const email = Email.dirty('invalid-email');
      final result = email.validator('invalid-email');
      expect(result, isA<InvalidEmail>());
    });

    test('validator should return BlankEmail for a blank email', () {
      const email = Email.dirty('');
      final result = email.validator('');
      expect(result, isA<BlankEmail>());
    });

    test('validator should return BlankEmail for a null email', () {
      const email = Email.dirty('');
      final result = email.validator(null);
      expect(result, isA<BlankEmail>());
    });
  });
}
