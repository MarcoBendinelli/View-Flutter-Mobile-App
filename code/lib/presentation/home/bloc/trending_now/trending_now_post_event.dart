import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'trending_now_post_event.freezed.dart';

/// Class representing events related to the [TrendingNowPostBloc].
@freezed
class TrendingNowPostEvent with _$TrendingNowPostEvent {
  /// Event used to fetch more posts from the DB.
  const factory TrendingNowPostEvent.fetchPosts() =
      FetchTrendingNowPosts;
}
