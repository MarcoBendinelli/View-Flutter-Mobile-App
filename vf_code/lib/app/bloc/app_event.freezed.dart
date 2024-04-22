// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function(ViewUser user) userChanged,
    required TResult Function() loadUser,
    required TResult Function() userFirstSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function(ViewUser user)? userChanged,
    TResult? Function()? loadUser,
    TResult? Function()? userFirstSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function(ViewUser user)? userChanged,
    TResult Function()? loadUser,
    TResult Function()? userFirstSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestLogout value) logoutRequested,
    required TResult Function(LoadUserChanged value) userChanged,
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(LoadFirstSelection value) userFirstSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestLogout value)? logoutRequested,
    TResult? Function(LoadUserChanged value)? userChanged,
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(LoadFirstSelection value)? userFirstSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestLogout value)? logoutRequested,
    TResult Function(LoadUserChanged value)? userChanged,
    TResult Function(LoadUser value)? loadUser,
    TResult Function(LoadFirstSelection value)? userFirstSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RequestLogoutImplCopyWith<$Res> {
  factory _$$RequestLogoutImplCopyWith(
          _$RequestLogoutImpl value, $Res Function(_$RequestLogoutImpl) then) =
      __$$RequestLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestLogoutImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$RequestLogoutImpl>
    implements _$$RequestLogoutImplCopyWith<$Res> {
  __$$RequestLogoutImplCopyWithImpl(
      _$RequestLogoutImpl _value, $Res Function(_$RequestLogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestLogoutImpl implements RequestLogout {
  const _$RequestLogoutImpl();

  @override
  String toString() {
    return 'AppEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function(ViewUser user) userChanged,
    required TResult Function() loadUser,
    required TResult Function() userFirstSelection,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function(ViewUser user)? userChanged,
    TResult? Function()? loadUser,
    TResult? Function()? userFirstSelection,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function(ViewUser user)? userChanged,
    TResult Function()? loadUser,
    TResult Function()? userFirstSelection,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestLogout value) logoutRequested,
    required TResult Function(LoadUserChanged value) userChanged,
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(LoadFirstSelection value) userFirstSelection,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestLogout value)? logoutRequested,
    TResult? Function(LoadUserChanged value)? userChanged,
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(LoadFirstSelection value)? userFirstSelection,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestLogout value)? logoutRequested,
    TResult Function(LoadUserChanged value)? userChanged,
    TResult Function(LoadUser value)? loadUser,
    TResult Function(LoadFirstSelection value)? userFirstSelection,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class RequestLogout implements AppEvent {
  const factory RequestLogout() = _$RequestLogoutImpl;
}

/// @nodoc
abstract class _$$LoadUserChangedImplCopyWith<$Res> {
  factory _$$LoadUserChangedImplCopyWith(_$LoadUserChangedImpl value,
          $Res Function(_$LoadUserChangedImpl) then) =
      __$$LoadUserChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ViewUser user});

  $ViewUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoadUserChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LoadUserChangedImpl>
    implements _$$LoadUserChangedImplCopyWith<$Res> {
  __$$LoadUserChangedImplCopyWithImpl(
      _$LoadUserChangedImpl _value, $Res Function(_$LoadUserChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoadUserChangedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ViewUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewUserCopyWith<$Res> get user {
    return $ViewUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoadUserChangedImpl implements LoadUserChanged {
  const _$LoadUserChangedImpl({required this.user});

  @override
  final ViewUser user;

  @override
  String toString() {
    return 'AppEvent.userChanged(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserChangedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUserChangedImplCopyWith<_$LoadUserChangedImpl> get copyWith =>
      __$$LoadUserChangedImplCopyWithImpl<_$LoadUserChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function(ViewUser user) userChanged,
    required TResult Function() loadUser,
    required TResult Function() userFirstSelection,
  }) {
    return userChanged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function(ViewUser user)? userChanged,
    TResult? Function()? loadUser,
    TResult? Function()? userFirstSelection,
  }) {
    return userChanged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function(ViewUser user)? userChanged,
    TResult Function()? loadUser,
    TResult Function()? userFirstSelection,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestLogout value) logoutRequested,
    required TResult Function(LoadUserChanged value) userChanged,
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(LoadFirstSelection value) userFirstSelection,
  }) {
    return userChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestLogout value)? logoutRequested,
    TResult? Function(LoadUserChanged value)? userChanged,
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(LoadFirstSelection value)? userFirstSelection,
  }) {
    return userChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestLogout value)? logoutRequested,
    TResult Function(LoadUserChanged value)? userChanged,
    TResult Function(LoadUser value)? loadUser,
    TResult Function(LoadFirstSelection value)? userFirstSelection,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(this);
    }
    return orElse();
  }
}

