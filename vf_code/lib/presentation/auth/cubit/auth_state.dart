part of 'auth_cubit.dart';

/// The [AuthState] class represents the state of the authentication process.
///
/// It includes the submission status (e.g., initial, in progress, success, failure)
/// and an optional error message in case of failure.
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    // The submission status of the authentication process.
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    String? errorMessage,
  }) = _AuthState;
}
