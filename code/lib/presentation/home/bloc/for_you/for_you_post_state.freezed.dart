// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'for_you_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForYouPostState {
  ForYouPostStatus get status => throw _privateConstructorUsedError;
  List<ViewPost> get posts => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForYouPostStateCopyWith<ForYouPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForYouPostStateCopyWith<$Res> {
  factory $ForYouPostStateCopyWith(
          ForYouPostState value, $Res Function(ForYouPostState) then) =
      _$ForYouPostStateCopyWithImpl<$Res, ForYouPostState>;
  @useResult
  $Res call({ForYouPostStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class _$ForYouPostStateCopyWithImpl<$Res, $Val extends ForYouPostState>
    implements $ForYouPostStateCopyWith<$Res> {
  _$ForYouPostStateCopyWithImpl(this._value, this._then);

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
              as ForYouPostStatus,
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
    implements $ForYouPostStateCopyWith<$Res> {
  factory _$$PostStateImplCopyWith(
          _$PostStateImpl value, $Res Function(_$PostStateImpl) then) =
      __$$PostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ForYouPostStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class __$$PostStateImplCopyWithImpl<$Res>
    extends _$ForYouPostStateCopyWithImpl<$Res, _$PostStateImpl>
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
              as ForYouPostStatus,
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

class _$PostStateImpl with DiagnosticableTreeMixin implements _PostState {
  _$PostStateImpl(
      {required this.status,
      required final List<ViewPost> posts,
      required this.hasMoreData})
      : _posts = posts;

  @override
  final ForYouPostStatus status;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForYouPostState(status: $status, posts: $posts, hasMoreData: $hasMoreData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForYouPostState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('hasMoreData', hasMoreData));
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

abstract class _PostState implements ForYouPostState {
  factory _PostState(
      {required final ForYouPostStatus status,
      required final List<ViewPost> posts,
      required final bool hasMoreData}) = _$PostStateImpl;

  @override
  ForYouPostStatus get status;
  @override
  List<ViewPost> get posts;
  @override
  bool get hasMoreData;
  @override
  @JsonKey(ignore: true)
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
