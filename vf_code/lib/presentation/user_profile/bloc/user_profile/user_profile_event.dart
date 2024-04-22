part of 'user_profile_bloc.dart';

/// Class representing events related to the [UserProfileBloc].
@freezed
class UserProfileEvent with _$UserProfileEvent {
  /// Event used to fetch the user profile from the DB.
  const factory UserProfileEvent.fetchUserProfile(String userId) =
      FetchUserProfile;
}
