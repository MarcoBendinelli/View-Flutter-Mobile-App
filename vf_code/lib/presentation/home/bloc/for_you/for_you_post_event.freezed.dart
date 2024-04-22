// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'for_you_post_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForYouPostEvent {
  String get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter) fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filter)? fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter)? fetchPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchForYouPosts value) fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchForYouPosts value)? fetchPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchForYouPosts value)? fetchPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForYouPostEventCopyWith<ForYouPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForYouPostEventCopyWith<$Res> {
  factory $ForYouPostEventCopyWith(
          ForYouPostEvent value, $Res Function(ForYouPostEvent) then) =
      _$ForYouPostEventCopyWithImpl<$Res, ForYouPostEvent>;
  @useResult
  $Res call({String filter});
}

/// @nodoc
class _$ForYouPostEventCopyWithImpl<$Res, $Val extends ForYouPostEvent>
    implements $ForYouPostEventCopyWith<$Res> {
  _$ForYouPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchForYouPostsImplCopyWith<$Res>
    implements $ForYouPostEventCopyWith<$Res> {
  factory _$$FetchForYouPostsImplCopyWith(_$FetchForYouPostsImpl value,
          $Res Function(_$FetchForYouPostsImpl) then) =
      __$$FetchForYouPostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filter});
}

/// @nodoc
class __$$FetchForYouPostsImplCopyWithImpl<$Res>
    extends _$ForYouPostEventCopyWithImpl<$Res, _$FetchForYouPostsImpl>
    implements _$$FetchForYouPostsImplCopyWith<$Res> {
  __$$FetchForYouPostsImplCopyWithImpl(_$FetchForYouPostsImpl _value,
      $Res Function(_$FetchForYouPostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$FetchForYouPostsImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchForYouPostsImpl
    with DiagnosticableTreeMixin
    implements FetchForYouPosts {
  const _$FetchForYouPostsImpl({required this.filter});

  @override
  final String filter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForYouPostEvent.fetchPosts(filter: $filter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForYouPostEvent.fetchPosts'))
      ..add(DiagnosticsProperty('filter', filter));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchForYouPostsImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchForYouPostsImplCopyWith<_$FetchForYouPostsImpl> get copyWith =>
      __$$FetchForYouPostsImplCopyWithImpl<_$FetchForYouPostsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter) fetchPosts,
  }) {
    return fetchPosts(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filter)? fetchPosts,
  }) {
    return fetchPosts?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter)? fetchPosts,
    required TResult orElse(),
  }) {
    if (fetchPosts != null) {
      return fetchPosts(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchForYouPosts value) fetchPosts,
  }) {
    return fetchPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchForYouPosts value)? fetchPosts,
  }) {
    return fetchPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchForYouPosts value)? fetchPosts,
    required TResult orElse(),
  }) {
    if (fetchPosts != null) {
      return fetchPosts(this);
    }
    return orElse();
  }
}

abstract class FetchForYouPosts implements ForYouPostEvent {
  const factory FetchForYouPosts({required final String filter}) =
      _$FetchForYouPostsImpl;

  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$FetchForYouPostsImplCopyWith<_$FetchForYouPostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
