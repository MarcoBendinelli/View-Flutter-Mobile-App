part of 'user_profile_bloc.dart';

enum UserProfileStatus { initial, success, failure }

/// Represents the state of the [UserProfileBloc].
///
/// It includes information such as the current status and the retrieved user posts.
@freezed
class UserProfileState with _$UserProfileState {
  factory UserProfileState({
    required UserProfileStatus status,
    ViewUser? user,
  }) = _UserState;

  factory UserProfileState.initial() => UserProfileState(
        status: UserProfileStatus.initial,
        user: null,
      );
}
