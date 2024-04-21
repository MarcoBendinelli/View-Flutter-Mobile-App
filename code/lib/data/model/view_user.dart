import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/core/constants.dart';

part 'view_user.freezed.dart';

/// User model representing an authenticated user in the application.
///
/// The [ViewUser] class encapsulates information about an authenticated user,
/// including their unique identifier ([id]), email address ([email]),
/// display name ([username]), the creation [Timestamp] ([createdAt]),
/// and a URL for their photo ([photoUrl]).
/// This model contains also strictly app related information, such as:
/// the interested [topics], the [following] and the [followers].
/// [ViewUser.empty] represents an unauthenticated user.
@freezed
class ViewUser with _$ViewUser {
  const factory ViewUser({
    required String id,
    required String email,
    required String username,
    required String profession,
    required String photoUrl,
    required List<String> topics,
    required List<String> following,
    required List<String> followers,
    required Timestamp createdAt,
  }) = _ViewUser;

  const ViewUser._();

  /// Empty user which represents an unauthenticated user.
  static final empty = ViewUser(
    id: '',
    email: '',
    username: '',
    profession: '',
    photoUrl: '',
    topics: const [],
    following: const [],
    followers: const [],
    createdAt: Timestamp(0, 0),
  );

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == ViewUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != ViewUser.empty;

  factory ViewUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ViewUser(
      email: data?[Constants.usersEmailField],
      id: snapshot.id,
      username: data?[Constants.usersUsernameField],
      profession: data?[Constants.usersProfessionField],
      photoUrl: data?[Constants.usersPhotoUrlField],
      topics: List.from(data?[Constants.usersTopicsField]),
      following: List.from(data?[Constants.usersFollowingField]),
      followers: List.from(data?[Constants.usersFollowersField]),
      createdAt: data?[Constants.usersCreatedAtField],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Constants.usersIdField: id,
      Constants.usersEmailField: email,
      Constants.usersUsernameField: username,
      Constants.usersProfessionField: profession,
      Constants.usersPhotoUrlField: photoUrl,
      Constants.usersTopicsField: topics,
      Constants.usersFollowingField: following,
      Constants.usersFollowersField: followers,
      Constants.usersCreatedAtField: createdAt,
    };
  }
}
