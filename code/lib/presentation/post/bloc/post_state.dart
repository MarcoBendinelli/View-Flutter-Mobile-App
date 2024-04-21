part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

/// Represents the state of the [PostBloc].
///
/// It includes information such as the current status and the retrieved post.
@freezed
class PostState with _$PostState {
  factory PostState({
    required PostStatus status,
    ViewPost? post,
  }) = _PostState;

  factory PostState.initial() => PostState(
        status: PostStatus.initial,
        post: null,
      );
}
