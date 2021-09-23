// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  InitialSearch initial() {
    return const InitialSearch();
  }

  LoadingPreviousSearches loadingPreviousSearches() {
    return const LoadingPreviousSearches();
  }

  LoadedPreviousSearches loadedPreviousSearches(
      List<UnifiedSearchModel>? found) {
    return LoadedPreviousSearches(
      found,
    );
  }

  LoadingNewSearch loadingNewSearch() {
    return const LoadingNewSearch();
  }

  LoadedNewSearch loadedNewSearch(AggregatedSearchModel found) {
    return LoadedNewSearch(
      found,
    );
  }

  FailureSearch failure() {
    return const FailureSearch();
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingPreviousSearches,
    required TResult Function(List<UnifiedSearchModel>? found)
        loadedPreviousSearches,
    required TResult Function() loadingNewSearch,
    required TResult Function(AggregatedSearchModel found) loadedNewSearch,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingPreviousSearches,
    TResult Function(List<UnifiedSearchModel>? found)? loadedPreviousSearches,
    TResult Function()? loadingNewSearch,
    TResult Function(AggregatedSearchModel found)? loadedNewSearch,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearch value) initial,
    required TResult Function(LoadingPreviousSearches value)
        loadingPreviousSearches,
    required TResult Function(LoadedPreviousSearches value)
        loadedPreviousSearches,
    required TResult Function(LoadingNewSearch value) loadingNewSearch,
    required TResult Function(LoadedNewSearch value) loadedNewSearch,
    required TResult Function(FailureSearch value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearch value)? initial,
    TResult Function(LoadingPreviousSearches value)? loadingPreviousSearches,
    TResult Function(LoadedPreviousSearches value)? loadedPreviousSearches,
    TResult Function(LoadingNewSearch value)? loadingNewSearch,
    TResult Function(LoadedNewSearch value)? loadedNewSearch,
    TResult Function(FailureSearch value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class $InitialSearchCopyWith<$Res> {
  factory $InitialSearchCopyWith(
          InitialSearch value, $Res Function(InitialSearch) then) =
      _$InitialSearchCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialSearchCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements $InitialSearchCopyWith<$Res> {
  _$InitialSearchCopyWithImpl(
      InitialSearch _value, $Res Function(InitialSearch) _then)
      : super(_value, (v) => _then(v as InitialSearch));

  @override
  InitialSearch get _value => super._value as InitialSearch;
}

/// @nodoc

class _$InitialSearch implements InitialSearch {
  const _$InitialSearch();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingPreviousSearches,
    required TResult Function(List<UnifiedSearchModel>? found)
        loadedPreviousSearches,
    required TResult Function() loadingNewSearch,
    required TResult Function(AggregatedSearchModel found) loadedNewSearch,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingPreviousSearches,
    TResult Function(List<UnifiedSearchModel>? found)? loadedPreviousSearches,
    TResult Function()? loadingNewSearch,
    TResult Function(AggregatedSearchModel found)? loadedNewSearch,
    TResult Function()? failure,
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
    required TResult Function(InitialSearch value) initial,
    required TResult Function(LoadingPreviousSearches value)
        loadingPreviousSearches,
    required TResult Function(LoadedPreviousSearches value)
        loadedPreviousSearches,
    required TResult Function(LoadingNewSearch value) loadingNewSearch,
    required TResult Function(LoadedNewSearch value) loadedNewSearch,
    required TResult Function(FailureSearch value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearch value)? initial,
    TResult Function(LoadingPreviousSearches value)? loadingPreviousSearches,
    TResult Function(LoadedPreviousSearches value)? loadedPreviousSearches,
    TResult Function(LoadingNewSearch value)? loadingNewSearch,
    TResult Function(LoadedNewSearch value)? loadedNewSearch,
    TResult Function(FailureSearch value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialSearch implements SearchState {
  const factory InitialSearch() = _$InitialSearch;
}

/// @nodoc
abstract class $LoadingPreviousSearchesCopyWith<$Res> {
  factory $LoadingPreviousSearchesCopyWith(LoadingPreviousSearches value,
          $Res Function(LoadingPreviousSearches) then) =
      _$LoadingPreviousSearchesCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingPreviousSearchesCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements $LoadingPreviousSearchesCopyWith<$Res> {
  _$LoadingPreviousSearchesCopyWithImpl(LoadingPreviousSearches _value,
      $Res Function(LoadingPreviousSearches) _then)
      : super(_value, (v) => _then(v as LoadingPreviousSearches));

  @override
  LoadingPreviousSearches get _value => super._value as LoadingPreviousSearches;
}

/// @nodoc

class _$LoadingPreviousSearches implements LoadingPreviousSearches {
  const _$LoadingPreviousSearches();

  @override
  String toString() {
    return 'SearchState.loadingPreviousSearches()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingPreviousSearches);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingPreviousSearches,
    required TResult Function(List<UnifiedSearchModel>? found)
        loadedPreviousSearches,
    required TResult Function() loadingNewSearch,
    required TResult Function(AggregatedSearchModel found) loadedNewSearch,
    required TResult Function() failure,
  }) {
    return loadingPreviousSearches();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingPreviousSearches,
    TResult Function(List<UnifiedSearchModel>? found)? loadedPreviousSearches,
    TResult Function()? loadingNewSearch,
    TResult Function(AggregatedSearchModel found)? loadedNewSearch,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loadingPreviousSearches != null) {
      return loadingPreviousSearches();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearch value) initial,
    required TResult Function(LoadingPreviousSearches value)
        loadingPreviousSearches,
    required TResult Function(LoadedPreviousSearches value)
        loadedPreviousSearches,
    required TResult Function(LoadingNewSearch value) loadingNewSearch,
    required TResult Function(LoadedNewSearch value) loadedNewSearch,
    required TResult Function(FailureSearch value) failure,
  }) {
    return loadingPreviousSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearch value)? initial,
    TResult Function(LoadingPreviousSearches value)? loadingPreviousSearches,
    TResult Function(LoadedPreviousSearches value)? loadedPreviousSearches,
    TResult Function(LoadingNewSearch value)? loadingNewSearch,
    TResult Function(LoadedNewSearch value)? loadedNewSearch,
    TResult Function(FailureSearch value)? failure,
    required TResult orElse(),
  }) {
    if (loadingPreviousSearches != null) {
      return loadingPreviousSearches(this);
    }
    return orElse();
  }
}

