// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searched_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchedPostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchedText) fetchMorePosts,
    required TResult Function(String searchedText) searchPosts,
    required TResult Function() clearSearchResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchedText)? fetchMorePosts,
    TResult? Function(String searchedText)? searchPosts,
    TResult? Function()? clearSearchResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchedText)? fetchMorePosts,
    TResult Function(String searchedText)? searchPosts,
    TResult Function()? clearSearchResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMorePosts value) fetchMorePosts,
    required TResult Function(SearchPosts value) searchPosts,
    required TResult Function(ClearSearchResults value) clearSearchResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMorePosts value)? fetchMorePosts,
    TResult? Function(SearchPosts value)? searchPosts,
    TResult? Function(ClearSearchResults value)? clearSearchResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMorePosts value)? fetchMorePosts,
    TResult Function(SearchPosts value)? searchPosts,
    TResult Function(ClearSearchResults value)? clearSearchResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchedPostEventCopyWith<$Res> {
  factory $SearchedPostEventCopyWith(
          SearchedPostEvent value, $Res Function(SearchedPostEvent) then) =
      _$SearchedPostEventCopyWithImpl<$Res, SearchedPostEvent>;
}

/// @nodoc
class _$SearchedPostEventCopyWithImpl<$Res, $Val extends SearchedPostEvent>
    implements $SearchedPostEventCopyWith<$Res> {
  _$SearchedPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchMorePostsImplCopyWith<$Res> {
  factory _$$FetchMorePostsImplCopyWith(_$FetchMorePostsImpl value,
          $Res Function(_$FetchMorePostsImpl) then) =
      __$$FetchMorePostsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchedText});
}

/// @nodoc
class __$$FetchMorePostsImplCopyWithImpl<$Res>
    extends _$SearchedPostEventCopyWithImpl<$Res, _$FetchMorePostsImpl>
    implements _$$FetchMorePostsImplCopyWith<$Res> {
  __$$FetchMorePostsImplCopyWithImpl(
      _$FetchMorePostsImpl _value, $Res Function(_$FetchMorePostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedText = null,
  }) {
    return _then(_$FetchMorePostsImpl(
      null == searchedText
          ? _value.searchedText
          : searchedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchMorePostsImpl implements FetchMorePosts {
  const _$FetchMorePostsImpl(this.searchedText);

  @override
  final String searchedText;

  @override
  String toString() {
    return 'SearchedPostEvent.fetchMorePosts(searchedText: $searchedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMorePostsImpl &&
            (identical(other.searchedText, searchedText) ||
                other.searchedText == searchedText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchedText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMorePostsImplCopyWith<_$FetchMorePostsImpl> get copyWith =>
      __$$FetchMorePostsImplCopyWithImpl<_$FetchMorePostsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchedText) fetchMorePosts,
    required TResult Function(String searchedText) searchPosts,
    required TResult Function() clearSearchResults,
  }) {
    return fetchMorePosts(searchedText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchedText)? fetchMorePosts,
    TResult? Function(String searchedText)? searchPosts,
    TResult? Function()? clearSearchResults,
  }) {
    return fetchMorePosts?.call(searchedText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchedText)? fetchMorePosts,
    TResult Function(String searchedText)? searchPosts,
    TResult Function()? clearSearchResults,
    required TResult orElse(),
  }) {
    if (fetchMorePosts != null) {
      return fetchMorePosts(searchedText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMorePosts value) fetchMorePosts,
    required TResult Function(SearchPosts value) searchPosts,
    required TResult Function(ClearSearchResults value) clearSearchResults,
  }) {
    return fetchMorePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMorePosts value)? fetchMorePosts,
    TResult? Function(SearchPosts value)? searchPosts,
    TResult? Function(ClearSearchResults value)? clearSearchResults,
  }) {
    return fetchMorePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMorePosts value)? fetchMorePosts,
    TResult Function(SearchPosts value)? searchPosts,
    TResult Function(ClearSearchResults value)? clearSearchResults,
    required TResult orElse(),
  }) {
    if (fetchMorePosts != null) {
      return fetchMorePosts(this);
    }
    return orElse();
  }
}

abstract class FetchMorePosts implements SearchedPostEvent {
  const factory FetchMorePosts(final String searchedText) =
      _$FetchMorePostsImpl;

  String get searchedText;
  @JsonKey(ignore: true)
  _$$FetchMorePostsImplCopyWith<_$FetchMorePostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchPostsImplCopyWith<$Res> {
  factory _$$SearchPostsImplCopyWith(
          _$SearchPostsImpl value, $Res Function(_$SearchPostsImpl) then) =
      __$$SearchPostsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchedText});
}

