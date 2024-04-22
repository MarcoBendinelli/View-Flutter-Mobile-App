part of 'searched_post_bloc.dart';

/// Class representing events related to the [SearchedPostBloc].
@freezed
class SearchedPostEvent with _$SearchedPostEvent {
  /// Event used to fetch more posts from the DB.
  const factory SearchedPostEvent.fetchMorePosts(String searchedText) =
      FetchMorePosts;

  /// Event used to search the posts from the DB.
  const factory SearchedPostEvent.searchPosts(String searchedText) =
      SearchPosts;

  /// Event used the clear all the results.
  const factory SearchedPostEvent.clearSearchResults() = ClearSearchResults;
}