abstract class LoadingPreviousSearches implements SearchState {
  const factory LoadingPreviousSearches() = _$LoadingPreviousSearches;
}

/// @nodoc
abstract class $LoadedPreviousSearchesCopyWith<$Res> {
  factory $LoadedPreviousSearchesCopyWith(LoadedPreviousSearches value,
          $Res Function(LoadedPreviousSearches) then) =
      _$LoadedPreviousSearchesCopyWithImpl<$Res>;
  $Res call({List<UnifiedSearchModel>? found});
}

/// @nodoc
class _$LoadedPreviousSearchesCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements $LoadedPreviousSearchesCopyWith<$Res> {
  _$LoadedPreviousSearchesCopyWithImpl(LoadedPreviousSearches _value,
      $Res Function(LoadedPreviousSearches) _then)
      : super(_value, (v) => _then(v as LoadedPreviousSearches));

  @override
  LoadedPreviousSearches get _value => super._value as LoadedPreviousSearches;

  @override
  $Res call({
    Object? found = freezed,
  }) {
    return _then(LoadedPreviousSearches(
      found == freezed
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as List<UnifiedSearchModel>?,
    ));
  }
}

/// @nodoc

class _$LoadedPreviousSearches implements LoadedPreviousSearches {
  const _$LoadedPreviousSearches(this.found);

  @override
  final List<UnifiedSearchModel>? found;

  @override
  String toString() {
    return 'SearchState.loadedPreviousSearches(found: $found)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedPreviousSearches &&
            (identical(other.found, found) ||
                const DeepCollectionEquality().equals(other.found, found)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(found);

  @JsonKey(ignore: true)
  @override
  $LoadedPreviousSearchesCopyWith<LoadedPreviousSearches> get copyWith =>
      _$LoadedPreviousSearchesCopyWithImpl<LoadedPreviousSearches>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingPreviousSearches,
    required TResult Function(List<UnifiedSearchModel>? found)
        loadedPreviousSearches,
    required TResult Function() loadingNewSearch,
    required TResult Function(AggregatedSearchModel found) loadedNewSearch,
    required TResult Function() failure,
  }) {
    return loadedPreviousSearches(found);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingPreviousSearches,
    TResult Function(List<UnifiedSearchModel>? found)? loadedPreviousSearches,
    TResult Function()? loadingNewSearch,
    TResult Function(AggregatedSearchModel found)? loadedNewSearch,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loadedPreviousSearches != null) {
      return loadedPreviousSearches(found);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearch value) initial,
    required TResult Function(LoadingPreviousSearches value)
        loadingPreviousSearches,
    required TResult Function(LoadedPreviousSearches value)
        loadedPreviousSearches,
    required TResult Function(LoadingNewSearch value) loadingNewSearch,
    required TResult Function(LoadedNewSearch value) loadedNewSearch,
    required TResult Function(FailureSearch value) failure,
  }) {
    return loadedPreviousSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearch value)? initial,
    TResult Function(LoadingPreviousSearches value)? loadingPreviousSearches,
    TResult Function(LoadedPreviousSearches value)? loadedPreviousSearches,
    TResult Function(LoadingNewSearch value)? loadingNewSearch,
    TResult Function(LoadedNewSearch value)? loadedNewSearch,
    TResult Function(FailureSearch value)? failure,
    required TResult orElse(),
  }) {
    if (loadedPreviousSearches != null) {
      return loadedPreviousSearches(this);
    }
    return orElse();
  }
}

