import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:view_app/domain/repository/post_repository.dart';

part 'add_post_state.dart';

part 'add_post_cubit.freezed.dart';

/// The [AddPostCubit] is responsible for managing the adding of a post.
/// It relies on the [PostRepository] to access the backend.
class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this._postRepository) : super(const InitialAddPostState());

  final PostRepository _postRepository;

  /// Add a post by saving it on the backend.
  ///
  /// #### Parameters:
  /// - [authorName] : The name of the post creator.
  /// - [title] : The title of the post to be added.
  /// - [subtitle] : The subtitle of the post to be added.
  /// - [image] : The image of the post to be added.
  /// - [topic] : The topic of the post to be added.
  /// - [body] : The body of the post to be added.
  /// - [readTime] : The estimated read time of the post.
  Future<void> addPost(
      {required String authorName,
      required String title,
      required String subtitle,
      required XFile? image,
      required String topic,
      required String body,
      required String readTime}) async {
    emit(const LoadingAddPostState());
    try {
      await _postRepository.saveNewPost(
          authorName: authorName,
          title: title,
          subtitle: subtitle,
          image: image,
          topic: topic,
          body: body,
          readTime: readTime);
      emit(const SuccessAddPostState());
    } catch (e) {
      emit(FailureAddPostState(errorMessage: e.toString()));
    }
  }
}
