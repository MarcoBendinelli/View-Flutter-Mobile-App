import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/domain/repository/post_repository.dart';

part 'user_posts_event.dart';

part 'user_posts_state.dart';

part 'user_posts_bloc.freezed.dart';

/// BLoC responsible for managing the user posts retrieval from the data layer.
class UserPostsBloc extends Bloc<UserPostsEvent, UserPostsState> {
  UserPostsBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(UserPostsState.initial()) {
    on<UserPostsEvent>((events, emit) async {
      await events.map(
        fetchUserPosts: (event) async => await _onFetchUserPosts(event, emit),
      );
    });
  }

  final PostRepository _postRepository;

  /// Handler for the [FetchUserPosts] event, responsible for fetching the user posts from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of user posts
  /// and updates the state accordingly.
  Future<void> _onFetchUserPosts(
    FetchUserPosts event,
    Emitter<UserPostsState> emit,
  ) async {
    await emit.forEach(
      _postRepository.getUserPosts(
        userId: event.userId,
        numOfPostsToDisplay: state.posts.isEmpty
            ? Constants.userPostsLimitRate
            : state.posts.length + Constants.morePostsLimitRate,
      ),
      onData: (List<ViewPost> posts) {
        bool hasMoreData;
        // There are no more posts on the backend.
        if (posts.length < Constants.userPostsLimitRate) {
          hasMoreData = false;
        } else {
          // Check if there are more posts not already present in the state.
          hasMoreData = posts
              .any((post) => !state.posts.map((e) => e.id).contains(post.id));
        }
        return state.copyWith(
          status: UserPostsStatus.success,
          posts: posts,
          hasMoreData: hasMoreData,
        );
      },
      onError: (_, __) => state.copyWith(status: UserPostsStatus.failure),
    );
  }
}
