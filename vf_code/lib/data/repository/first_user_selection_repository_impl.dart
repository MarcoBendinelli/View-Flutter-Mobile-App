import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/cache/view_user_cache.dart';
import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';

/// Repository which manages user first selections.
@Injectable(as: FirstUserSelectionRepository)
class FirstUserSelectionRepositoryImpl implements FirstUserSelectionRepository {
  FirstUserSelectionRepositoryImpl(
      {required ViewUserCache viewUserCache,
      required firebase_auth.FirebaseAuth firebaseAuth,
      required FirebaseFirestore firebaseFirestore,
      required String topicsFromArb})
      : _viewUserCache = viewUserCache,
        _firebaseAuth = firebaseAuth,
        _firestore = firebaseFirestore {
    _viewTopics.addAll(
        topicsFromArb.split(':').map((topic) => ViewTopic(topicName: topic)));
  }

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final List<ViewTopic> _viewTopics = [];
  final ViewUserCache _viewUserCache;

  @override
  List<ViewTopic> getTopics() {
    return List.from(_viewTopics);
  }

  @override
  Future<void> saveTopics({required List<ViewTopic> selectedTopics}) async {
    /// Update the User info on Firestore
    final userRef = _firestore
        .collection(Constants.usersCollection)
        .doc(_firebaseAuth.currentUser?.uid);
    await userRef.update({
      Constants.usersTopicsField:
          selectedTopics.map((e) => e.topicName).toList()
    });

    /// Update the User info inside the cache
    _viewUserCache.updateUserInfo(
        topics: selectedTopics.map((topic) => topic.topicName).toList());
  }

  @override
  Stream<List<ViewUser>> getMostFollowedUsers() async* {
    // Iterate over the values emitted by the stream.
    // It awaits the next value in the stream, and when a new value is available,
    // it executes the code block inside the loop.
    await for (QuerySnapshot snapshot in _firestore
        .collection(Constants.usersCollection)
        .where(Constants.usersIdField,
            isNotEqualTo: _firebaseAuth.currentUser?.uid)
        .orderBy(Constants.usersIdField, descending: true)
        .orderBy(Constants.usersCreatedAtField, descending: true)
        // It emits a new value whenever there's a change in the collection.
        .snapshots()) {
      List<ViewUser> users = snapshot.docs
          .map((doc) => ViewUser.fromFirestore(
              doc as DocumentSnapshot<Map<String, dynamic>>, null))
          .toList();

      // Sort users based on the size of their "followers" array in descending order.
      users.sort((a, b) => b.followers.length.compareTo(a.followers.length));

      // Take the top N users.
      List<ViewUser> mostFollowedUsers =
          users.take(Constants.numOfMostFollowedUsersToDisplay).toList();

      yield mostFollowedUsers;
    }
  }

  @override
  Future<void> saveUser({required String selectedUserId}) async {
    final currentUserId = _firebaseAuth.currentUser!.uid;
    final userRef =
        _firestore.collection(Constants.usersCollection).doc(currentUserId);
    final userToFollowRef =
        _firestore.collection(Constants.usersCollection).doc(selectedUserId);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userRef);

      final userFollowing =
          List.from((snapshot.get(Constants.usersFollowingField)));

      if (userFollowing.contains(selectedUserId)) {
        // If the user is already in the array, remove it
        transaction.update(
          userRef,
          {
            Constants.usersFollowingField:
                FieldValue.arrayRemove([selectedUserId])
          },
        );
        // Update the User info inside the cache
        final currentFollowing =
            List<String>.from(_viewUserCache.data.following);
        currentFollowing.remove(selectedUserId);
        _viewUserCache.updateUserInfo(
          following: currentFollowing,
        );
        // Update also the "User to Support" Following array
        transaction.update(
          userToFollowRef,
          {
            Constants.usersFollowersField:
                FieldValue.arrayRemove([currentUserId])
          },
        );
      } else {
        // If the user is not in the array, add it
        transaction.update(
          userRef,
          {
            Constants.usersFollowingField:
                FieldValue.arrayUnion([selectedUserId])
          },
        );
        // Update the User info inside the cache
        final currentFollowing =
            List<String>.from(_viewUserCache.data.following);
        currentFollowing.add(selectedUserId);
        _viewUserCache.updateUserInfo(
          following: currentFollowing,
        );
        // Update also the "User to Support" Following array
        transaction.update(
          userToFollowRef,
          {
            Constants.usersFollowersField:
                FieldValue.arrayUnion([currentUserId])
          },
        );
      }
    });
  }
}
