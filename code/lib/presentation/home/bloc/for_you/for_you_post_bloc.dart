import 'package:bloc/bloc.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/domain/repository/post_repository.dart';

import 'for_you_post_event.dart';
import 'for_you_post_state.dart';

/// BLoC responsible for managing the state of for you posts in the application.
///
/// It handles events related to posts,
/// triggering state changes and interactions with the data layer.
class ForYouPostBloc extends Bloc<ForYouPostEvent, ForYouPostState> {
  ForYouPostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(ForYouPostState.initial()) {
    on<ForYouPostEvent>((events, emit) async {
      await events.map(
        fetchPosts: (event) async => await _onFetchForYouPosts(event, emit),
      );
    });
  }

  final PostRepository _postRepository;

  /// Handler for the [FetchForYouPosts] event, responsible for fetching posts from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of posts
  /// and updates the state accordingly.
  Future<void> _onFetchForYouPosts(
    FetchForYouPosts event,
    Emitter<ForYouPostState> emit,
  ) async {
    await emit.forEach(
      _postRepository.getForYouPosts(
          numOfPostsToDisplay: state.posts.isEmpty
              ? Constants.forYouPostsLimitRate
              : state.posts.length + Constants.morePostsLimitRate,
          filter: event.filter),
      onData: (List<ViewPost> posts) {
        bool hasMoreData;
        // There are no more posts on the backend.
        if (posts.length < Constants.forYouPostsLimitRate) {
          hasMoreData = false;
        } else {
          // Check if there are more posts not already present in the state.
          hasMoreData = posts
              .any((post) => !state.posts.map((e) => e.id).contains(post.id));
        }
        return state.copyWith(
          status: ForYouPostStatus.success,
          posts: posts,
          hasMoreData: hasMoreData,
        );
      },
      onError: (_, __) => state.copyWith(status: ForYouPostStatus.failure),
    );
  }
}