abstract class LoadedPreviousSearches implements SearchState {
  const factory LoadedPreviousSearches(List<UnifiedSearchModel>? found) =
      _$LoadedPreviousSearches;

  List<UnifiedSearchModel>? get found => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedPreviousSearchesCopyWith<LoadedPreviousSearches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingNewSearchCopyWith<$Res> {
  factory $LoadingNewSearchCopyWith(
          LoadingNewSearch value, $Res Function(LoadingNewSearch) then) =
      _$LoadingNewSearchCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingNewSearchCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements $LoadingNewSearchCopyWith<$Res> {
  _$LoadingNewSearchCopyWithImpl(
      LoadingNewSearch _value, $Res Function(LoadingNewSearch) _then)
      : super(_value, (v) => _then(v as LoadingNewSearch));

  @override
  LoadingNewSearch get _value => super._value as LoadingNewSearch;
}

/// @nodoc

class _$LoadingNewSearch implements LoadingNewSearch {
  const _$LoadingNewSearch();

  @override
  String toString() {
    return 'SearchState.loadingNewSearch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingNewSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingPreviousSearches,
    required TResult Function(List<UnifiedSearchModel>? found)
        loadedPreviousSearches,
    required TResult Function() loadingNewSearch,
    required TResult Function(AggregatedSearchModel found) loadedNewSearch,
    required TResult Function() failure,
  }) {
    return loadingNewSearch();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingPreviousSearches,
    TResult Function(List<UnifiedSearchModel>? found)? loadedPreviousSearches,
    TResult Function()? loadingNewSearch,
    TResult Function(AggregatedSearchModel found)? loadedNewSearch,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loadingNewSearch != null) {
      return loadingNewSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearch value) initial,
    required TResult Function(LoadingPreviousSearches value)
        loadingPreviousSearches,
    required TResult Function(LoadedPreviousSearches value)
        loadedPreviousSearches,
    required TResult Function(LoadingNewSearch value) loadingNewSearch,
    required TResult Function(LoadedNewSearch value) loadedNewSearch,
    required TResult Function(FailureSearch value) failure,
  }) {
    return loadingNewSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearch value)? initial,
    TResult Function(LoadingPreviousSearches value)? loadingPreviousSearches,
    TResult Function(LoadedPreviousSearches value)? loadedPreviousSearches,
    TResult Function(LoadingNewSearch value)? loadingNewSearch,
    TResult Function(LoadedNewSearch value)? loadedNewSearch,
    TResult Function(FailureSearch value)? failure,
    required TResult orElse(),
  }) {
    if (loadingNewSearch != null) {
      return loadingNewSearch(this);
    }
    return orElse();
  }
}

abstract class LoadingNewSearch implements SearchState {
  const factory LoadingNewSearch() = _$LoadingNewSearch;
}

/// @nodoc
abstract class $LoadedNewSearchCopyWith<$Res> {
  factory $LoadedNewSearchCopyWith(
          LoadedNewSearch value, $Res Function(LoadedNewSearch) then) =
      _$LoadedNewSearchCopyWithImpl<$Res>;
  $Res call({AggregatedSearchModel found});

  $AggregatedSearchModelCopyWith<$Res> get found;
}

/// @nodoc
class _$LoadedNewSearchCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements $LoadedNewSearchCopyWith<$Res> {
  _$LoadedNewSearchCopyWithImpl(
      LoadedNewSearch _value, $Res Function(LoadedNewSearch) _then)
      : super(_value, (v) => _then(v as LoadedNewSearch));

  @override
  LoadedNewSearch get _value => super._value as LoadedNewSearch;

  @override
  $Res call({
    Object? found = freezed,
  }) {
    return _then(LoadedNewSearch(
      found == freezed
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as AggregatedSearchModel,
    ));
  }

