import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:view_app/data/model/view_post.dart';

part 'for_you_post_state.freezed.dart';

enum ForYouPostStatus { initial, success, failure }

/// Represents the state of the [ForYouPostBloc].
///
/// It includes information such as the current status, the list of posts,
/// and whether there is more data to fetch.
@freezed
class ForYouPostState with _$ForYouPostState {
  factory ForYouPostState({
    required ForYouPostStatus status,
    required List<ViewPost> posts,
    required bool hasMoreData,
  }) = _PostState;

  factory ForYouPostState.initial() => ForYouPostState(
        status: ForYouPostStatus.initial,
        posts: const [],
        hasMoreData: true,
      );
}
