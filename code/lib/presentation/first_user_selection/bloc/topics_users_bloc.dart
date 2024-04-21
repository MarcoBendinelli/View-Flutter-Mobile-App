import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';

part 'topics_users_event.dart';

part 'topics_users_state.dart';

part 'topics_users_bloc.freezed.dart';

class TopicsUsersBloc extends Bloc<TopicsUsersEvent, TopicsUsersState> {
  TopicsUsersBloc(
      {required FirstUserSelectionRepository firstUserSelectionRepository})
      : _firstUserSelectionRepository = firstUserSelectionRepository,
        super(TopicsUsersState.initial()) {
    on<TopicsUsersEvent>((events, emit) async {
      await events.map(
        fetchUsers: (event) async => await _onFetchUsers(event, emit),
        loadTopics: (event) async => _onLoadTopics(event, emit),
      );
    });
  }

  final FirstUserSelectionRepository _firstUserSelectionRepository;

  Future<void> _onFetchUsers(
    TopicsUsersEvent event,
    Emitter<TopicsUsersState> emit,
  ) async {
    await emit.forEach(
      _firstUserSelectionRepository.getMostFollowedUsers(),
      onData: (List<ViewUser> users) {
        return state.copyWith(
          status: TopicsUsersStatus.success,
          users: users,
        );
      },
      onError: (_, __) => state.copyWith(status: TopicsUsersStatus.failure),
    );
  }

  void _onLoadTopics(
    TopicsUsersEvent event,
    Emitter<TopicsUsersState> emit,
  ) {
    emit(state.copyWith(
      status: TopicsUsersStatus.success,
      topics: _firstUserSelectionRepository.getTopics(),
    ));
  }
}
