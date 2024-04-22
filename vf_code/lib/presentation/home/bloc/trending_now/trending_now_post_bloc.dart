import 'package:bloc/bloc.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/domain/repository/post_repository.dart';

import 'trending_now_post_event.dart';
import 'trending_now_post_state.dart';

/// BLoC responsible for managing the state of trending posts in the application.
///
/// It handles events related to posts,
/// triggering state changes and interactions with the data layer.
class TrendingNowPostBloc
    extends Bloc<TrendingNowPostEvent, TrendingNowPostState> {
  TrendingNowPostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(TrendingNowPostState.initial()) {
    on<TrendingNowPostEvent>((events, emit) async {
      await events.map(
        fetchPosts: (event) async =>
            await _onFetchTrendingNowPosts(event, emit),
      );
    });
  }

  final PostRepository _postRepository;

  /// Handler for the [FetchTrendingNowPosts] event, responsible for fetching posts from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of posts
  /// and updates the state accordingly.
  Future<void> _onFetchTrendingNowPosts(
    FetchTrendingNowPosts event,
    Emitter<TrendingNowPostState> emit,
  ) async {
    await emit.forEach(
      _postRepository.getTrendingNowPosts(),
      onData: (List<ViewPost> posts) {
        return state.copyWith(
          status: TrendingNowPostStatus.success,
          posts: posts,
        );
      },
      onError: (_, __) => state.copyWith(status: TrendingNowPostStatus.failure),
    );
  }
}
