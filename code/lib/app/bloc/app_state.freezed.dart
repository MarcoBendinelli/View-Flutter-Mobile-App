// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  AppStatus get status => throw _privateConstructorUsedError;
  ViewUser get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({AppStatus status, ViewUser user});

  $ViewUserCopyWith<$Res> get user;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ViewUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewUserCopyWith<$Res> get user {
    return $ViewUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$appStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$appStateImplCopyWith(
          _$appStateImpl value, $Res Function(_$appStateImpl) then) =
      __$$appStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppStatus status, ViewUser user});

  @override
  $ViewUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$appStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$appStateImpl>
    implements _$$appStateImplCopyWith<$Res> {
  __$$appStateImplCopyWithImpl(
      _$appStateImpl _value, $Res Function(_$appStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_$appStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ViewUser,
    ));
  }
}

/// @nodoc

class _$appStateImpl implements _appState {
  _$appStateImpl({required this.status, required this.user});

  @override
  final AppStatus status;
  @override
  final ViewUser user;

  @override
  String toString() {
    return 'AppState(status: $status, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$appStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$appStateImplCopyWith<_$appStateImpl> get copyWith =>
      __$$appStateImplCopyWithImpl<_$appStateImpl>(this, _$identity);
}

abstract class _appState implements AppState {
  factory _appState(
      {required final AppStatus status,
      required final ViewUser user}) = _$appStateImpl;

  @override
  AppStatus get status;
  @override
  ViewUser get user;
  @override
  @JsonKey(ignore: true)
  _$$appStateImplCopyWith<_$appStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
