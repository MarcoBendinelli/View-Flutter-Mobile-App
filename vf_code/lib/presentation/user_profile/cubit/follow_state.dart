part of 'follow_cubit.dart';

/// [freezed] class representing the various states of following an user.
///
/// The states include:
/// - [InitialFollowState] : Initial state before any follow operation.
/// - [LoadingFollowState] : State indicating the follow operation is in progress.
/// - [SuccessFollowState] : State indicating the successful following of an user.
/// - [FailureFollowState] : State indicating a failure during following with an associated error message.
@freezed
class FollowState with _$FollowState {
  const factory FollowState.initial() = InitialFollowState;

  const factory FollowState.loading() = LoadingFollowState;

  const factory FollowState.success() = SuccessFollowState;

  const factory FollowState.failure({required String errorMessage}) =
      FailureFollowState;
}
