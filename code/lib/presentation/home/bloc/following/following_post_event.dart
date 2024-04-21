import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:view_app/presentation/home/bloc/following/following_post_bloc.dart';

part 'following_post_event.freezed.dart';

/// Class representing events related to the [FollowingPostBloc].
@freezed
class FollowingPostEvent with _$FollowingPostEvent {
  /// Event used to fetch more posts from the DB.
  const factory FollowingPostEvent.fetchPosts() = FetchFollowingPosts;
}
