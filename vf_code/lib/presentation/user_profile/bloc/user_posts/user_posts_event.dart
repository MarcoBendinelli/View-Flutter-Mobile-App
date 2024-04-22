part of 'user_posts_bloc.dart';

/// Class representing events related to the [UserPostsBloc].
@freezed
class UserPostsEvent with _$UserPostsEvent {
  /// Event used to fetch the user posts from the DB.
  const factory UserPostsEvent.fetchUserPosts(String userId) = FetchUserPosts;
}
