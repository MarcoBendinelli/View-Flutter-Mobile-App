// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_selection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirstSelectionState {
  List<ViewTopic> get selectedTopics => throw _privateConstructorUsedError;
  List<String> get selectedUsersIds => throw _privateConstructorUsedError;
  FirstSelectionStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirstSelectionStateCopyWith<FirstSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirstSelectionStateCopyWith<$Res> {
  factory $FirstSelectionStateCopyWith(
          FirstSelectionState value, $Res Function(FirstSelectionState) then) =
      _$FirstSelectionStateCopyWithImpl<$Res, FirstSelectionState>;
  @useResult
  $Res call(
      {List<ViewTopic> selectedTopics,
      List<String> selectedUsersIds,
      FirstSelectionStatus status});
}

/// @nodoc
class _$FirstSelectionStateCopyWithImpl<$Res, $Val extends FirstSelectionState>
    implements $FirstSelectionStateCopyWith<$Res> {
  _$FirstSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTopics = null,
    Object? selectedUsersIds = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      selectedTopics: null == selectedTopics
          ? _value.selectedTopics
          : selectedTopics // ignore: cast_nullable_to_non_nullable
              as List<ViewTopic>,
      selectedUsersIds: null == selectedUsersIds
          ? _value.selectedUsersIds
          : selectedUsersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FirstSelectionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirstSelectionStateImplCopyWith<$Res>
    implements $FirstSelectionStateCopyWith<$Res> {
  factory _$$FirstSelectionStateImplCopyWith(_$FirstSelectionStateImpl value,
          $Res Function(_$FirstSelectionStateImpl) then) =
      __$$FirstSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ViewTopic> selectedTopics,
      List<String> selectedUsersIds,
      FirstSelectionStatus status});
}

/// @nodoc
class __$$FirstSelectionStateImplCopyWithImpl<$Res>
    extends _$FirstSelectionStateCopyWithImpl<$Res, _$FirstSelectionStateImpl>
    implements _$$FirstSelectionStateImplCopyWith<$Res> {
  __$$FirstSelectionStateImplCopyWithImpl(_$FirstSelectionStateImpl _value,
      $Res Function(_$FirstSelectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTopics = null,
    Object? selectedUsersIds = null,
    Object? status = null,
  }) {
    return _then(_$FirstSelectionStateImpl(
      selectedTopics: null == selectedTopics
          ? _value._selectedTopics
          : selectedTopics // ignore: cast_nullable_to_non_nullable
              as List<ViewTopic>,
      selectedUsersIds: null == selectedUsersIds
          ? _value._selectedUsersIds
          : selectedUsersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FirstSelectionStatus,
    ));
  }
}

/// @nodoc

class _$FirstSelectionStateImpl implements _FirstSelectionState {
  const _$FirstSelectionStateImpl(
      {final List<ViewTopic> selectedTopics = const [],
      final List<String> selectedUsersIds = const [],
      this.status = FirstSelectionStatus.initial})
      : _selectedTopics = selectedTopics,
        _selectedUsersIds = selectedUsersIds;

  final List<ViewTopic> _selectedTopics;
  @override
  @JsonKey()
  List<ViewTopic> get selectedTopics {
    if (_selectedTopics is EqualUnmodifiableListView) return _selectedTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTopics);
  }

  final List<String> _selectedUsersIds;
  @override
  @JsonKey()
  List<String> get selectedUsersIds {
    if (_selectedUsersIds is EqualUnmodifiableListView)
      return _selectedUsersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedUsersIds);
  }

  @override
  @JsonKey()
  final FirstSelectionStatus status;

  @override
  String toString() {
    return 'FirstSelectionState(selectedTopics: $selectedTopics, selectedUsersIds: $selectedUsersIds, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstSelectionStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedTopics, _selectedTopics) &&
            const DeepCollectionEquality()
                .equals(other._selectedUsersIds, _selectedUsersIds) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedTopics),
      const DeepCollectionEquality().hash(_selectedUsersIds),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstSelectionStateImplCopyWith<_$FirstSelectionStateImpl> get copyWith =>
      __$$FirstSelectionStateImplCopyWithImpl<_$FirstSelectionStateImpl>(
          this, _$identity);
}

abstract class _FirstSelectionState implements FirstSelectionState {
  const factory _FirstSelectionState(
      {final List<ViewTopic> selectedTopics,
      final List<String> selectedUsersIds,
      final FirstSelectionStatus status}) = _$FirstSelectionStateImpl;

  @override
  List<ViewTopic> get selectedTopics;
  @override
  List<String> get selectedUsersIds;
  @override
  FirstSelectionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$FirstSelectionStateImplCopyWith<_$FirstSelectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