abstract class LoadUserChanged implements AppEvent {
  const factory LoadUserChanged({required final ViewUser user}) =
      _$LoadUserChangedImpl;

  ViewUser get user;
  @JsonKey(ignore: true)
  _$$LoadUserChangedImplCopyWith<_$LoadUserChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadUserImplCopyWith<$Res> {
  factory _$$LoadUserImplCopyWith(
          _$LoadUserImpl value, $Res Function(_$LoadUserImpl) then) =
      __$$LoadUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadUserImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LoadUserImpl>
    implements _$$LoadUserImplCopyWith<$Res> {
  __$$LoadUserImplCopyWithImpl(
      _$LoadUserImpl _value, $Res Function(_$LoadUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadUserImpl implements LoadUser {
  const _$LoadUserImpl();

  @override
  String toString() {
    return 'AppEvent.loadUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function(ViewUser user) userChanged,
    required TResult Function() loadUser,
    required TResult Function() userFirstSelection,
  }) {
    return loadUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function(ViewUser user)? userChanged,
    TResult? Function()? loadUser,
    TResult? Function()? userFirstSelection,
  }) {
    return loadUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function(ViewUser user)? userChanged,
    TResult Function()? loadUser,
    TResult Function()? userFirstSelection,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestLogout value) logoutRequested,
    required TResult Function(LoadUserChanged value) userChanged,
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(LoadFirstSelection value) userFirstSelection,
  }) {
    return loadUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestLogout value)? logoutRequested,
    TResult? Function(LoadUserChanged value)? userChanged,
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(LoadFirstSelection value)? userFirstSelection,
  }) {
    return loadUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestLogout value)? logoutRequested,
    TResult Function(LoadUserChanged value)? userChanged,
    TResult Function(LoadUser value)? loadUser,
    TResult Function(LoadFirstSelection value)? userFirstSelection,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(this);
    }
    return orElse();
  }
}

abstract class LoadUser implements AppEvent {
  const factory LoadUser() = _$LoadUserImpl;
}

/// @nodoc
abstract class _$$LoadFirstSelectionImplCopyWith<$Res> {
  factory _$$LoadFirstSelectionImplCopyWith(_$LoadFirstSelectionImpl value,
          $Res Function(_$LoadFirstSelectionImpl) then) =
      __$$LoadFirstSelectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFirstSelectionImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LoadFirstSelectionImpl>
    implements _$$LoadFirstSelectionImplCopyWith<$Res> {
  __$$LoadFirstSelectionImplCopyWithImpl(_$LoadFirstSelectionImpl _value,
      $Res Function(_$LoadFirstSelectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFirstSelectionImpl implements LoadFirstSelection {
  const _$LoadFirstSelectionImpl();

  @override
  String toString() {
    return 'AppEvent.userFirstSelection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFirstSelectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function(ViewUser user) userChanged,
    required TResult Function() loadUser,
    required TResult Function() userFirstSelection,
  }) {
    return userFirstSelection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function(ViewUser user)? userChanged,
    TResult? Function()? loadUser,
    TResult? Function()? userFirstSelection,
  }) {
    return userFirstSelection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function(ViewUser user)? userChanged,
    TResult Function()? loadUser,
    TResult Function()? userFirstSelection,
    required TResult orElse(),
  }) {
    if (userFirstSelection != null) {
      return userFirstSelection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestLogout value) logoutRequested,
    required TResult Function(LoadUserChanged value) userChanged,
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(LoadFirstSelection value) userFirstSelection,
  }) {
    return userFirstSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestLogout value)? logoutRequested,
    TResult? Function(LoadUserChanged value)? userChanged,
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(LoadFirstSelection value)? userFirstSelection,
  }) {
    return userFirstSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestLogout value)? logoutRequested,
    TResult Function(LoadUserChanged value)? userChanged,
    TResult Function(LoadUser value)? loadUser,
    TResult Function(LoadFirstSelection value)? userFirstSelection,
    required TResult orElse(),
  }) {
    if (userFirstSelection != null) {
      return userFirstSelection(this);
    }
    return orElse();
  }
}

abstract class LoadFirstSelection implements AppEvent {
  const factory LoadFirstSelection() = _$LoadFirstSelectionImpl;
}
