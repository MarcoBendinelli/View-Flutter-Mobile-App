part of 'topics_users_bloc.dart';

@freezed
class TopicsUsersEvent with _$TopicsUsersEvent {
  const factory TopicsUsersEvent.loadTopics() = LoadTopics;
  const factory TopicsUsersEvent.fetchUsers() = FetchUsers;
}
