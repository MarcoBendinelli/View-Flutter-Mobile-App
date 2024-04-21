import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:view_app/data/model/view_user.dart';

/// An in-memory cache client.
///
/// Represents a simple in-memory cache for storing a single [ViewUser] instance.
@lazySingleton
class ViewUserCache {
  /// The in-memory cache used to store the [ViewUser].
  ViewUser data = ViewUser.empty;

  /// Writes the provided [value] to the in-memory cache.
  ///
  /// #### Parameters:
  /// [value] : The [ViewUser] to be stored in the cache.
  void write({required ViewUser value}) {
    data = value;
  }

  /// Reads the [ViewUser] from the in-memory cache.
  ///
  /// Return The current [ViewUser] stored in the cache.
  ViewUser read() => data;

  /// Updates the User info inside the cache.
  ///
  /// The [updateUserInfo] method modifies the information of the [ViewUser] in the cache.
  /// It allows updating specific attributes of the user, such as email, username, etc.
  ///
  /// #### Parameters:
  /// [email] : New email value.
  /// [username] : New username value.
  /// [profession] : New profession value.
  /// [photoUrl] : New photo URL value.
  /// [topics] : New list of topics.
  /// [following] : List of selected user IDs.
  /// [followers] : New list of followers.
  /// [createdAt] : New creation timestamp.
  void updateUserInfo({
    String? email,
    String? username,
    String? profession,
    String? photoUrl,
    List<String>? topics,
    List<String>? following,
    List<String>? followers,
    Timestamp? createdAt,
  }) {
    final viewUser = read();

    write(
      value: viewUser.copyWith(
        email: email ?? viewUser.email,
        username: username ?? viewUser.username,
        profession: profession ?? viewUser.profession,
        photoUrl: photoUrl ?? viewUser.photoUrl,
        topics: topics ?? viewUser.topics,
        following: following ?? viewUser.following,
        followers: followers ?? viewUser.followers,
        createdAt: createdAt ?? viewUser.createdAt,
      ),
    );
  }
}
