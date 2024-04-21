import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:view_app/data/model/view_post.dart';

part 'trending_now_post_state.freezed.dart';

enum TrendingNowPostStatus { initial, success, failure }

/// Represents the state of the [TrendingNowPostBloc].
///
/// It includes information such as the current status and the list of posts.
@freezed
class TrendingNowPostState with _$TrendingNowPostState {
  factory TrendingNowPostState({
    required TrendingNowPostStatus status,
    required List<ViewPost> posts,
  }) = _PostState;

  factory TrendingNowPostState.initial() => TrendingNowPostState(
        status: TrendingNowPostStatus.initial,
        posts: const [],
      );
}
