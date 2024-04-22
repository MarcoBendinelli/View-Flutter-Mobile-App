part of 'bookmarked_post_bloc.dart';

enum BookmarkedPostStatus { initial, success, failure }

/// Represents the state of the [BookmarkedPostBloc].
///
/// It includes information such as the current status, the list of posts,
/// and whether there is more data to fetch.
@freezed
class BookmarkedPostState with _$BookmarkedPostState {
  factory BookmarkedPostState({
    required BookmarkedPostStatus status,
    required List<ViewPost> posts,
    required bool hasMoreData,
  }) = _PostState;

  factory BookmarkedPostState.initial() => BookmarkedPostState(
        status: BookmarkedPostStatus.initial,
        posts: const [],
        hasMoreData: true,
      );
}
