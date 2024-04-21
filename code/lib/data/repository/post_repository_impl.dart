import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/domain/repository/post_repository.dart';

/// Repository which manages user [ViewPost] fetching.
@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required FirebaseFirestore firebaseFirestore,
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseStorage firebaseStorage,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firebaseFirestore,
        _firebaseStorage = firebaseStorage;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  @override
  Stream<List<ViewPost>> getFollowingPosts(
      {required int numOfPostsToDisplay}) async* {
    final userDocRef = _firestore
        .collection(Constants.usersCollection)
        .doc(_firebaseAuth.currentUser!.uid);
    List<String> followingIdsUsers = [];

    // Retrieve the IDs of contributors the user is following.
    await userDocRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        followingIdsUsers = List.from(data[Constants.usersFollowingField]);
      },
    );

    // [whereIn] filter requires a non empty [Iterable].
    if (followingIdsUsers.isEmpty) {
      followingIdsUsers = ["Default"];
    }

    yield* _firestore
        .collection(Constants.postsCollection)
        .orderBy(Constants.postsCreatedAtField, descending: true)
        .where(Constants.postsAuthorIdField, whereIn: followingIdsUsers)
        .limit(numOfPostsToDisplay)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ViewPost.fromFirestore(doc, null))
          .toList();
    });
  }

  @override
  Stream<List<ViewPost>> getForYouPosts(
      {required int numOfPostsToDisplay, required String filter}) {
    if (filter == Constants.newestFilter || filter == "Nuovi") {
      return _firestore
          .collection(Constants.postsCollection)
          .orderBy(Constants.postsAuthorIdField, descending: true)
          .where(Constants.postsAuthorIdField,
              isNotEqualTo: _firebaseAuth.currentUser?.uid)
          .orderBy(Constants.postsCreatedAtField, descending: true)
          .limit(numOfPostsToDisplay)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => ViewPost.fromFirestore(doc, null))
            .toList();
      });
    } else {
      return _firestore
          .collection(Constants.postsCollection)
          .where(Constants.postsTopicField, isEqualTo: filter)
          .where(Constants.postsAuthorIdField,
              isNotEqualTo: _firebaseAuth.currentUser?.uid)
          .orderBy(Constants.postsAuthorIdField, descending: true)
          .orderBy(Constants.postsCreatedAtField, descending: true)
          .limit(numOfPostsToDisplay)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => ViewPost.fromFirestore(doc, null))
            .toList();
      });
    }
  }

  @override
  Stream<List<ViewPost>> getTrendingNowPosts() async* {
    yield* _firestore
        .collection(Constants.postsCollection)
        .where(Constants.postsAuthorIdField,
            isNotEqualTo: _firebaseAuth.currentUser?.uid)
        .orderBy(Constants.postsAuthorIdField, descending: true)
        .orderBy(Constants.postsCreatedAtField, descending: true)
        .snapshots()
        .asyncMap(_postFromSnapshot);
  }

  /// Convert a query snapshot of posts to a list of [ViewPost] objects.
  ///
  /// Additionally, retrieve the top two posts based on the number of saves
  /// and sort the posts in the order specified by the top2PostIds list.
  ///
  /// #### Parameters:
  /// - [snapshot]: The query snapshot of posts from Firestore.
  Future<List<ViewPost>> _postFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) async {
    final QuerySnapshot<Map<String, dynamic>> postsSnapshot =
        await _firestore.collection(Constants.postsCollection).get();
    // Map to store the count of bookmarked posts for each post ID.
    List<String> top2PostIds = ["Default"];

    // Sort posts by the number of users who bookmarked them in descending order.
    final List<DocumentSnapshot<Map<String, dynamic>>> sortedPosts =
        postsSnapshot.docs
          ..sort((a, b) => (a[Constants.postsBookmarkedByField] as List)
              .length
              .compareTo((b[Constants.postsBookmarkedByField] as List).length));

    // Retrieve the top two posts from the sorted list.
    final topTwoPosts = sortedPosts.length >= 2
        ? sortedPosts.sublist(sortedPosts.length - 2).reversed
        : sortedPosts;

    if (topTwoPosts.isNotEmpty) {
      top2PostIds = topTwoPosts.map((snapshot) => snapshot.id).toList();
    }

    // Retrieve the posts from the snapshot.
    final List<ViewPost> trendingPosts = snapshot.docs
        .map((doc) => ViewPost.fromFirestore(doc, null))
        .where((post) => top2PostIds.contains(post.id))
        .toList();

    // Sort the posts based on their order in top2PostIds list.
    trendingPosts.sort((a, b) =>
        top2PostIds.indexOf(a.id).compareTo(top2PostIds.indexOf(b.id)));

    return trendingPosts;
  }

  @override
  Stream<List<ViewPost>> getBookmarkedPosts(
      {required int numOfPostsToDisplay}) {
    return _firestore
        .collection(Constants.postsCollection)
        .where(Constants.postsBookmarkedByField,
            arrayContains: _firebaseAuth.currentUser?.uid)
        .orderBy(Constants.postsCreatedAtField, descending: true)
        .limit(numOfPostsToDisplay)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ViewPost.fromFirestore(doc, null))
          .toList();
    });
  }

  @override
  Future<void> bookmarkPost({required String selectedPostId}) async {
    final postRef =
        _firestore.collection(Constants.postsCollection).doc(selectedPostId);
    final currentUserId = _firebaseAuth.currentUser!.uid;

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(postRef);
      final bookmarkedByUsers =
          List.from((snapshot.get(Constants.postsBookmarkedByField)));

      if (bookmarkedByUsers.contains(currentUserId)) {
        // If the post is already in the array, remove it
        transaction.update(
          postRef,
          {
            Constants.postsBookmarkedByField:
                FieldValue.arrayRemove([currentUserId])
          },
        );
      } else {
        // If the post is not in the array, add it
        transaction.update(
          postRef,
          {
            Constants.postsBookmarkedByField:
                FieldValue.arrayUnion([currentUserId])
          },
        );
      }
    });
  }

  @override
  Stream<List<ViewPost>> getSearchedPosts(
      {required String searchedText, required int numOfPostsToDisplay}) {
    return _firestore
        .collection(Constants.postsCollection)
        .orderBy(Constants.postsAuthorIdField, descending: true)
        .where(Constants.postsAuthorIdField,
            isNotEqualTo: _firebaseAuth.currentUser?.uid)
        .orderBy(Constants.postsCreatedAtField, descending: true)
        .limit(numOfPostsToDisplay)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ViewPost.fromFirestore(doc, null))
          .where((post) =>
              post.authorName.toLowerCase().contains(searchedText) ||
              post.title.toLowerCase().contains(searchedText) ||
              post.subtitle.toLowerCase().contains(searchedText) ||
              post.topic.topicName.toLowerCase().contains(searchedText))
          .toList();
    });
  }

  @override
  Future<void> saveNewPost(
      {required String authorName,
      required String title,
      required String subtitle,
      required XFile? image,
      required String topic,
      required String body,
      required String readTime}) async {
    final postRef = _firestore
        .collection(Constants.postsCollection)
        .withConverter(
            fromFirestore: ViewPost.fromFirestore,
            toFirestore: (ViewPost post, options) => post.toMap())
        .doc();

    await postRef.set(ViewPost(
        authorId: _firebaseAuth.currentUser!.uid,
        authorName: authorName,
        authorPhotoUrl: '',
        id: '',
        title: title,
        subtitle: subtitle,
        body: body,
        imageUrl: '',
        createdAt: Timestamp.now(),
        topic: ViewTopic(topicName: topic),
        readTime: readTime,
        bookmarkedBy: []));
    await postRef.update({Constants.postsIdField: postRef.id});

    if (image != null) {
      String imageURL = await uploadImage(image, postRef.id);
      await postRef.update({Constants.postsImageUrlField: imageURL});
    }
  }

  /// Uploads an image to Firebase Storage under the [Constants.postsCollection]
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
        _firebaseStorage.ref().child(Constants.postsCollection);
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

  @override
  Stream<ViewPost> getPost({required String postId}) {
    return _firestore
        .collection(Constants.postsCollection)
        .doc(postId)
        .snapshots()
        .map((doc) {
      return ViewPost.fromFirestore(doc, null);
    });
  }

  @override
  Stream<List<ViewPost>> getUserPosts(
      {required String userId, required int numOfPostsToDisplay}) {
    return _firestore
        .collection(Constants.postsCollection)
        .where(Constants.postsAuthorIdField, isEqualTo: userId)
        .orderBy(Constants.postsCreatedAtField, descending: true)
        .limit(numOfPostsToDisplay)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ViewPost.fromFirestore(doc, null))
          .toList();
    });
  }
}