/// @nodoc
class __$$SearchPostsImplCopyWithImpl<$Res>
    extends _$SearchedPostEventCopyWithImpl<$Res, _$SearchPostsImpl>
    implements _$$SearchPostsImplCopyWith<$Res> {
  __$$SearchPostsImplCopyWithImpl(
      _$SearchPostsImpl _value, $Res Function(_$SearchPostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedText = null,
  }) {
    return _then(_$SearchPostsImpl(
      null == searchedText
          ? _value.searchedText
          : searchedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchPostsImpl implements SearchPosts {
  const _$SearchPostsImpl(this.searchedText);

  @override
  final String searchedText;

  @override
  String toString() {
    return 'SearchedPostEvent.searchPosts(searchedText: $searchedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPostsImpl &&
            (identical(other.searchedText, searchedText) ||
                other.searchedText == searchedText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchedText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPostsImplCopyWith<_$SearchPostsImpl> get copyWith =>
      __$$SearchPostsImplCopyWithImpl<_$SearchPostsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchedText) fetchMorePosts,
    required TResult Function(String searchedText) searchPosts,
    required TResult Function() clearSearchResults,
  }) {
    return searchPosts(searchedText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchedText)? fetchMorePosts,
    TResult? Function(String searchedText)? searchPosts,
    TResult? Function()? clearSearchResults,
  }) {
    return searchPosts?.call(searchedText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchedText)? fetchMorePosts,
    TResult Function(String searchedText)? searchPosts,
    TResult Function()? clearSearchResults,
    required TResult orElse(),
  }) {
    if (searchPosts != null) {
      return searchPosts(searchedText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMorePosts value) fetchMorePosts,
    required TResult Function(SearchPosts value) searchPosts,
    required TResult Function(ClearSearchResults value) clearSearchResults,
  }) {
    return searchPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMorePosts value)? fetchMorePosts,
    TResult? Function(SearchPosts value)? searchPosts,
    TResult? Function(ClearSearchResults value)? clearSearchResults,
  }) {
    return searchPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMorePosts value)? fetchMorePosts,
    TResult Function(SearchPosts value)? searchPosts,
    TResult Function(ClearSearchResults value)? clearSearchResults,
    required TResult orElse(),
  }) {
    if (searchPosts != null) {
      return searchPosts(this);
    }
    return orElse();
  }
}

abstract class SearchPosts implements SearchedPostEvent {
  const factory SearchPosts(final String searchedText) = _$SearchPostsImpl;

  String get searchedText;
  @JsonKey(ignore: true)
  _$$SearchPostsImplCopyWith<_$SearchPostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchResultsImplCopyWith<$Res> {
  factory _$$ClearSearchResultsImplCopyWith(_$ClearSearchResultsImpl value,
          $Res Function(_$ClearSearchResultsImpl) then) =
      __$$ClearSearchResultsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchResultsImplCopyWithImpl<$Res>
    extends _$SearchedPostEventCopyWithImpl<$Res, _$ClearSearchResultsImpl>
    implements _$$ClearSearchResultsImplCopyWith<$Res> {
  __$$ClearSearchResultsImplCopyWithImpl(_$ClearSearchResultsImpl _value,
      $Res Function(_$ClearSearchResultsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchResultsImpl implements ClearSearchResults {
  const _$ClearSearchResultsImpl();

  @override
  String toString() {
    return 'SearchedPostEvent.clearSearchResults()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchResultsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchedText) fetchMorePosts,
    required TResult Function(String searchedText) searchPosts,
    required TResult Function() clearSearchResults,
  }) {
    return clearSearchResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchedText)? fetchMorePosts,
    TResult? Function(String searchedText)? searchPosts,
    TResult? Function()? clearSearchResults,
  }) {
    return clearSearchResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchedText)? fetchMorePosts,
    TResult Function(String searchedText)? searchPosts,
    TResult Function()? clearSearchResults,
    required TResult orElse(),
  }) {
    if (clearSearchResults != null) {
      return clearSearchResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMorePosts value) fetchMorePosts,
    required TResult Function(SearchPosts value) searchPosts,
    required TResult Function(ClearSearchResults value) clearSearchResults,
  }) {
    return clearSearchResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMorePosts value)? fetchMorePosts,
    TResult? Function(SearchPosts value)? searchPosts,
    TResult? Function(ClearSearchResults value)? clearSearchResults,
  }) {
    return clearSearchResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMorePosts value)? fetchMorePosts,
    TResult Function(SearchPosts value)? searchPosts,
    TResult Function(ClearSearchResults value)? clearSearchResults,
    required TResult orElse(),
  }) {
    if (clearSearchResults != null) {
      return clearSearchResults(this);
    }
    return orElse();
  }
}

abstract class ClearSearchResults implements SearchedPostEvent {
  const factory ClearSearchResults() = _$ClearSearchResultsImpl;
}

/// @nodoc
mixin _$SearchedPostState {
  SearchedPostStatus get status => throw _privateConstructorUsedError;
  List<ViewPost> get posts => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchedPostStateCopyWith<SearchedPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchedPostStateCopyWith<$Res> {
  factory $SearchedPostStateCopyWith(
          SearchedPostState value, $Res Function(SearchedPostState) then) =
      _$SearchedPostStateCopyWithImpl<$Res, SearchedPostState>;
  @useResult
  $Res call(
      {SearchedPostStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class _$SearchedPostStateCopyWithImpl<$Res, $Val extends SearchedPostState>
    implements $SearchedPostStateCopyWith<$Res> {
  _$SearchedPostStateCopyWithImpl(this._value, this._then);

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
              as SearchedPostStatus,
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
    implements $SearchedPostStateCopyWith<$Res> {
  factory _$$PostStateImplCopyWith(
          _$PostStateImpl value, $Res Function(_$PostStateImpl) then) =
      __$$PostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchedPostStatus status, List<ViewPost> posts, bool hasMoreData});
}

/// @nodoc
class __$$PostStateImplCopyWithImpl<$Res>
    extends _$SearchedPostStateCopyWithImpl<$Res, _$PostStateImpl>
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
              as SearchedPostStatus,
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

class _$PostStateImpl implements _PostState {
  _$PostStateImpl(
      {required this.status,
      required final List<ViewPost> posts,
      required this.hasMoreData})
      : _posts = posts;

  @override
  final SearchedPostStatus status;
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
  String toString() {
    return 'SearchedPostState(status: $status, posts: $posts, hasMoreData: $hasMoreData)';
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

abstract class _PostState implements SearchedPostState {
  factory _PostState(
      {required final SearchedPostStatus status,
      required final List<ViewPost> posts,
      required final bool hasMoreData}) = _$PostStateImpl;

  @override
  SearchedPostStatus get status;
  @override
  List<ViewPost> get posts;
  @override
  bool get hasMoreData;
  @override
  @JsonKey(ignore: true)
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
