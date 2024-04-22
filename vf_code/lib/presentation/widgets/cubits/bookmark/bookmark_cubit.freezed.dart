// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookmarkState {
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
    required TResult Function(InitialBookmarkState value) initial,
    required TResult Function(LoadingBookmarkState value) loading,
    required TResult Function(SuccessBookmarkState value) success,
    required TResult Function(FailureBookmarkState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookmarkState value)? initial,
    TResult? Function(LoadingBookmarkState value)? loading,
    TResult? Function(SuccessBookmarkState value)? success,
    TResult? Function(FailureBookmarkState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookmarkState value)? initial,
    TResult Function(LoadingBookmarkState value)? loading,
    TResult Function(SuccessBookmarkState value)? success,
    TResult Function(FailureBookmarkState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkStateCopyWith<$Res> {
  factory $BookmarkStateCopyWith(
          BookmarkState value, $Res Function(BookmarkState) then) =
      _$BookmarkStateCopyWithImpl<$Res, BookmarkState>;
}

/// @nodoc
class _$BookmarkStateCopyWithImpl<$Res, $Val extends BookmarkState>
    implements $BookmarkStateCopyWith<$Res> {
  _$BookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialBookmarkStateImplCopyWith<$Res> {
  factory _$$InitialBookmarkStateImplCopyWith(_$InitialBookmarkStateImpl value,
          $Res Function(_$InitialBookmarkStateImpl) then) =
      __$$InitialBookmarkStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialBookmarkStateImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$InitialBookmarkStateImpl>
    implements _$$InitialBookmarkStateImplCopyWith<$Res> {
  __$$InitialBookmarkStateImplCopyWithImpl(_$InitialBookmarkStateImpl _value,
      $Res Function(_$InitialBookmarkStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialBookmarkStateImpl implements InitialBookmarkState {
  const _$InitialBookmarkStateImpl();

  @override
  String toString() {
    return 'BookmarkState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialBookmarkStateImpl);
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
    required TResult Function(InitialBookmarkState value) initial,
    required TResult Function(LoadingBookmarkState value) loading,
    required TResult Function(SuccessBookmarkState value) success,
    required TResult Function(FailureBookmarkState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookmarkState value)? initial,
    TResult? Function(LoadingBookmarkState value)? loading,
    TResult? Function(SuccessBookmarkState value)? success,
    TResult? Function(FailureBookmarkState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookmarkState value)? initial,
    TResult Function(LoadingBookmarkState value)? loading,
    TResult Function(SuccessBookmarkState value)? success,
    TResult Function(FailureBookmarkState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialBookmarkState implements BookmarkState {
  const factory InitialBookmarkState() = _$InitialBookmarkStateImpl;
}

/// @nodoc
abstract class _$$LoadingBookmarkStateImplCopyWith<$Res> {
  factory _$$LoadingBookmarkStateImplCopyWith(_$LoadingBookmarkStateImpl value,
          $Res Function(_$LoadingBookmarkStateImpl) then) =
      __$$LoadingBookmarkStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingBookmarkStateImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$LoadingBookmarkStateImpl>
    implements _$$LoadingBookmarkStateImplCopyWith<$Res> {
  __$$LoadingBookmarkStateImplCopyWithImpl(_$LoadingBookmarkStateImpl _value,
      $Res Function(_$LoadingBookmarkStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingBookmarkStateImpl implements LoadingBookmarkState {
  const _$LoadingBookmarkStateImpl();

  @override
  String toString() {
    return 'BookmarkState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingBookmarkStateImpl);
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
    required TResult Function(InitialBookmarkState value) initial,
    required TResult Function(LoadingBookmarkState value) loading,
    required TResult Function(SuccessBookmarkState value) success,
    required TResult Function(FailureBookmarkState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookmarkState value)? initial,
    TResult? Function(LoadingBookmarkState value)? loading,
    TResult? Function(SuccessBookmarkState value)? success,
    TResult? Function(FailureBookmarkState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookmarkState value)? initial,
    TResult Function(LoadingBookmarkState value)? loading,
    TResult Function(SuccessBookmarkState value)? success,
    TResult Function(FailureBookmarkState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingBookmarkState implements BookmarkState {
  const factory LoadingBookmarkState() = _$LoadingBookmarkStateImpl;
}

/// @nodoc
abstract class _$$SuccessBookmarkStateImplCopyWith<$Res> {
  factory _$$SuccessBookmarkStateImplCopyWith(_$SuccessBookmarkStateImpl value,
          $Res Function(_$SuccessBookmarkStateImpl) then) =
      __$$SuccessBookmarkStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessBookmarkStateImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$SuccessBookmarkStateImpl>
    implements _$$SuccessBookmarkStateImplCopyWith<$Res> {
  __$$SuccessBookmarkStateImplCopyWithImpl(_$SuccessBookmarkStateImpl _value,
      $Res Function(_$SuccessBookmarkStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessBookmarkStateImpl implements SuccessBookmarkState {
  const _$SuccessBookmarkStateImpl();

  @override
  String toString() {
    return 'BookmarkState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessBookmarkStateImpl);
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
    required TResult Function(InitialBookmarkState value) initial,
    required TResult Function(LoadingBookmarkState value) loading,
    required TResult Function(SuccessBookmarkState value) success,
    required TResult Function(FailureBookmarkState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookmarkState value)? initial,
    TResult? Function(LoadingBookmarkState value)? loading,
    TResult? Function(SuccessBookmarkState value)? success,
    TResult? Function(FailureBookmarkState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookmarkState value)? initial,
    TResult Function(LoadingBookmarkState value)? loading,
    TResult Function(SuccessBookmarkState value)? success,
    TResult Function(FailureBookmarkState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessBookmarkState implements BookmarkState {
  const factory SuccessBookmarkState() = _$SuccessBookmarkStateImpl;
}

/// @nodoc
abstract class _$$FailureBookmarkStateImplCopyWith<$Res> {
  factory _$$FailureBookmarkStateImplCopyWith(_$FailureBookmarkStateImpl value,
          $Res Function(_$FailureBookmarkStateImpl) then) =
      __$$FailureBookmarkStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$FailureBookmarkStateImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$FailureBookmarkStateImpl>
    implements _$$FailureBookmarkStateImplCopyWith<$Res> {
  __$$FailureBookmarkStateImplCopyWithImpl(_$FailureBookmarkStateImpl _value,
      $Res Function(_$FailureBookmarkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$FailureBookmarkStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureBookmarkStateImpl implements FailureBookmarkState {
  const _$FailureBookmarkStateImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'BookmarkState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureBookmarkStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureBookmarkStateImplCopyWith<_$FailureBookmarkStateImpl>
      get copyWith =>
          __$$FailureBookmarkStateImplCopyWithImpl<_$FailureBookmarkStateImpl>(
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
    required TResult Function(InitialBookmarkState value) initial,
    required TResult Function(LoadingBookmarkState value) loading,
    required TResult Function(SuccessBookmarkState value) success,
    required TResult Function(FailureBookmarkState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBookmarkState value)? initial,
    TResult? Function(LoadingBookmarkState value)? loading,
    TResult? Function(SuccessBookmarkState value)? success,
    TResult? Function(FailureBookmarkState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBookmarkState value)? initial,
    TResult Function(LoadingBookmarkState value)? loading,
    TResult Function(SuccessBookmarkState value)? success,
    TResult Function(FailureBookmarkState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureBookmarkState implements BookmarkState {
  const factory FailureBookmarkState({required final String errorMessage}) =
      _$FailureBookmarkStateImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$FailureBookmarkStateImplCopyWith<_$FailureBookmarkStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
