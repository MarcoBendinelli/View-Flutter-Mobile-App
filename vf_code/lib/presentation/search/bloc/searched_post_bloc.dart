import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/domain/repository/post_repository.dart';

part 'searched_post_event.dart';

part 'searched_post_state.dart';

part 'searched_post_bloc.freezed.dart';

/// BLoC responsible for managing the state of searched posts in the application.
///
/// It handles events related to searched posts
/// triggering state changes and interactions with the data layer.
class SearchedPostBloc extends Bloc<SearchedPostEvent, SearchedPostState> {
  SearchedPostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(SearchedPostState.initial()) {
    on<SearchedPostEvent>((events, emit) async {
      await events.map(
        fetchMorePosts: (event) async => await _onFetchMorePosts(event, emit),
        searchPosts: (event) async => await _onFetchSearchPosts(event, emit),
        clearSearchResults: (event) async =>
            await _onClearSearchResults(event, emit),
      );
    });
  }

  final PostRepository _postRepository;

  /// Handler for the [FetchMorePosts] event, responsible for fetching more posts from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of posts
  /// and updates the state accordingly.
  Future<void> _onFetchMorePosts(
      FetchMorePosts event, Emitter<SearchedPostState> emit) async {
    await emit.forEach(
      _postRepository.getSearchedPosts(
          searchedText: event.searchedText.toLowerCase(),
          numOfPostsToDisplay:
              state.posts.length + Constants.searchedPostsLimitRate),
      onData: (List<ViewPost> posts) {
        bool hasMoreData;
        // There are no more posts on the backend.
        if (posts.length < Constants.searchedPostsLimitRate) {
          hasMoreData = false;
        } else {
          // Check if there are more posts not already present in the state.
          hasMoreData = posts
              .any((post) => !state.posts.map((e) => e.id).contains(post.id));
        }
        return state.copyWith(
          status: SearchedPostStatus.success,
          posts: posts,
          hasMoreData: hasMoreData,
        );
      },
      onError: (_, __) => state.copyWith(status: SearchedPostStatus.failure),
    );
  }

  /// Handler for the [SearchPosts] event, responsible for searching posts from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of posts
  /// and updates the state accordingly.
  Future<void> _onFetchSearchPosts(
      SearchPosts event, Emitter<SearchedPostState> emit) async {
    await emit.forEach(
      _postRepository.getSearchedPosts(
          searchedText: event.searchedText.toLowerCase(),
          numOfPostsToDisplay: Constants.searchedPostsLimitRate),
      onData: (List<ViewPost> posts) {
        bool hasMoreData;
        // There are no more posts on the backend.
        if (posts.length < Constants.searchedPostsLimitRate) {
          hasMoreData = false;
        } else {
          // Check if there are more posts not already present in the state.
          hasMoreData = posts
              .any((post) => !state.posts.map((e) => e.id).contains(post.id));
        }
        return state.copyWith(
          status: SearchedPostStatus.success,
          posts: posts,
          hasMoreData: hasMoreData,
        );
      },
      onError: (_, __) => state.copyWith(status: SearchedPostStatus.failure),
    );
  }

  /// Handler for the [ClearSearchResults] event, responsible for clearing
  /// the view from the searched results.
  Future<void> _onClearSearchResults(
      ClearSearchResults event, Emitter<SearchedPostState> emit) async {
    emit(state.copyWith(status: SearchedPostStatus.initial, posts: []));
  }
}
