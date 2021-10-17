// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'charts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChartsStateTearOff {
  const _$ChartsStateTearOff();

  ChartsStateLoading loading() {
    return const ChartsStateLoading();
  }

  ChartsStateRefreshing refreshing() {
    return const ChartsStateRefreshing();
  }

  ChartsStateLoaded loaded(ArtistShort? bestArtist,
      List<ArtistShort>? weeklyArtists, List<ArtistShort>? overallArtists) {
    return ChartsStateLoaded(
      bestArtist,
      weeklyArtists,
      overallArtists,
    );
  }

  ChartsStateError error(String error) {
    return ChartsStateError(
      error,
    );
  }
}

/// @nodoc
const $ChartsState = _$ChartsStateTearOff();

/// @nodoc
mixin _$ChartsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(ArtistShort? bestArtist,
            List<ArtistShort>? weeklyArtists, List<ArtistShort>? overallArtists)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(ArtistShort? bestArtist, List<ArtistShort>? weeklyArtists,
            List<ArtistShort>? overallArtists)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartsStateLoading value) loading,
    required TResult Function(ChartsStateRefreshing value) refreshing,
    required TResult Function(ChartsStateLoaded value) loaded,
    required TResult Function(ChartsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartsStateLoading value)? loading,
    TResult Function(ChartsStateRefreshing value)? refreshing,
    TResult Function(ChartsStateLoaded value)? loaded,
    TResult Function(ChartsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartsStateCopyWith<$Res> {
  factory $ChartsStateCopyWith(
          ChartsState value, $Res Function(ChartsState) then) =
      _$ChartsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChartsStateCopyWithImpl<$Res> implements $ChartsStateCopyWith<$Res> {
  _$ChartsStateCopyWithImpl(this._value, this._then);

  final ChartsState _value;
  // ignore: unused_field
  final $Res Function(ChartsState) _then;
}

/// @nodoc
abstract class $ChartsStateLoadingCopyWith<$Res> {
  factory $ChartsStateLoadingCopyWith(
          ChartsStateLoading value, $Res Function(ChartsStateLoading) then) =
      _$ChartsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChartsStateLoadingCopyWithImpl<$Res>
    extends _$ChartsStateCopyWithImpl<$Res>
    implements $ChartsStateLoadingCopyWith<$Res> {
  _$ChartsStateLoadingCopyWithImpl(
      ChartsStateLoading _value, $Res Function(ChartsStateLoading) _then)
      : super(_value, (v) => _then(v as ChartsStateLoading));

  @override
  ChartsStateLoading get _value => super._value as ChartsStateLoading;
}

/// @nodoc

class _$ChartsStateLoading implements ChartsStateLoading {
  const _$ChartsStateLoading();

  @override
  String toString() {
    return 'ChartsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ChartsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(ArtistShort? bestArtist,
            List<ArtistShort>? weeklyArtists, List<ArtistShort>? overallArtists)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(ArtistShort? bestArtist, List<ArtistShort>? weeklyArtists,
            List<ArtistShort>? overallArtists)?
        loaded,
    TResult Function(String error)? error,
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
    required TResult Function(ChartsStateLoading value) loading,
    required TResult Function(ChartsStateRefreshing value) refreshing,
    required TResult Function(ChartsStateLoaded value) loaded,
    required TResult Function(ChartsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartsStateLoading value)? loading,
    TResult Function(ChartsStateRefreshing value)? refreshing,
    TResult Function(ChartsStateLoaded value)? loaded,
    TResult Function(ChartsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChartsStateLoading implements ChartsState {
  const factory ChartsStateLoading() = _$ChartsStateLoading;
}

/// @nodoc
abstract class $ChartsStateRefreshingCopyWith<$Res> {
  factory $ChartsStateRefreshingCopyWith(ChartsStateRefreshing value,
          $Res Function(ChartsStateRefreshing) then) =
      _$ChartsStateRefreshingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChartsStateRefreshingCopyWithImpl<$Res>
    extends _$ChartsStateCopyWithImpl<$Res>
    implements $ChartsStateRefreshingCopyWith<$Res> {
  _$ChartsStateRefreshingCopyWithImpl(
      ChartsStateRefreshing _value, $Res Function(ChartsStateRefreshing) _then)
      : super(_value, (v) => _then(v as ChartsStateRefreshing));

  @override
  ChartsStateRefreshing get _value => super._value as ChartsStateRefreshing;
}

/// @nodoc

class _$ChartsStateRefreshing implements ChartsStateRefreshing {
  const _$ChartsStateRefreshing();

  @override
  String toString() {
    return 'ChartsState.refreshing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ChartsStateRefreshing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(ArtistShort? bestArtist,
            List<ArtistShort>? weeklyArtists, List<ArtistShort>? overallArtists)
        loaded,
    required TResult Function(String error) error,
  }) {
    return refreshing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(ArtistShort? bestArtist, List<ArtistShort>? weeklyArtists,
            List<ArtistShort>? overallArtists)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartsStateLoading value) loading,
    required TResult Function(ChartsStateRefreshing value) refreshing,
    required TResult Function(ChartsStateLoaded value) loaded,
    required TResult Function(ChartsStateError value) error,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartsStateLoading value)? loading,
    TResult Function(ChartsStateRefreshing value)? refreshing,
    TResult Function(ChartsStateLoaded value)? loaded,
    TResult Function(ChartsStateError value)? error,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class ChartsStateRefreshing implements ChartsState {
  const factory ChartsStateRefreshing() = _$ChartsStateRefreshing;
}

/// @nodoc
abstract class $ChartsStateLoadedCopyWith<$Res> {
  factory $ChartsStateLoadedCopyWith(
          ChartsStateLoaded value, $Res Function(ChartsStateLoaded) then) =
      _$ChartsStateLoadedCopyWithImpl<$Res>;
  $Res call(
      {ArtistShort? bestArtist,
      List<ArtistShort>? weeklyArtists,
      List<ArtistShort>? overallArtists});

  $ArtistShortCopyWith<$Res>? get bestArtist;
}

/// @nodoc
class _$ChartsStateLoadedCopyWithImpl<$Res>
    extends _$ChartsStateCopyWithImpl<$Res>
    implements $ChartsStateLoadedCopyWith<$Res> {
  _$ChartsStateLoadedCopyWithImpl(
      ChartsStateLoaded _value, $Res Function(ChartsStateLoaded) _then)
      : super(_value, (v) => _then(v as ChartsStateLoaded));

  @override
  ChartsStateLoaded get _value => super._value as ChartsStateLoaded;

  @override
  $Res call({
    Object? bestArtist = freezed,
    Object? weeklyArtists = freezed,
    Object? overallArtists = freezed,
  }) {
    return _then(ChartsStateLoaded(
      bestArtist == freezed
          ? _value.bestArtist
          : bestArtist // ignore: cast_nullable_to_non_nullable
              as ArtistShort?,
      weeklyArtists == freezed
          ? _value.weeklyArtists
          : weeklyArtists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>?,
      overallArtists == freezed
          ? _value.overallArtists
          : overallArtists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>?,
    ));
  }

  @override
  $ArtistShortCopyWith<$Res>? get bestArtist {
    if (_value.bestArtist == null) {
      return null;
    }

    return $ArtistShortCopyWith<$Res>(_value.bestArtist!, (value) {
      return _then(_value.copyWith(bestArtist: value));
    });
  }
}

/// @nodoc

class _$ChartsStateLoaded implements ChartsStateLoaded {
  const _$ChartsStateLoaded(
      this.bestArtist, this.weeklyArtists, this.overallArtists);

  @override
  final ArtistShort? bestArtist;
  @override
  final List<ArtistShort>? weeklyArtists;
  @override
  final List<ArtistShort>? overallArtists;

  @override
  String toString() {
    return 'ChartsState.loaded(bestArtist: $bestArtist, weeklyArtists: $weeklyArtists, overallArtists: $overallArtists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChartsStateLoaded &&
            (identical(other.bestArtist, bestArtist) ||
                const DeepCollectionEquality()
                    .equals(other.bestArtist, bestArtist)) &&
            (identical(other.weeklyArtists, weeklyArtists) ||
                const DeepCollectionEquality()
                    .equals(other.weeklyArtists, weeklyArtists)) &&
            (identical(other.overallArtists, overallArtists) ||
                const DeepCollectionEquality()
                    .equals(other.overallArtists, overallArtists)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bestArtist) ^
      const DeepCollectionEquality().hash(weeklyArtists) ^
      const DeepCollectionEquality().hash(overallArtists);

  @JsonKey(ignore: true)
  @override
  $ChartsStateLoadedCopyWith<ChartsStateLoaded> get copyWith =>
      _$ChartsStateLoadedCopyWithImpl<ChartsStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(ArtistShort? bestArtist,
            List<ArtistShort>? weeklyArtists, List<ArtistShort>? overallArtists)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(bestArtist, weeklyArtists, overallArtists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(ArtistShort? bestArtist, List<ArtistShort>? weeklyArtists,
            List<ArtistShort>? overallArtists)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(bestArtist, weeklyArtists, overallArtists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartsStateLoading value) loading,
    required TResult Function(ChartsStateRefreshing value) refreshing,
    required TResult Function(ChartsStateLoaded value) loaded,
    required TResult Function(ChartsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartsStateLoading value)? loading,
    TResult Function(ChartsStateRefreshing value)? refreshing,
    TResult Function(ChartsStateLoaded value)? loaded,
    TResult Function(ChartsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ChartsStateLoaded implements ChartsState {
  const factory ChartsStateLoaded(
      ArtistShort? bestArtist,
      List<ArtistShort>? weeklyArtists,
      List<ArtistShort>? overallArtists) = _$ChartsStateLoaded;

  ArtistShort? get bestArtist => throw _privateConstructorUsedError;
  List<ArtistShort>? get weeklyArtists => throw _privateConstructorUsedError;
  List<ArtistShort>? get overallArtists => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartsStateLoadedCopyWith<ChartsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartsStateErrorCopyWith<$Res> {
  factory $ChartsStateErrorCopyWith(
          ChartsStateError value, $Res Function(ChartsStateError) then) =
      _$ChartsStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ChartsStateErrorCopyWithImpl<$Res>
    extends _$ChartsStateCopyWithImpl<$Res>
    implements $ChartsStateErrorCopyWith<$Res> {
  _$ChartsStateErrorCopyWithImpl(
      ChartsStateError _value, $Res Function(ChartsStateError) _then)
      : super(_value, (v) => _then(v as ChartsStateError));

  @override
  ChartsStateError get _value => super._value as ChartsStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ChartsStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChartsStateError implements ChartsStateError {
  const _$ChartsStateError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ChartsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChartsStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ChartsStateErrorCopyWith<ChartsStateError> get copyWith =>
      _$ChartsStateErrorCopyWithImpl<ChartsStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(ArtistShort? bestArtist,
            List<ArtistShort>? weeklyArtists, List<ArtistShort>? overallArtists)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(ArtistShort? bestArtist, List<ArtistShort>? weeklyArtists,
            List<ArtistShort>? overallArtists)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChartsStateLoading value) loading,
    required TResult Function(ChartsStateRefreshing value) refreshing,
    required TResult Function(ChartsStateLoaded value) loaded,
    required TResult Function(ChartsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChartsStateLoading value)? loading,
    TResult Function(ChartsStateRefreshing value)? refreshing,
    TResult Function(ChartsStateLoaded value)? loaded,
    TResult Function(ChartsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChartsStateError implements ChartsState {
  const factory ChartsStateError(String error) = _$ChartsStateError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartsStateErrorCopyWith<ChartsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
