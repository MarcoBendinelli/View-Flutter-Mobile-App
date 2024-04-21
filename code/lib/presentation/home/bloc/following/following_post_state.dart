import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/presentation/home/bloc/following/following_post_bloc.dart';

part 'following_post_state.freezed.dart';

enum FollowingPostStatus { initial, success, failure }

/// Represents the state of the [FollowingPostBloc].
///
/// It includes information such as the current status, the list of posts,
/// and whether there is more data to fetch.
@freezed
class FollowingPostState with _$FollowingPostState {
  factory FollowingPostState({
    required FollowingPostStatus status,
    required List<ViewPost> posts,
    required bool hasMoreData,
  }) = _PostState;

  factory FollowingPostState.initial() => FollowingPostState(
        status: FollowingPostStatus.initial,
        posts: const [],
        hasMoreData: true,
      );
}
