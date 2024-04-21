import 'package:formz/formz.dart';

/// Validation errors for the [Password] FormzInput.
sealed class PasswordValidationError {
  PasswordValidationError();
}

/// Error for passwords less than [Password.minCharacters] long.
class TooShortPassword extends PasswordValidationError {
  TooShortPassword();
}

/// Error for passwords without a digit.
class MissingLetterOrDigitPassword extends PasswordValidationError {
  MissingLetterOrDigitPassword();
}

/// Form input for a password input.
class Password extends FormzInput<String, PasswordValidationError> {
  /// Constructs a pure instance of [Password].
  ///
  /// - A "pure" state indicates that the input field hasn't been interacted with or modified.
  const Password.pure() : super.pure('');

  /// Constructs a dirty instance of [Password] with an optional initial [value].
  ///
  /// - A "dirty" state indicates that the input field has been interacted with or modified.
  const Password.dirty([super.value = '']) : super.dirty();

  /// Minimum number of characters
  static const int minCharacters = 6;

  /// Regular expression for validating passwords.
  static final _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).*$');

  /// Validates the provided [value] against the password regular expression.
  ///
  /// Returns null if the value is a valid password;
  /// otherwise, returns [PasswordValidationError.invalid] if the value is not a valid password.
  @override
  PasswordValidationError? validator(String? value) {
    //  The if statement checks if the length of the string is less than minCharacters.
    //  If value is null, it treats the length as 0.
    if ((value?.length ?? 0) < minCharacters) {
      return TooShortPassword();
    }
    // The null-aware operator (??) is used here: if value is not null,
    // it returns the value. If value is null, it returns an empty string ('').
    if (!_passwordRegExp.hasMatch(value ?? '')) {
      return MissingLetterOrDigitPassword();
    }

    // No error found
    return null;
  }
}
