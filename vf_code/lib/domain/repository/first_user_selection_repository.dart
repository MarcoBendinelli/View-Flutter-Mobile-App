import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/data/model/view_user.dart';

/// Abstract contract that defines the repository interface for managing the first user selections
/// during the sign up phase.
///
/// This repository provides methods for retrieving a list of topics from the [arb] file and saving
/// the user's selected topics to the backend.
abstract class FirstUserSelectionRepository {
  /// Gets the list of topics from the [arb] file
  List<ViewTopic> getTopics();

  /// Saves the selected topics on the backend.
  ///
  /// #### Parameters:
  ///   - [selectedTopics] : The selected topics by the user.
  Future<void> saveTopics({required List<ViewTopic> selectedTopics});

  /// Gets the list of most followed [ViewUser] as a [Stream].
  Stream<List<ViewUser>> getMostFollowedUsers();

  /// Saves the ids of the selected users in the backend.
  ///
  /// #### Parameters:
  ///   - [selectedUserId] : The selected user id to follow by the user.
  Future<void> saveUser({required String selectedUserId});
}
