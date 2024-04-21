import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_topic.dart';

/// Data class representing a post in the application.
///
/// The [ViewPost] class is an immutable representation of a post, containing
/// information such as [authorId], [authorName], [authorPhotoUrl], post [id], [title], [subtitle], [body],
/// [imageUrl], [topic], [createdAt], list of users ids that saved the post ([bookmarkedBy]),
/// and estimated reading time in hours ([readTime]).
final class ViewPost {
  const ViewPost({
    required this.authorId,
    required this.authorName,
    required this.authorPhotoUrl,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.imageUrl,
    required this.createdAt,
    required this.topic,
    required this.readTime,
    required this.bookmarkedBy,
  });

  /// The id of the author.
  final String authorId;

  /// The name of the author.
  final String authorName;

  /// The photo url of the author.
  final String authorPhotoUrl;

  /// The id of the post.
  final String id;

  /// The title of the post.
  final String title;

  /// The subtitle of the post.
  final String subtitle;

  /// The body of the post.
  final String body;

  /// The image url of the post.
  final String imageUrl;

  /// The timestamp of the post.
  final Timestamp createdAt;

  /// The topic of the post.
  final ViewTopic topic;

  /// The estimated read time of the post.
  final String readTime;

  /// List of users ids that saved the post.
  final List<String> bookmarkedBy;

  factory ViewPost.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ViewPost(
      authorId: data?[Constants.postsAuthorIdField],
      authorName: data?[Constants.postsAuthorNameField],
      authorPhotoUrl: data?[Constants.postsAuthorPhotoUrlField],
      id: snapshot.id,
      title: data?[Constants.postsTitleField],
      subtitle: data?[Constants.postsSubtitleField],
      body: data?[Constants.postsBodyField],
      imageUrl: data?[Constants.postsImageUrlField],
      createdAt: data?[Constants.postsCreatedAtField],
      topic: ViewTopic(topicName: data?[Constants.postsTopicField]),
      readTime: data?[Constants.postsReadTimeField],
      bookmarkedBy: List.from(data?[Constants.postsBookmarkedByField]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Constants.postsAuthorIdField: authorId,
      Constants.postsAuthorNameField: authorName,
      Constants.postsAuthorPhotoUrlField: authorPhotoUrl,
      Constants.postsIdField: id,
      Constants.postsTitleField: title,
      Constants.postsSubtitleField: subtitle,
      Constants.postsBodyField: body,
      Constants.postsImageUrlField: imageUrl,
      Constants.postsCreatedAtField: createdAt,
      Constants.postsTopicField: topic.topicName,
      Constants.postsReadTimeField: readTime,
      Constants.postsBookmarkedByField: bookmarkedBy
    };
  }
}
