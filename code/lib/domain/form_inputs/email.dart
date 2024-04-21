import 'package:formz/formz.dart';

/// Validation errors for the [Email] FormzInput.
sealed class EmailValidationError {
  EmailValidationError();
}

/// Generic invalid error.
class InvalidEmail extends EmailValidationError {
  InvalidEmail();
}

/// Error for blank emails.
class BlankEmail extends EmailValidationError {
  BlankEmail();
}

/// Form input for an email input.
class Email extends FormzInput<String, EmailValidationError> {
  /// Constructs a pure instance of [Email].
  ///
  /// - A "pure" state indicates that the input field hasn't been interacted with or modified.
  const Email.pure() : super.pure('');

  /// Constructs a dirty instance of [Email] with an optional initial [value].
  ///
  /// - A "dirty" state indicates that the input field has been interacted with or modified.
  const Email.dirty([super.value = '']) : super.dirty();

  /// Regular expression for validating email addresses.
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  /// Validates the provided [value] against the email regular expression.
  ///
  /// Returns null if the value is a valid email address;
  /// otherwise, returns [EmailValidationError.invalid] if the value is not a valid email address.
  @override
  EmailValidationError? validator(String? value) {
    //  The if statement checks if the length of the string is blank.
    //  If value is null, value?.isEmpty evaluates to true due to the null-aware operator (??).
    //  If value is not null, it checks whether it is an empty string using the isEmpty
    if (value?.isEmpty ?? true) {
      return BlankEmail();
    }

    return _emailRegExp.hasMatch(value ?? '') ? null : InvalidEmail();
  }
}
