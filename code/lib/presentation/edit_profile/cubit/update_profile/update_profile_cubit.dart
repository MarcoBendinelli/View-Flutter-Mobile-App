import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:view_app/domain/repository/user_profile_repository.dart';

part 'update_profile_state.dart';

part 'update_profile_cubit.freezed.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._userProfileRepository)
      : super(const UpdateProfileState.initial());

  final UserProfileRepository _userProfileRepository;

  /// Update the user information saved on backend.
  ///
  /// #### Parameters
  ///  - [username] : The updated username of the current user.
  ///  - [profession] : The updated profession of the current user.
  ///  - [photoUrl] : The updated photo url of the current user.
  ///  - [topics] : The list of updated topics of the current user.
  Future<void> updateProfile(
      {required String newUsername,
      required String newProfession,
      required XFile? newUserImage,
      required List<String> newTopics}) async {
    emit(const LoadingUpdateProfileState());
    try {
      await _userProfileRepository.updateProfile(
          username: newUsername,
          profession: newProfession,
          photoUrl: newUserImage,
          topics: newTopics);
      emit(const SuccessUpdateProfileState());
    } catch (_) {
      emit(const FailureUpdateProfileState());
    }
  }
}
