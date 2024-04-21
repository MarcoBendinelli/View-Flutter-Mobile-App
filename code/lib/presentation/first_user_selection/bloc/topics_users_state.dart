part of 'topics_users_bloc.dart';

enum TopicsUsersStatus { initial, success, failure }

@freezed
class TopicsUsersState with _$TopicsUsersState {
  factory TopicsUsersState({
    required TopicsUsersStatus status,
    List<ViewTopic>? topics,
    List<ViewUser>? users,
  }) = _TopicsUsersState;

  factory TopicsUsersState.initial() => TopicsUsersState(
        status: TopicsUsersStatus.initial,
        topics: const [],
        users: const [],
      );
}
