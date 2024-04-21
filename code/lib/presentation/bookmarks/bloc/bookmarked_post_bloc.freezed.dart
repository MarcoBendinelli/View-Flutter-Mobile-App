// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmarked_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookmarkedPostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBookmarkedPosts value) fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBookmarkedPosts value)? fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBookmarkedPosts value)? fetchPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkedPostEventCopyWith<$Res> {
  factory $BookmarkedPostEventCopyWith(
          BookmarkedPostEvent value, $Res Function(BookmarkedPostEvent) then) =
      _$BookmarkedPostEventCopyWithImpl<$Res, BookmarkedPostEvent>;
}

/// @nodoc
class _$BookmarkedPostEventCopyWithImpl<$Res, $Val extends BookmarkedPostEvent>
    implements $BookmarkedPostEventCopyWith<$Res> {
  _$BookmarkedPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchBookmarkedPostsImplCopyWith<$Res> {
  factory _$$FetchBookmarkedPostsImplCopyWith(_$FetchBookmarkedPostsImpl value,
          $Res Function(_$FetchBookmarkedPostsImpl) then) =
      __$$FetchBookmarkedPostsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchBookmarkedPostsImplCopyWithImpl<$Res>
    extends _$BookmarkedPostEventCopyWithImpl<$Res, _$FetchBookmarkedPostsImpl>
    implements _$$FetchBookmarkedPostsImplCopyWith<$Res> {
  __$$FetchBookmarkedPostsImplCopyWithImpl(_$FetchBookmarkedPostsImpl _value,
      $Res Function(_$FetchBookmarkedPostsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchBookmarkedPostsImpl implements FetchBookmarkedPosts {
  const _$FetchBookmarkedPostsImpl();

  @override
  String toString() {
    return 'BookmarkedPostEvent.fetchPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchBookmarkedPostsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchPosts,
  }) {
    return fetchPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchPosts,
  }) {
    return fetchPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchPosts,
    required TResult orElse(),
  }) {
    if (fetchPosts != null) {
      return fetchPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBookmarkedPosts value) fetchPosts,
  }) {
    return fetchPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBookmarkedPosts value)? fetchPosts,
  }) {
    return fetchPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBookmarkedPosts value)? fetchPosts,
    required TResult orElse(),
  }) {
    if (fetchPosts != null) {
      return fetchPosts(this);
    }
    return orElse();
  }
}

abstract class FetchBookmarkedPosts implements BookmarkedPostEvent {
  const factory FetchBookmarkedPosts() = _$FetchBookmarkedPostsImpl;
}

/// @nodoc
mixin _$BookmarkedPostState {
  BookmarkedPostStatus get status => throw _privateConstructorUsedError;
  List<ViewPost> get posts => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkedPostStateCopyWith<BookmarkedPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkedPostStateCopyWith<$Res> {
  factory $BookmarkedPostStateCopyWith(
          BookmarkedPostState value, $Res Function(BookmarkedPostState) then) =
      _$BookmarkedPostStateCopyWithImpl<$Res, BookmarkedPostState>;
  @useResult
  $Res call(
      {BookmarkedPostStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class _$BookmarkedPostStateCopyWithImpl<$Res, $Val extends BookmarkedPostState>
    implements $BookmarkedPostStateCopyWith<$Res> {
  _$BookmarkedPostStateCopyWithImpl(this._value, this._then);

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
              as BookmarkedPostStatus,
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
abstract class _$$PostStateImplCopyWith<$Res>
    implements $BookmarkedPostStateCopyWith<$Res> {
  factory _$$PostStateImplCopyWith(
          _$PostStateImpl value, $Res Function(_$PostStateImpl) then) =
      __$$PostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BookmarkedPostStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class __$$PostStateImplCopyWithImpl<$Res>
    extends _$BookmarkedPostStateCopyWithImpl<$Res, _$PostStateImpl>
    implements _$$PostStateImplCopyWith<$Res> {
  __$$PostStateImplCopyWithImpl(
      _$PostStateImpl _value, $Res Function(_$PostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? posts = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$PostStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookmarkedPostStatus,
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

class _$PostStateImpl implements _PostState {
  _$PostStateImpl(
      {required this.status,
      required final List<ViewPost> posts,
      required this.hasMoreData})
      : _posts = posts;

  @override
  final BookmarkedPostStatus status;
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
    return 'BookmarkedPostState(status: $status, posts: $posts, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostStateImpl &&
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
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      __$$PostStateImplCopyWithImpl<_$PostStateImpl>(this, _$identity);
}

abstract class _PostState implements BookmarkedPostState {
  factory _PostState(
      {required final BookmarkedPostStatus status,
      required final List<ViewPost> posts,
      required final bool hasMoreData}) = _$PostStateImpl;

  @override
  BookmarkedPostStatus get status;
  @override
  List<ViewPost> get posts;
  @override
  bool get hasMoreData;
  @override
  @JsonKey(ignore: true)
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
