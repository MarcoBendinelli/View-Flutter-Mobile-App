part of 'searched_post_bloc.dart';

enum SearchedPostStatus { initial, success, failure }

/// Represents the state of the [SearchedPostBloc].
///
/// It includes information such as the current status, the list of posts,
/// and whether there is more data to fetch.
@freezed
class SearchedPostState with _$SearchedPostState {
  factory SearchedPostState({
    required SearchedPostStatus status,
    required List<ViewPost> posts,
    required bool hasMoreData,
  }) = _PostState;

  factory SearchedPostState.initial() => SearchedPostState(
        status: SearchedPostStatus.initial,
        posts: const [],
        hasMoreData: true,
      );
}
