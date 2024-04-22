// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFollowState value) initial,
    required TResult Function(LoadingFollowState value) loading,
    required TResult Function(SuccessFollowState value) success,
    required TResult Function(FailureFollowState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFollowState value)? initial,
    TResult? Function(LoadingFollowState value)? loading,
    TResult? Function(SuccessFollowState value)? success,
    TResult? Function(FailureFollowState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFollowState value)? initial,
    TResult Function(LoadingFollowState value)? loading,
    TResult Function(SuccessFollowState value)? success,
    TResult Function(FailureFollowState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStateCopyWith<$Res> {
  factory $FollowStateCopyWith(
          FollowState value, $Res Function(FollowState) then) =
      _$FollowStateCopyWithImpl<$Res, FollowState>;
}

/// @nodoc
class _$FollowStateCopyWithImpl<$Res, $Val extends FollowState>
    implements $FollowStateCopyWith<$Res> {
  _$FollowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialFollowStateImplCopyWith<$Res> {
  factory _$$InitialFollowStateImplCopyWith(_$InitialFollowStateImpl value,
          $Res Function(_$InitialFollowStateImpl) then) =
      __$$InitialFollowStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialFollowStateImplCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$InitialFollowStateImpl>
    implements _$$InitialFollowStateImplCopyWith<$Res> {
  __$$InitialFollowStateImplCopyWithImpl(_$InitialFollowStateImpl _value,
      $Res Function(_$InitialFollowStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialFollowStateImpl implements InitialFollowState {
  const _$InitialFollowStateImpl();

  @override
  String toString() {
    return 'FollowState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialFollowStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFollowState value) initial,
    required TResult Function(LoadingFollowState value) loading,
    required TResult Function(SuccessFollowState value) success,
    required TResult Function(FailureFollowState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFollowState value)? initial,
    TResult? Function(LoadingFollowState value)? loading,
    TResult? Function(SuccessFollowState value)? success,
    TResult? Function(FailureFollowState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFollowState value)? initial,
    TResult Function(LoadingFollowState value)? loading,
    TResult Function(SuccessFollowState value)? success,
    TResult Function(FailureFollowState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialFollowState implements FollowState {
  const factory InitialFollowState() = _$InitialFollowStateImpl;
}

/// @nodoc
abstract class _$$LoadingFollowStateImplCopyWith<$Res> {
  factory _$$LoadingFollowStateImplCopyWith(_$LoadingFollowStateImpl value,
          $Res Function(_$LoadingFollowStateImpl) then) =
      __$$LoadingFollowStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingFollowStateImplCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$LoadingFollowStateImpl>
    implements _$$LoadingFollowStateImplCopyWith<$Res> {
  __$$LoadingFollowStateImplCopyWithImpl(_$LoadingFollowStateImpl _value,
      $Res Function(_$LoadingFollowStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingFollowStateImpl implements LoadingFollowState {
  const _$LoadingFollowStateImpl();

  @override
  String toString() {
    return 'FollowState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingFollowStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFollowState value) initial,
    required TResult Function(LoadingFollowState value) loading,
    required TResult Function(SuccessFollowState value) success,
    required TResult Function(FailureFollowState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFollowState value)? initial,
    TResult? Function(LoadingFollowState value)? loading,
    TResult? Function(SuccessFollowState value)? success,
    TResult? Function(FailureFollowState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFollowState value)? initial,
    TResult Function(LoadingFollowState value)? loading,
    TResult Function(SuccessFollowState value)? success,
    TResult Function(FailureFollowState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingFollowState implements FollowState {
  const factory LoadingFollowState() = _$LoadingFollowStateImpl;
}

/// @nodoc
abstract class _$$SuccessFollowStateImplCopyWith<$Res> {
  factory _$$SuccessFollowStateImplCopyWith(_$SuccessFollowStateImpl value,
          $Res Function(_$SuccessFollowStateImpl) then) =
      __$$SuccessFollowStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessFollowStateImplCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$SuccessFollowStateImpl>
    implements _$$SuccessFollowStateImplCopyWith<$Res> {
  __$$SuccessFollowStateImplCopyWithImpl(_$SuccessFollowStateImpl _value,
      $Res Function(_$SuccessFollowStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessFollowStateImpl implements SuccessFollowState {
  const _$SuccessFollowStateImpl();

  @override
  String toString() {
    return 'FollowState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessFollowStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFollowState value) initial,
    required TResult Function(LoadingFollowState value) loading,
    required TResult Function(SuccessFollowState value) success,
    required TResult Function(FailureFollowState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFollowState value)? initial,
    TResult? Function(LoadingFollowState value)? loading,
    TResult? Function(SuccessFollowState value)? success,
    TResult? Function(FailureFollowState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFollowState value)? initial,
    TResult Function(LoadingFollowState value)? loading,
    TResult Function(SuccessFollowState value)? success,
    TResult Function(FailureFollowState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessFollowState implements FollowState {
  const factory SuccessFollowState() = _$SuccessFollowStateImpl;
}

/// @nodoc
abstract class _$$FailureFollowStateImplCopyWith<$Res> {
  factory _$$FailureFollowStateImplCopyWith(_$FailureFollowStateImpl value,
          $Res Function(_$FailureFollowStateImpl) then) =
      __$$FailureFollowStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$FailureFollowStateImplCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$FailureFollowStateImpl>
    implements _$$FailureFollowStateImplCopyWith<$Res> {
  __$$FailureFollowStateImplCopyWithImpl(_$FailureFollowStateImpl _value,
      $Res Function(_$FailureFollowStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$FailureFollowStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureFollowStateImpl implements FailureFollowState {
  const _$FailureFollowStateImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'FollowState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureFollowStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureFollowStateImplCopyWith<_$FailureFollowStateImpl> get copyWith =>
      __$$FailureFollowStateImplCopyWithImpl<_$FailureFollowStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialFollowState value) initial,
    required TResult Function(LoadingFollowState value) loading,
    required TResult Function(SuccessFollowState value) success,
    required TResult Function(FailureFollowState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialFollowState value)? initial,
    TResult? Function(LoadingFollowState value)? loading,
    TResult? Function(SuccessFollowState value)? success,
    TResult? Function(FailureFollowState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialFollowState value)? initial,
    TResult Function(LoadingFollowState value)? loading,
    TResult Function(SuccessFollowState value)? success,
    TResult Function(FailureFollowState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureFollowState implements FollowState {
  const factory FailureFollowState({required final String errorMessage}) =
      _$FailureFollowStateImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$FailureFollowStateImplCopyWith<_$FailureFollowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
