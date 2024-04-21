// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get profession => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  List<String> get topics => throw _privateConstructorUsedError;
  List<String> get following => throw _privateConstructorUsedError;
  List<String> get followers => throw _privateConstructorUsedError;
  Timestamp get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewUserCopyWith<ViewUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewUserCopyWith<$Res> {
  factory $ViewUserCopyWith(ViewUser value, $Res Function(ViewUser) then) =
      _$ViewUserCopyWithImpl<$Res, ViewUser>;
  @useResult
  $Res call(
      {String id,
      String email,
      String username,
      String profession,
      String photoUrl,
      List<String> topics,
      List<String> following,
      List<String> followers,
      Timestamp createdAt});
}

/// @nodoc
class _$ViewUserCopyWithImpl<$Res, $Val extends ViewUser>
    implements $ViewUserCopyWith<$Res> {
  _$ViewUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? profession = null,
    Object? photoUrl = null,
    Object? topics = null,
    Object? following = null,
    Object? followers = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewUserImplCopyWith<$Res>
    implements $ViewUserCopyWith<$Res> {
  factory _$$ViewUserImplCopyWith(
          _$ViewUserImpl value, $Res Function(_$ViewUserImpl) then) =
      __$$ViewUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String username,
      String profession,
      String photoUrl,
      List<String> topics,
      List<String> following,
      List<String> followers,
      Timestamp createdAt});
}

/// @nodoc
class __$$ViewUserImplCopyWithImpl<$Res>
    extends _$ViewUserCopyWithImpl<$Res, _$ViewUserImpl>
    implements _$$ViewUserImplCopyWith<$Res> {
  __$$ViewUserImplCopyWithImpl(
      _$ViewUserImpl _value, $Res Function(_$ViewUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? profession = null,
    Object? photoUrl = null,
    Object? topics = null,
    Object? following = null,
    Object? followers = null,
    Object? createdAt = null,
  }) {
    return _then(_$ViewUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

class _$ViewUserImpl extends _ViewUser {
  const _$ViewUserImpl(
      {required this.id,
      required this.email,
      required this.username,
      required this.profession,
      required this.photoUrl,
      required final List<String> topics,
      required final List<String> following,
      required final List<String> followers,
      required this.createdAt})
      : _topics = topics,
        _following = following,
        _followers = followers,
        super._();

  @override
  final String id;
  @override
  final String email;
  @override
  final String username;
  @override
  final String profession;
  @override
  final String photoUrl;
  final List<String> _topics;
  @override
  List<String> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  final List<String> _following;
  @override
  List<String> get following {
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  final List<String> _followers;
  @override
  List<String> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  @override
  final Timestamp createdAt;

  @override
  String toString() {
    return 'ViewUser(id: $id, email: $email, username: $username, profession: $profession, photoUrl: $photoUrl, topics: $topics, following: $following, followers: $followers, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      username,
      profession,
      photoUrl,
      const DeepCollectionEquality().hash(_topics),
      const DeepCollectionEquality().hash(_following),
      const DeepCollectionEquality().hash(_followers),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewUserImplCopyWith<_$ViewUserImpl> get copyWith =>
      __$$ViewUserImplCopyWithImpl<_$ViewUserImpl>(this, _$identity);
}

abstract class _ViewUser extends ViewUser {
  const factory _ViewUser(
      {required final String id,
      required final String email,
      required final String username,
      required final String profession,
      required final String photoUrl,
      required final List<String> topics,
      required final List<String> following,
      required final List<String> followers,
      required final Timestamp createdAt}) = _$ViewUserImpl;
  const _ViewUser._() : super._();

  @override
  String get id;
  @override
  String get email;
  @override
  String get username;
  @override
  String get profession;
  @override
  String get photoUrl;
  @override
  List<String> get topics;
  @override
  List<String> get following;
  @override
  List<String> get followers;
  @override
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ViewUserImplCopyWith<_$ViewUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
