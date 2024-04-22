part of 'user_posts_bloc.dart';

enum UserPostsStatus { initial, success, failure }

/// Represents the state of the [UserPostsBloc].
///
/// It includes information such as the current status and the retrieved user posts.
@freezed
class UserPostsState with _$UserPostsState {
  factory UserPostsState({
    required UserPostsStatus status,
    required List<ViewPost> posts,
    required bool hasMoreData,
  }) = _UserState;

  factory UserPostsState.initial() => UserPostsState(
        status: UserPostsStatus.initial,
        posts: const [],
        hasMoreData: true,
      );
}
