import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/domain/repository/post_repository.dart';

part 'post_event.dart';

part 'post_state.dart';

part 'post_bloc.freezed.dart';

/// BLoC responsible for managing the post retrieval from the data layer.
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(PostState.initial()) {
    on<PostEvent>((events, emit) async {
      await events.map(
        fetchPost: (event) async => await _onFetchPost(event, emit),
      );
    });
  }

  final PostRepository _postRepository;

  /// Handler for the [FetchPost] event, responsible for fetching the post from the data layer.
  ///
  /// This method uses the [_postRepository] to get the stream of post
  /// and updates the state accordingly.
  Future<void> _onFetchPost(
    FetchPost event,
    Emitter<PostState> emit,
  ) async {
    await emit.forEach(
      _postRepository.getPost(postId: event.postId),
      onData: (ViewPost post) {
        return state.copyWith(
          status: PostStatus.success,
          post: post,
        );
      },
      onError: (_, __) => state.copyWith(status: PostStatus.failure),
    );
  }
}
