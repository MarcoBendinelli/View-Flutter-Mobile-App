import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/domain/repository/user_profile_repository.dart';

part 'follow_state.dart';

part 'follow_cubit.freezed.dart';

/// The [FollowCubit] is responsible for managing the following of an user.
/// It relies on the [UserProfileRepository] to perform the
/// actual following operation.
class FollowCubit extends Cubit<FollowState> {
  FollowCubit(this._userProfileRepository) : super(const FollowState.initial());

  final UserProfileRepository _userProfileRepository;

  /// Follow an user by saving it on the backend.
  ///
  /// #### Parameters:
  /// - [selectedUserId] : The ID of the post to be bookmarked.
  Future<void> followUser(String selectedUserId) async {
    emit(const LoadingFollowState());
    try {
      await _userProfileRepository.followUser(selectedUserId: selectedUserId);
      emit(const SuccessFollowState());
    } catch (e) {
      emit(FailureFollowState(errorMessage: e.toString()));
    }
  }
}
