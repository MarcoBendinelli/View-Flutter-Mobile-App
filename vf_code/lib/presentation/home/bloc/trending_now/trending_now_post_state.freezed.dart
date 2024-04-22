// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_now_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrendingNowPostState {
  TrendingNowPostStatus get status => throw _privateConstructorUsedError;
  List<ViewPost> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendingNowPostStateCopyWith<TrendingNowPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingNowPostStateCopyWith<$Res> {
  factory $TrendingNowPostStateCopyWith(TrendingNowPostState value,
          $Res Function(TrendingNowPostState) then) =
      _$TrendingNowPostStateCopyWithImpl<$Res, TrendingNowPostState>;
  @useResult
  $Res call({TrendingNowPostStatus status, List<ViewPost> posts});
}

/// @nodoc
class _$TrendingNowPostStateCopyWithImpl<$Res,
        $Val extends TrendingNowPostState>
    implements $TrendingNowPostStateCopyWith<$Res> {
  _$TrendingNowPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrendingNowPostStatus,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ViewPost>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostStateImplCopyWith<$Res>
    implements $TrendingNowPostStateCopyWith<$Res> {
  factory _$$PostStateImplCopyWith(
          _$PostStateImpl value, $Res Function(_$PostStateImpl) then) =
      __$$PostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TrendingNowPostStatus status, List<ViewPost> posts});
}

/// @nodoc
class __$$PostStateImplCopyWithImpl<$Res>
    extends _$TrendingNowPostStateCopyWithImpl<$Res, _$PostStateImpl>
    implements _$$PostStateImplCopyWith<$Res> {
  __$$PostStateImplCopyWithImpl(
      _$PostStateImpl _value, $Res Function(_$PostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? posts = null,
  }) {
    return _then(_$PostStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrendingNowPostStatus,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ViewPost>,
    ));
  }
}

/// @nodoc

class _$PostStateImpl with DiagnosticableTreeMixin implements _PostState {
  _$PostStateImpl({required this.status, required final List<ViewPost> posts})
      : _posts = posts;

  @override
  final TrendingNowPostStatus status;
  final List<ViewPost> _posts;
  @override
  List<ViewPost> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrendingNowPostState(status: $status, posts: $posts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrendingNowPostState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('posts', posts));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      __$$PostStateImplCopyWithImpl<_$PostStateImpl>(this, _$identity);
}

abstract class _PostState implements TrendingNowPostState {
  factory _PostState(
      {required final TrendingNowPostStatus status,
      required final List<ViewPost> posts}) = _$PostStateImpl;

  @override
  TrendingNowPostStatus get status;
  @override
  List<ViewPost> get posts;
  @override
  @JsonKey(ignore: true)
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
