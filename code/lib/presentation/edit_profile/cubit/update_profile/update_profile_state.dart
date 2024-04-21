part of 'update_profile_cubit.dart';

/// [freezed] class representing the various states of updating the user.
///
/// The states include:
/// - [InitialAddPostState] : Initial state before the update user operation.
/// - [LoadingAddPostState] : State indicating that the update user operation is in progress.
/// - [SuccessAddPostState] : State indicating the successful updating user.
/// - [FailureAddPostState] : State indicating a failure during updating of an user with an associated error message.
@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.initial() = InitialUpdateProfileState;

  const factory UpdateProfileState.loading() = LoadingUpdateProfileState;

  const factory UpdateProfileState.success() = SuccessUpdateProfileState;

  const factory UpdateProfileState.failure() = FailureUpdateProfileState;
}
