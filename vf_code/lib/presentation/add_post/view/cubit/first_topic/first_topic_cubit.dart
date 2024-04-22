import 'package:bloc/bloc.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';

/// Simple [Cubit] to retrieve the first topic from the repository.
class FirstTopicCubit extends Cubit<String> {
  FirstTopicCubit(this._firstUserSelectionRepository) : super("");

  final FirstUserSelectionRepository _firstUserSelectionRepository;

  /// Get the first topic.
  void getFirstTopic() {
    List<String> sortedTopics = List.from(
        _firstUserSelectionRepository.getTopics().map((e) => e.topicName));
    sortedTopics.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    emit(sortedTopics[0]);
  }
}
