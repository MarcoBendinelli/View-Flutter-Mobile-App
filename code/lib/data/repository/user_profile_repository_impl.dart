import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/cache/view_user_cache.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/user_profile_repository.dart';

/// Repository which manages user [ViewUser] fetching.
@Injectable(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl({
    required ViewUserCache viewUserCache,
    required FirebaseFirestore firebaseFirestore,
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
  })  : _viewUserCache = viewUserCache,
        _firebaseAuth = firebaseAuth,
        _firebaseStorage = firebaseStorage,
        _firestore = firebaseFirestore;

  final FirebaseFirestore _firestore;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  final ViewUserCache _viewUserCache;

  @override
  Stream<ViewUser> getUser({required String userId}) {
    return _firestore
        .collection(Constants.usersCollection)
        .doc(userId)
        .snapshots()
        .map((doc) {
      return ViewUser.fromFirestore(doc, null);
    });
  }

  @override
  Future<void> followUser({required String selectedUserId}) async {
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

  @override
  Future<void> updateProfile(
      {required String username,
      required String profession,
      required List<String> topics,
      required XFile? photoUrl}) async {
    final userId = _firebaseAuth.currentUser!.uid;
    final userRef =
        _firestore.collection(Constants.usersCollection).doc(userId);

    // Create a map to store the fields that need to be updated
    final Map<String, dynamic> updatedFields = {
      Constants.usersUsernameField: username,
      Constants.usersProfessionField: profession,
      Constants.usersTopicsField: topics
    };

    /// Update the User info inside the cache
    _viewUserCache.updateUserInfo(
        username: username, profession: profession, topics: topics);

    if (photoUrl != null) {
      String imageURL = await uploadImage(photoUrl, userRef.id);
      updatedFields[Constants.usersPhotoUrlField] = imageURL;
      _viewUserCache.updateUserInfo(photoUrl: imageURL);
    }

    // Perform the update
    await userRef.update(updatedFields);
  }

  /// Uploads an image to Firebase Storage under the [Constants.usersCollection]
  /// with the provided [id] and returns the download URL of the uploaded image
  /// upon successful upload. If any exception occurs during the upload process,
  /// an empty string is returned.
  ///
  /// #### Parameters:
  /// - [file] : The image file to be uploaded.
  /// - [id] : The identifier used to name the image in Firebase Storage.
  Future<String> uploadImage(XFile file, String id) async {
    String imageURL;
    final referenceImages =
        _firebaseStorage.ref().child(Constants.usersCollection);
    Reference imageRef = referenceImages.child(id);

    try {
      // Upload the image file to Firebase Storage.
      await imageRef.putFile(File(file.path));
      // Retrieve the download URL of the uploaded image.
      imageURL = await imageRef.getDownloadURL();
      return imageURL;
    } on Exception {
      return "";
    }
  }
}
