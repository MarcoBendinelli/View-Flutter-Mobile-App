import 'package:bloc/bloc.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';

/// Simple [Cubit] to retrieve the list of topics from the repository.
class TopicsCubit extends Cubit<List<String>> {
  TopicsCubit(this._firstUserSelectionRepository) : super([]);

  final FirstUserSelectionRepository _firstUserSelectionRepository;

  /// Get the list of sorted topics.
  void getTopics() {
    List<String> sortedTopics = List.from(
        _firstUserSelectionRepository.getTopics().map((e) => e.topicName));
    sortedTopics.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    emit(sortedTopics);
  }
}
