part of 'sign_up_cubit.dart';

/// The [SignUpState] class represents the state of the sign-up form.
///
/// It includes the [email], [password], and [confirmedPassword] fields along with
/// the form submission [status], overall form validity, and an optional [errorMessage].
@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmedPassword,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
    @Default('') String emailValidationMessage,
    @Default('') String passwordValidationMessage,
    @Default('') String confirmedPasswordValidationMessage,
  }) = _SignUpState;
}
