import 'package:image_picker/image_picker.dart';
import 'package:view_app/data/model/view_user.dart';

/// Abstract contract that defines the repository interface
/// for managing [ViewUser] fetching.
abstract class UserProfileRepository {
  /// Retrieve the [Stream] of [ViewUser] specified by its identifier.
  ///
  /// #### Parameters:
  /// - [userId] : The id of the user to retrieve
  Stream<ViewUser> getUser({required String userId});

  /// Save on backend the followed contributor by the current user.
  ///
  /// #### Parameters
  ///  - [selectedUserId] : The id of the selected post.
  Future<void> followUser({required String selectedUserId});

  /// Update the information of the current user.
  ///
  /// #### Parameters
  ///  - [username] : The updated username of the current user.
  ///  - [profession] : The updated profession of the current user.
  ///  - [photoUrl] : The updated photo url of the current user.
  ///  - [topics] : The list of updated topics of the current user.
  Future<void> updateProfile(
      {required String username,
      required String profession,
      required List<String> topics,
      required XFile? photoUrl});
}
