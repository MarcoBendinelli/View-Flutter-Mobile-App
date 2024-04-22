part of 'add_post_cubit.dart';

/// [freezed] class representing the various states of adding a post.
///
/// The states include:
/// - [InitialAddPostState] : Initial state before the add post operation.
/// - [LoadingAddPostState] : State indicating that the add post operation is in progress.
/// - [SuccessAddPostState] : State indicating the successful adding of a post.
/// - [FailureAddPostState] : State indicating a failure during adding of a post with an associated error message.
@freezed
class AddPostState with _$AddPostState {
  const factory AddPostState.initial() = InitialAddPostState;

  const factory AddPostState.loading() = LoadingAddPostState;

  const factory AddPostState.success() = SuccessAddPostState;

  const factory AddPostState.failure({required String errorMessage}) =
      FailureAddPostState;
}
