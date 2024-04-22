part of 'first_selection_cubit.dart';

enum FirstSelectionStatus { initial, success, failure }

/// The [FirstSelectionState] class represents the state related to the selection of topics and users.
///
/// It includes a list of [ViewTopic] objects representing the currently selected topics
/// and a list of users representing the selected contributors.
@freezed
class FirstSelectionState with _$FirstSelectionState {
  const factory FirstSelectionState({
    @Default([]) List<ViewTopic> selectedTopics,
    @Default([]) List<String> selectedUsersIds,
    @Default(FirstSelectionStatus.initial) FirstSelectionStatus status,
  }) = _FirstSelectionState;
}