  @override
  $AggregatedSearchModelCopyWith<$Res> get found {
    return $AggregatedSearchModelCopyWith<$Res>(_value.found, (value) {
      return _then(_value.copyWith(found: value));
    });
  }
}

/// @nodoc

class _$LoadedNewSearch implements LoadedNewSearch {
  const _$LoadedNewSearch(this.found);

  @override
  final AggregatedSearchModel found;

  @override
  String toString() {
    return 'SearchState.loadedNewSearch(found: $found)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedNewSearch &&
            (identical(other.found, found) ||
                const DeepCollectionEquality().equals(other.found, found)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(found);

  @JsonKey(ignore: true)
  @override
  $LoadedNewSearchCopyWith<LoadedNewSearch> get copyWith =>
      _$LoadedNewSearchCopyWithImpl<LoadedNewSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingPreviousSearches,
    required TResult Function(List<UnifiedSearchModel>? found)
        loadedPreviousSearches,
    required TResult Function() loadingNewSearch,
    required TResult Function(AggregatedSearchModel found) loadedNewSearch,
    required TResult Function() failure,
  }) {
    return loadedNewSearch(found);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingPreviousSearches,
    TResult Function(List<UnifiedSearchModel>? found)? loadedPreviousSearches,
    TResult Function()? loadingNewSearch,
    TResult Function(AggregatedSearchModel found)? loadedNewSearch,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loadedNewSearch != null) {
      return loadedNewSearch(found);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearch value) initial,
    required TResult Function(LoadingPreviousSearches value)
        loadingPreviousSearches,
    required TResult Function(LoadedPreviousSearches value)
        loadedPreviousSearches,
    required TResult Function(LoadingNewSearch value) loadingNewSearch,
    required TResult Function(LoadedNewSearch value) loadedNewSearch,
    required TResult Function(FailureSearch value) failure,
  }) {
    return loadedNewSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearch value)? initial,
    TResult Function(LoadingPreviousSearches value)? loadingPreviousSearches,
    TResult Function(LoadedPreviousSearches value)? loadedPreviousSearches,
    TResult Function(LoadingNewSearch value)? loadingNewSearch,
    TResult Function(LoadedNewSearch value)? loadedNewSearch,
    TResult Function(FailureSearch value)? failure,
    required TResult orElse(),
  }) {
    if (loadedNewSearch != null) {
      return loadedNewSearch(this);
    }
    return orElse();
  }
}

abstract class LoadedNewSearch implements SearchState {
  const factory LoadedNewSearch(AggregatedSearchModel found) =
      _$LoadedNewSearch;

  AggregatedSearchModel get found => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedNewSearchCopyWith<LoadedNewSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureSearchCopyWith<$Res> {
  factory $FailureSearchCopyWith(
          FailureSearch value, $Res Function(FailureSearch) then) =
      _$FailureSearchCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureSearchCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements $FailureSearchCopyWith<$Res> {
  _$FailureSearchCopyWithImpl(
      FailureSearch _value, $Res Function(FailureSearch) _then)
      : super(_value, (v) => _then(v as FailureSearch));

  @override
  FailureSearch get _value => super._value as FailureSearch;
}

/// @nodoc

class _$FailureSearch implements FailureSearch {
  const _$FailureSearch();

  @override
  String toString() {
    return 'SearchState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FailureSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingPreviousSearches,
    required TResult Function(List<UnifiedSearchModel>? found)
        loadedPreviousSearches,
    required TResult Function() loadingNewSearch,
    required TResult Function(AggregatedSearchModel found) loadedNewSearch,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingPreviousSearches,
    TResult Function(List<UnifiedSearchModel>? found)? loadedPreviousSearches,
    TResult Function()? loadingNewSearch,
    TResult Function(AggregatedSearchModel found)? loadedNewSearch,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearch value) initial,
    required TResult Function(LoadingPreviousSearches value)
        loadingPreviousSearches,
    required TResult Function(LoadedPreviousSearches value)
        loadedPreviousSearches,
    required TResult Function(LoadingNewSearch value) loadingNewSearch,
    required TResult Function(LoadedNewSearch value) loadedNewSearch,
    required TResult Function(FailureSearch value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearch value)? initial,
    TResult Function(LoadingPreviousSearches value)? loadingPreviousSearches,
    TResult Function(LoadedPreviousSearches value)? loadedPreviousSearches,
    TResult Function(LoadingNewSearch value)? loadingNewSearch,
    TResult Function(LoadedNewSearch value)? loadedNewSearch,
    TResult Function(FailureSearch value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureSearch implements SearchState {
  const factory FailureSearch() = _$FailureSearch;
}
