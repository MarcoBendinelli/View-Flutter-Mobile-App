import 'package:meta/meta.dart';

/// Immutable class representing a view-specific topic.
///
/// A [ViewTopic] instance is used to encapsulate information about a specific topic
/// in the user interface. It includes the name of the topic as its primary property.
@immutable
class ViewTopic {
  const ViewTopic({
    required this.topicName,
  });

  /// The name of the topic.
  final String topicName;
}
