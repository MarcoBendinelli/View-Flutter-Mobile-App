part of 'sign_in_cubit.dart';

/// The [SignInState] class represents the state of the sign-in form.
///
/// It includes the user's [Email], [Password], form submission [status],
/// overall form [isValid] status, an optional [errorMessage] in case of failure,
/// and an optional [validationError] for detailed password validation feedback.
@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
    @Default('') String emailValidationMessage,
    @Default('') String passwordValidationMessage,
  }) = _SignInState;
}
