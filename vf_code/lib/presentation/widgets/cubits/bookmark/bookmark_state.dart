part of 'bookmark_cubit.dart';

/// [freezed] class representing the various states of bookmarking a post.
///
/// The states include:
/// - [InitialBookmarkState] : Initial state before any bookmark operation.
/// - [LoadingBookmarkState] : State indicating the bookmark operation is in progress.
/// - [SuccessBookmarkState] : State indicating the successful bookmarking of a post.
/// - [FailureBookmarkState] : State indicating a failure during bookmarking with an associated error message.
@freezed
class BookmarkState with _$BookmarkState {
  const factory BookmarkState.initial() = InitialBookmarkState;

  const factory BookmarkState.loading() = LoadingBookmarkState;

  const factory BookmarkState.success() = SuccessBookmarkState;

  const factory BookmarkState.failure({required String errorMessage}) =
      FailureBookmarkState;
}
