import 'package:bloc/bloc.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/domain/repository/post_repository.dart';

import 'following_post_event.dart';
import 'following_post_state.dart';

/// BLoC responsible for managing the state of following posts in the application.
///
/// It handles events related to posts,
/// triggering state changes and interactions with the data layer.
class FollowingPostBloc extends Bloc<FollowingPostEvent, FollowingPostState> {
  FollowingPostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(FollowingPostState.initial()) {
    on<FollowingPostEvent>((events, emit) async {
      await events.map(
        fetchPosts: (event) async => await _onFetchFollowingPosts(event, emit),
      );
    });
  }

  final PostRepository _postRepository;

  /// Handler for the [FetchFollowingPosts] event, responsible for fetching posts from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of posts
  /// and updates the state accordingly.
  Future<void> _onFetchFollowingPosts(
    FetchFollowingPosts event,
    Emitter<FollowingPostState> emit,
  ) async {
    await emit.forEach(
      _postRepository.getFollowingPosts(
          numOfPostsToDisplay: state.posts.isEmpty
              ? Constants.followingPostsLimitRate
              : state.posts.length + Constants.morePostsLimitRate),
      onData: (List<ViewPost> posts) {
        bool hasMoreData;
        // There are no more posts on the backend.
        if (posts.length < Constants.followingPostsLimitRate) {
          hasMoreData = false;
        } else {
          // Check if there are more posts not already present in the state.
          hasMoreData = posts
              .any((post) => !state.posts.map((e) => e.id).contains(post.id));
        }
        return state.copyWith(
          status: FollowingPostStatus.success,
          posts: posts,
          hasMoreData: hasMoreData,
        );
      },
      onError: (_, __) => state.copyWith(status: FollowingPostStatus.failure),
    );
  }
}
