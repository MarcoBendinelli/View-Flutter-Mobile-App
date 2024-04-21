import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/domain/repository/post_repository.dart';

part 'bookmarked_post_event.dart';

part 'bookmarked_post_state.dart';

part 'bookmarked_post_bloc.freezed.dart';

/// BLoC responsible for managing the state of bookmarked posts in the application.
///
/// It handles events related to bookmarked posts
/// triggering state changes and interactions with the data layer.
class BookmarkedPostBloc
    extends Bloc<BookmarkedPostEvent, BookmarkedPostState> {
  BookmarkedPostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(BookmarkedPostState.initial()) {
    on<BookmarkedPostEvent>((events, emit) async {
      await events.map(
        fetchPosts: (event) async => await _onFetchBookmarkedPosts(event, emit),
      );
    });
  }

  final PostRepository _postRepository;

  /// Handler for the [FetchBookmarkedPosts] event, responsible for fetching posts from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of posts
  /// and updates the state accordingly.
  Future<void> _onFetchBookmarkedPosts(
      FetchBookmarkedPosts event, Emitter<BookmarkedPostState> emit) async {
    await emit.forEach(
      _postRepository.getBookmarkedPosts(
        numOfPostsToDisplay: state.posts.isEmpty
            ? Constants.bookmarkedPostsLimitRate
            : state.posts.length + Constants.morePostsLimitRate,
      ),
      onData: (List<ViewPost> posts) {
        bool hasMoreData;
        // There are no more posts on the backend.
        if (posts.length < Constants.bookmarkedPostsLimitRate) {
          hasMoreData = false;
        } else {
          // Check if there are more posts not already present in the state.
          hasMoreData = posts
              .any((post) => !state.posts.map((e) => e.id).contains(post.id));
        }
        return state.copyWith(
          status: BookmarkedPostStatus.success,
          posts: posts,
          hasMoreData: hasMoreData,
        );
      },
      onError: (_, __) => state.copyWith(status: BookmarkedPostStatus.failure),
    );
  }
}
