part of 'post_bloc.dart';

/// Class representing events related to the [PostBloc].
@freezed
class PostEvent with _$PostEvent {
  /// Event used to fetch the post from the DB.
  const factory PostEvent.fetchPost(String postId) = FetchPost;
}
