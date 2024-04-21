// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_posts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPostsEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) fetchUserPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? fetchUserPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? fetchUserPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUserPosts value) fetchUserPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUserPosts value)? fetchUserPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUserPosts value)? fetchUserPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostsEventCopyWith<UserPostsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostsEventCopyWith<$Res> {
  factory $UserPostsEventCopyWith(
          UserPostsEvent value, $Res Function(UserPostsEvent) then) =
      _$UserPostsEventCopyWithImpl<$Res, UserPostsEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$UserPostsEventCopyWithImpl<$Res, $Val extends UserPostsEvent>
    implements $UserPostsEventCopyWith<$Res> {
  _$UserPostsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchUserPostsImplCopyWith<$Res>
    implements $UserPostsEventCopyWith<$Res> {
  factory _$$FetchUserPostsImplCopyWith(_$FetchUserPostsImpl value,
          $Res Function(_$FetchUserPostsImpl) then) =
      __$$FetchUserPostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$FetchUserPostsImplCopyWithImpl<$Res>
    extends _$UserPostsEventCopyWithImpl<$Res, _$FetchUserPostsImpl>
    implements _$$FetchUserPostsImplCopyWith<$Res> {
  __$$FetchUserPostsImplCopyWithImpl(
      _$FetchUserPostsImpl _value, $Res Function(_$FetchUserPostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$FetchUserPostsImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchUserPostsImpl implements FetchUserPosts {
  const _$FetchUserPostsImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'UserPostsEvent.fetchUserPosts(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserPostsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUserPostsImplCopyWith<_$FetchUserPostsImpl> get copyWith =>
      __$$FetchUserPostsImplCopyWithImpl<_$FetchUserPostsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) fetchUserPosts,
  }) {
    return fetchUserPosts(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? fetchUserPosts,
  }) {
    return fetchUserPosts?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? fetchUserPosts,
    required TResult orElse(),
  }) {
    if (fetchUserPosts != null) {
      return fetchUserPosts(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUserPosts value) fetchUserPosts,
  }) {
    return fetchUserPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUserPosts value)? fetchUserPosts,
  }) {
    return fetchUserPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUserPosts value)? fetchUserPosts,
    required TResult orElse(),
  }) {
    if (fetchUserPosts != null) {
      return fetchUserPosts(this);
    }
    return orElse();
  }
}

abstract class FetchUserPosts implements UserPostsEvent {
  const factory FetchUserPosts(final String userId) = _$FetchUserPostsImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$FetchUserPostsImplCopyWith<_$FetchUserPostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserPostsState {
  UserPostsStatus get status => throw _privateConstructorUsedError;
  List<ViewPost> get posts => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostsStateCopyWith<UserPostsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostsStateCopyWith<$Res> {
  factory $UserPostsStateCopyWith(
          UserPostsState value, $Res Function(UserPostsState) then) =
      _$UserPostsStateCopyWithImpl<$Res, UserPostsState>;
  @useResult
  $Res call({UserPostsStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class _$UserPostsStateCopyWithImpl<$Res, $Val extends UserPostsState>
    implements $UserPostsStateCopyWith<$Res> {
  _$UserPostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? posts = null,
    Object? hasMoreData = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserPostsStatus,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ViewPost>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserPostsStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserPostsStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserPostsStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? posts = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$UserStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserPostsStatus,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ViewPost>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  _$UserStateImpl(
      {required this.status,
      required final List<ViewPost> posts,
      required this.hasMoreData})
      : _posts = posts;

  @override
  final UserPostsStatus status;
  final List<ViewPost> _posts;
  @override
  List<ViewPost> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final bool hasMoreData;

  @override
  String toString() {
    return 'UserPostsState(status: $status, posts: $posts, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_posts), hasMoreData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserPostsState {
  factory _UserState(
      {required final UserPostsStatus status,
      required final List<ViewPost> posts,
      required final bool hasMoreData}) = _$UserStateImpl;

  @override
  UserPostsStatus get status;
  @override
  List<ViewPost> get posts;
  @override
  bool get hasMoreData;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
