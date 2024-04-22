import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/user_profile_repository.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

part 'user_profile_bloc.freezed.dart';

/// BLoC responsible for managing the user profile retrieval from the data layer.
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({required UserProfileRepository userRepository})
      : _userRepository = userRepository,
        super(UserProfileState.initial()) {
    on<UserProfileEvent>((events, emit) async {
      await events.map(
        fetchUserProfile: (event) async =>
            await _onFetchUserProfile(event, emit),
      );
    });
  }

  final UserProfileRepository _userRepository;

  /// Handler for the [FetchUserProfile] event, responsible for fetching the user from the data layer.
  ///
  /// This method uses the [_userRepository] to get the stream of user
  /// and updates the state accordingly.
  Future<void> _onFetchUserProfile(
    FetchUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    await emit.forEach(
      _userRepository.getUser(
        userId: event.userId,
      ),
      onData: (ViewUser user) {
        return state.copyWith(
          status: UserProfileStatus.success,
          user: user,
        );
      },
      onError: (_, __) => state.copyWith(status: UserProfileStatus.failure),
    );
  }
}
