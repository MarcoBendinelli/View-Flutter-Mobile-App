import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:view_app/data/model/view_post.dart';

/// Abstract contract that defines the repository interface
/// for managing [ViewPost] fetching.
abstract class PostRepository {
  /// Retrieve a [Stream] of [ViewPost]s from contributors the user is following.
  ///
  /// #### Parameters:
  /// - [numOfPostsToDisplay] : The number of posts to display in the stream.
  Stream<List<ViewPost>> getFollowingPosts({required int numOfPostsToDisplay});

  /// Retrieve a [Stream] of [ViewPost]s based on user's selected filter.
  ///
  /// #### Parameters:
  /// - [numOfPostsToDisplay] : The number of posts to display in the stream.
  /// - [filter] : The filter to be applied to posts, such as `Newest` or a specific topic.
  Stream<List<ViewPost>> getForYouPosts(
      {required int numOfPostsToDisplay, required String filter});

  /// Retrieve a [Stream] of trending [ViewPost]s based on the number of saves.
  Stream<List<ViewPost>> getTrendingNowPosts();

  /// Retrieve the [Stream] of [ViewPost]s bookmarked by the user.
  ///
  /// #### Parameters:
  /// - [numOfPostsToDisplay] : The number of posts to display in the stream.
  Stream<List<ViewPost>> getBookmarkedPosts({required int numOfPostsToDisplay});

  /// Save on backend the bookmarked post by the current user.
  ///
  /// #### Parameters
  ///  - [selectedPostId] : The id of the selected post.
  Future<void> bookmarkPost({required String selectedPostId});

  /// Retrieve the [Stream] of [ViewPost]s searched by the user.
  ///
  /// #### Parameters:
  /// - [searchedText] : The input text to search the posts.
  /// - [numOfPostsToDisplay] : The number of posts to display in the stream.
  Stream<List<ViewPost>> getSearchedPosts(
      {required String searchedText, required int numOfPostsToDisplay});

  /// Save on backend the added post by the current user.
  ///
  /// #### Parameters:
  /// - [authorName] : The name of the post creator.
  /// - [title] : The title of the post to be added.
  /// - [subtitle] : The subtitle of the post to be added.
  /// - [image] : The image of the post to be added.
  /// - [topic] : The topic of the post to be added.
  /// - [body] : The body of the post to be added.
  /// - [readTime] : The estimated read time of the post.
  Future<void> saveNewPost(
      {required String authorName,
      required String title,
      required String subtitle,
      required XFile? image,
      required String topic,
      required String body,
      required String readTime});

  /// Retrieve the [Stream] of [ViewPost] specified by its identifier.
  ///
  /// #### Parameters:
  /// - [postId] : The id of the post to retrieve
  Stream<ViewPost> getPost({required String postId});

  /// Retrieve the [Stream] of [ViewPost]s published by the specified user.
  ///
  /// #### Parameters:
  /// - [userId] : The user id, publisher of the posts.
  /// - [numOfPostsToDisplay] : The number of posts to display in the stream.
  Stream<List<ViewPost>> getUserPosts(
      {required String userId, required int numOfPostsToDisplay});
}
