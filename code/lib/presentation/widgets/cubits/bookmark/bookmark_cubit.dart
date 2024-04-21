import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/domain/repository/post_repository.dart';

part 'bookmark_state.dart';

part 'bookmark_cubit.freezed.dart';

/// The [BookmarkCubit] is responsible for managing the bookmarking of a post.
/// It relies on the [PostRepository] to perform the
/// actual bookmarking operation.
class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit(this._postRepository) : super(const InitialBookmarkState());

  final PostRepository _postRepository;

  /// Bookmark a post by saving it on the backend.
  ///
  /// #### Parameters:
  /// - [selectedPostId] : The ID of the post to be bookmarked.
  Future<void> bookmarkPost(String selectedPostId) async {
    emit(const LoadingBookmarkState());
    try {
      await _postRepository.bookmarkPost(selectedPostId: selectedPostId);
      emit(const SuccessBookmarkState());
    } catch (e) {
      emit(FailureBookmarkState(errorMessage: e.toString()));
    }
  }
}
