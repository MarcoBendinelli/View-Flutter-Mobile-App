import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';

part 'first_selection_state.dart';

part 'first_selection_cubit.freezed.dart';

/// The [FirstSelectionCubit] class provides methods to select, reset,
/// and save topics and users to the backend, updating the state accordingly.
class FirstSelectionCubit extends Cubit<FirstSelectionState> {
  FirstSelectionCubit(
      {required FirstUserSelectionRepository firstUserSelectionRepository})
      : _firstUserSelectionRepository = firstUserSelectionRepository,
        super(const FirstSelectionState());

  final FirstUserSelectionRepository _firstUserSelectionRepository;

  /// Selects or deselects a given [ViewTopic] and updates the state accordingly.
  ///
  /// If the topic is already selected, it will be deselected, and vice versa.
  void selectTopic({required ViewTopic topic}) {
    final List<ViewTopic> updatedTopics = List.from(state.selectedTopics);

    if (updatedTopics.contains(topic)) {
      updatedTopics.remove(topic);
    } else {
      updatedTopics.add(topic);
    }

    emit(state.copyWith(
      selectedTopics: updatedTopics,
    ));
  }

  /// Resets the list of selected topics to an empty list.
  void resetSelectedTopics() {
    emit(state.copyWith(selectedTopics: List.empty(growable: true)));
  }

  /// Saves the currently selected topics to the backend.
  void saveTopics({required List<ViewTopic> selectedTopics}) {
    try {
      _firstUserSelectionRepository.saveTopics(selectedTopics: selectedTopics);
    } catch (e) {
      emit(state.copyWith(status: FirstSelectionStatus.failure));
    }
  }

  /// Selects or deselects a given [ViewUser] and updates the state accordingly.
  /// The ids of the selected users are also saved on the backend.
  ///
  /// If the user is already selected, it will be deselected, and vice versa.
  void selectUser({required String userId}) async {
    try {
      final List<String> updatedUsersIds = List.from(state.selectedUsersIds);

      if (updatedUsersIds.contains(userId)) {
        updatedUsersIds.remove(userId);
      } else {
        updatedUsersIds.add(userId);
      }

      // Save the users on the backend
      await _firstUserSelectionRepository.saveUser(selectedUserId: userId);

      emit(state.copyWith(
        selectedUsersIds: updatedUsersIds,
      ));
    } catch (e) {
      emit(state.copyWith(status: FirstSelectionStatus.failure));
    }
  }
}
