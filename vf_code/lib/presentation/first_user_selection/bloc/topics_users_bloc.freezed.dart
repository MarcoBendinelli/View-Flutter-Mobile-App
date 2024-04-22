// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topics_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopicsUsersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTopics,
    required TResult Function() fetchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTopics,
    TResult? Function()? fetchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTopics,
    TResult Function()? fetchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTopics value) loadTopics,
    required TResult Function(FetchUsers value) fetchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTopics value)? loadTopics,
    TResult? Function(FetchUsers value)? fetchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTopics value)? loadTopics,
    TResult Function(FetchUsers value)? fetchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicsUsersEventCopyWith<$Res> {
  factory $TopicsUsersEventCopyWith(
          TopicsUsersEvent value, $Res Function(TopicsUsersEvent) then) =
      _$TopicsUsersEventCopyWithImpl<$Res, TopicsUsersEvent>;
}

/// @nodoc
class _$TopicsUsersEventCopyWithImpl<$Res, $Val extends TopicsUsersEvent>
    implements $TopicsUsersEventCopyWith<$Res> {
  _$TopicsUsersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadTopicsImplCopyWith<$Res> {
  factory _$$LoadTopicsImplCopyWith(
          _$LoadTopicsImpl value, $Res Function(_$LoadTopicsImpl) then) =
      __$$LoadTopicsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTopicsImplCopyWithImpl<$Res>
    extends _$TopicsUsersEventCopyWithImpl<$Res, _$LoadTopicsImpl>
    implements _$$LoadTopicsImplCopyWith<$Res> {
  __$$LoadTopicsImplCopyWithImpl(
      _$LoadTopicsImpl _value, $Res Function(_$LoadTopicsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadTopicsImpl implements LoadTopics {
  const _$LoadTopicsImpl();

  @override
  String toString() {
    return 'TopicsUsersEvent.loadTopics()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTopicsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTopics,
    required TResult Function() fetchUsers,
  }) {
    return loadTopics();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTopics,
    TResult? Function()? fetchUsers,
  }) {
    return loadTopics?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTopics,
    TResult Function()? fetchUsers,
    required TResult orElse(),
  }) {
    if (loadTopics != null) {
      return loadTopics();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTopics value) loadTopics,
    required TResult Function(FetchUsers value) fetchUsers,
  }) {
    return loadTopics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTopics value)? loadTopics,
    TResult? Function(FetchUsers value)? fetchUsers,
  }) {
    return loadTopics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTopics value)? loadTopics,
    TResult Function(FetchUsers value)? fetchUsers,
    required TResult orElse(),
  }) {
    if (loadTopics != null) {
      return loadTopics(this);
    }
    return orElse();
  }
}

abstract class LoadTopics implements TopicsUsersEvent {
  const factory LoadTopics() = _$LoadTopicsImpl;
}

/// @nodoc
abstract class _$$FetchUsersImplCopyWith<$Res> {
  factory _$$FetchUsersImplCopyWith(
          _$FetchUsersImpl value, $Res Function(_$FetchUsersImpl) then) =
      __$$FetchUsersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUsersImplCopyWithImpl<$Res>
    extends _$TopicsUsersEventCopyWithImpl<$Res, _$FetchUsersImpl>
    implements _$$FetchUsersImplCopyWith<$Res> {
  __$$FetchUsersImplCopyWithImpl(
      _$FetchUsersImpl _value, $Res Function(_$FetchUsersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchUsersImpl implements FetchUsers {
  const _$FetchUsersImpl();

  @override
  String toString() {
    return 'TopicsUsersEvent.fetchUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchUsersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTopics,
    required TResult Function() fetchUsers,
  }) {
    return fetchUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTopics,
    TResult? Function()? fetchUsers,
  }) {
    return fetchUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTopics,
    TResult Function()? fetchUsers,
    required TResult orElse(),
  }) {
    if (fetchUsers != null) {
      return fetchUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTopics value) loadTopics,
    required TResult Function(FetchUsers value) fetchUsers,
  }) {
    return fetchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTopics value)? loadTopics,
    TResult? Function(FetchUsers value)? fetchUsers,
  }) {
    return fetchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTopics value)? loadTopics,
    TResult Function(FetchUsers value)? fetchUsers,
    required TResult orElse(),
  }) {
    if (fetchUsers != null) {
      return fetchUsers(this);
    }
    return orElse();
  }
}

