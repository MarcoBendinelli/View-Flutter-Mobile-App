part of 'forgot_password_cubit.dart';

/// The [ForgotPasswordState] class represents the state of the "Reset Password" feature.
///
/// It includes the user's [Email], form submission [status],
/// overall form [isValid] status, and an optional [errorMessage] in case of failure.
@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(Email.pure()) Email email,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
    @Default('') String validationMessage,
  }) = _ForgotPasswordState;
}
