import 'package:formz/formz.dart';

/// Validation errors for the [ConfirmedPassword] FormzInput.
sealed class ConfirmedPasswordValidationError {
  ConfirmedPasswordValidationError();
}

/// Error for passwords that does not match.
class NotMatchingPasswords extends ConfirmedPasswordValidationError {
  NotMatchingPasswords();
}

/// Form input for a confirmed password input.
class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  /// Constructs a pure instance of [ConfirmedPassword] with an optional [password].
  ///
  /// - A "pure" state indicates that the input field hasn't been interacted with or modified.
  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');

  /// Constructs a dirty instance of [ConfirmedPassword] with a required [password] and an optional [value].
  ///
  /// - A "dirty" state indicates that the input field has been interacted with or modified.
  const ConfirmedPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  /// The original password.
  final String password;

  /// Validates the provided [value] against the original password.
  ///
  /// Returns null if the value matches the original password;
  /// otherwise, returns [ConfirmedPasswordValidationError.invalid] if the passwords are not equal.
  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    return password == value ? null : NotMatchingPasswords();
  }
}
