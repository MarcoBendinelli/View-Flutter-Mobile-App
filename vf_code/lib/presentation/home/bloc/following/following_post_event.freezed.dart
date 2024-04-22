// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_post_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowingPostEvent {
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
    required TResult Function(FetchFollowingPosts value) fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFollowingPosts value)? fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFollowingPosts value)? fetchPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingPostEventCopyWith<$Res> {
  factory $FollowingPostEventCopyWith(
          FollowingPostEvent value, $Res Function(FollowingPostEvent) then) =
      _$FollowingPostEventCopyWithImpl<$Res, FollowingPostEvent>;
}

/// @nodoc
class _$FollowingPostEventCopyWithImpl<$Res, $Val extends FollowingPostEvent>
    implements $FollowingPostEventCopyWith<$Res> {
  _$FollowingPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchFollowingPostsImplCopyWith<$Res> {
  factory _$$FetchFollowingPostsImplCopyWith(_$FetchFollowingPostsImpl value,
          $Res Function(_$FetchFollowingPostsImpl) then) =
      __$$FetchFollowingPostsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchFollowingPostsImplCopyWithImpl<$Res>
    extends _$FollowingPostEventCopyWithImpl<$Res, _$FetchFollowingPostsImpl>
    implements _$$FetchFollowingPostsImplCopyWith<$Res> {
  __$$FetchFollowingPostsImplCopyWithImpl(_$FetchFollowingPostsImpl _value,
      $Res Function(_$FetchFollowingPostsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchFollowingPostsImpl
    with DiagnosticableTreeMixin
    implements FetchFollowingPosts {
  const _$FetchFollowingPostsImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FollowingPostEvent.fetchPosts()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'FollowingPostEvent.fetchPosts'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFollowingPostsImpl);
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
    required TResult Function(FetchFollowingPosts value) fetchPosts,
  }) {
    return fetchPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFollowingPosts value)? fetchPosts,
  }) {
    return fetchPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFollowingPosts value)? fetchPosts,
    required TResult orElse(),
  }) {
    if (fetchPosts != null) {
      return fetchPosts(this);
    }
    return orElse();
  }
}

abstract class FetchFollowingPosts implements FollowingPostEvent {
  const factory FetchFollowingPosts() = _$FetchFollowingPostsImpl;
}
