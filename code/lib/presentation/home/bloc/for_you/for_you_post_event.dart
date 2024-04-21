import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'for_you_post_event.freezed.dart';

/// Class representing events related to the [ForYouPostBloc].
@freezed
class ForYouPostEvent with _$ForYouPostEvent {
  /// Event used to fetch more posts from the DB.
  const factory ForYouPostEvent.fetchPosts({required String filter}) =
      FetchForYouPosts;
}