abstract class FetchUsers implements TopicsUsersEvent {
  const factory FetchUsers() = _$FetchUsersImpl;
}

/// @nodoc
mixin _$TopicsUsersState {
  TopicsUsersStatus get status => throw _privateConstructorUsedError;
  List<ViewTopic>? get topics => throw _privateConstructorUsedError;
  List<ViewUser>? get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopicsUsersStateCopyWith<TopicsUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicsUsersStateCopyWith<$Res> {
  factory $TopicsUsersStateCopyWith(
          TopicsUsersState value, $Res Function(TopicsUsersState) then) =
      _$TopicsUsersStateCopyWithImpl<$Res, TopicsUsersState>;
  @useResult
  $Res call(
      {TopicsUsersStatus status,
      List<ViewTopic>? topics,
      List<ViewUser>? users});
}

/// @nodoc
class _$TopicsUsersStateCopyWithImpl<$Res, $Val extends TopicsUsersState>
    implements $TopicsUsersStateCopyWith<$Res> {
  _$TopicsUsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? topics = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TopicsUsersStatus,
      topics: freezed == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<ViewTopic>?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<ViewUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicsUsersStateImplCopyWith<$Res>
    implements $TopicsUsersStateCopyWith<$Res> {
  factory _$$TopicsUsersStateImplCopyWith(_$TopicsUsersStateImpl value,
          $Res Function(_$TopicsUsersStateImpl) then) =
      __$$TopicsUsersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TopicsUsersStatus status,
      List<ViewTopic>? topics,
      List<ViewUser>? users});
}

/// @nodoc
class __$$TopicsUsersStateImplCopyWithImpl<$Res>
    extends _$TopicsUsersStateCopyWithImpl<$Res, _$TopicsUsersStateImpl>
    implements _$$TopicsUsersStateImplCopyWith<$Res> {
  __$$TopicsUsersStateImplCopyWithImpl(_$TopicsUsersStateImpl _value,
      $Res Function(_$TopicsUsersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? topics = freezed,
    Object? users = freezed,
  }) {
    return _then(_$TopicsUsersStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TopicsUsersStatus,
      topics: freezed == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<ViewTopic>?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<ViewUser>?,
    ));
  }
}

/// @nodoc

class _$TopicsUsersStateImpl implements _TopicsUsersState {
  _$TopicsUsersStateImpl(
      {required this.status,
      final List<ViewTopic>? topics,
      final List<ViewUser>? users})
      : _topics = topics,
        _users = users;

  @override
  final TopicsUsersStatus status;
  final List<ViewTopic>? _topics;
  @override
  List<ViewTopic>? get topics {
    final value = _topics;
    if (value == null) return null;
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ViewUser>? _users;
  @override
  List<ViewUser>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TopicsUsersState(status: $status, topics: $topics, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicsUsersStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_topics),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicsUsersStateImplCopyWith<_$TopicsUsersStateImpl> get copyWith =>
      __$$TopicsUsersStateImplCopyWithImpl<_$TopicsUsersStateImpl>(
          this, _$identity);
}

abstract class _TopicsUsersState implements TopicsUsersState {
  factory _TopicsUsersState(
      {required final TopicsUsersStatus status,
      final List<ViewTopic>? topics,
      final List<ViewUser>? users}) = _$TopicsUsersStateImpl;

  @override
  TopicsUsersStatus get status;
  @override
  List<ViewTopic>? get topics;
  @override
  List<ViewUser>? get users;
  @override
  @JsonKey(ignore: true)
  _$$TopicsUsersStateImplCopyWith<_$TopicsUsersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
