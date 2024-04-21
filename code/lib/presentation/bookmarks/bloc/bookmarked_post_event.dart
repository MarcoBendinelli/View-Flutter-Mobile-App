part of 'bookmarked_post_bloc.dart';

/// Class representing events related to the [BookmarkedPostBloc].
@freezed
class BookmarkedPostEvent with _$BookmarkedPostEvent {
  /// Event used to fetch more posts from the DB.
  const factory BookmarkedPostEvent.fetchPosts() = FetchBookmarkedPosts;
}
