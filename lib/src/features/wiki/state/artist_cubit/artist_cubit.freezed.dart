// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'artist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ArtistStateTearOff {
  const _$ArtistStateTearOff();

  ArtistLoadingState loading() {
    return const ArtistLoadingState();
  }

  ArtistLoadedState loaded(
      ArtistFull artist, List<UnityShort> unities, List<EventShort> events) {
    return ArtistLoadedState(
      artist,
      unities,
      events,
    );
  }

  ArtistFailureState failure() {
    return const ArtistFailureState();
  }
}

/// @nodoc
const $ArtistState = _$ArtistStateTearOff();

/// @nodoc
mixin _$ArtistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)?
        loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistLoadingState value) loading,
    required TResult Function(ArtistLoadedState value) loaded,
    required TResult Function(ArtistFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistLoadingState value)? loading,
    TResult Function(ArtistLoadedState value)? loaded,
    TResult Function(ArtistFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistStateCopyWith<$Res> {
  factory $ArtistStateCopyWith(
          ArtistState value, $Res Function(ArtistState) then) =
      _$ArtistStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArtistStateCopyWithImpl<$Res> implements $ArtistStateCopyWith<$Res> {
  _$ArtistStateCopyWithImpl(this._value, this._then);

  final ArtistState _value;
  // ignore: unused_field
  final $Res Function(ArtistState) _then;
}

/// @nodoc
abstract class $ArtistLoadingStateCopyWith<$Res> {
  factory $ArtistLoadingStateCopyWith(
          ArtistLoadingState value, $Res Function(ArtistLoadingState) then) =
      _$ArtistLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArtistLoadingStateCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res>
    implements $ArtistLoadingStateCopyWith<$Res> {
  _$ArtistLoadingStateCopyWithImpl(
      ArtistLoadingState _value, $Res Function(ArtistLoadingState) _then)
      : super(_value, (v) => _then(v as ArtistLoadingState));

  @override
  ArtistLoadingState get _value => super._value as ArtistLoadingState;
}

/// @nodoc

class _$ArtistLoadingState implements ArtistLoadingState {
  const _$ArtistLoadingState();

  @override
  String toString() {
    return 'ArtistState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ArtistLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)?
        loaded,
    TResult Function()? failure,
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
    required TResult Function(ArtistLoadingState value) loading,
    required TResult Function(ArtistLoadedState value) loaded,
    required TResult Function(ArtistFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistLoadingState value)? loading,
    TResult Function(ArtistLoadedState value)? loaded,
    TResult Function(ArtistFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ArtistLoadingState implements ArtistState {
  const factory ArtistLoadingState() = _$ArtistLoadingState;
}

/// @nodoc
abstract class $ArtistLoadedStateCopyWith<$Res> {
  factory $ArtistLoadedStateCopyWith(
          ArtistLoadedState value, $Res Function(ArtistLoadedState) then) =
      _$ArtistLoadedStateCopyWithImpl<$Res>;
  $Res call(
      {ArtistFull artist, List<UnityShort> unities, List<EventShort> events});

  $ArtistFullCopyWith<$Res> get artist;
}

/// @nodoc
class _$ArtistLoadedStateCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res>
    implements $ArtistLoadedStateCopyWith<$Res> {
  _$ArtistLoadedStateCopyWithImpl(
      ArtistLoadedState _value, $Res Function(ArtistLoadedState) _then)
      : super(_value, (v) => _then(v as ArtistLoadedState));

  @override
  ArtistLoadedState get _value => super._value as ArtistLoadedState;

  @override
  $Res call({
    Object? artist = freezed,
    Object? unities = freezed,
    Object? events = freezed,
  }) {
    return _then(ArtistLoadedState(
      artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistFull,
      unities == freezed
          ? _value.unities
          : unities // ignore: cast_nullable_to_non_nullable
              as List<UnityShort>,
      events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
    ));
  }

  @override
  $ArtistFullCopyWith<$Res> get artist {
    return $ArtistFullCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value));
    });
  }
}

/// @nodoc

class _$ArtistLoadedState implements ArtistLoadedState {
  const _$ArtistLoadedState(this.artist, this.unities, this.events);

  @override
  final ArtistFull artist;
  @override
  final List<UnityShort> unities;
  @override
  final List<EventShort> events;

  @override
  String toString() {
    return 'ArtistState.loaded(artist: $artist, unities: $unities, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ArtistLoadedState &&
            (identical(other.artist, artist) ||
                const DeepCollectionEquality().equals(other.artist, artist)) &&
            (identical(other.unities, unities) ||
                const DeepCollectionEquality()
                    .equals(other.unities, unities)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(artist) ^
      const DeepCollectionEquality().hash(unities) ^
      const DeepCollectionEquality().hash(events);

  @JsonKey(ignore: true)
  @override
  $ArtistLoadedStateCopyWith<ArtistLoadedState> get copyWith =>
      _$ArtistLoadedStateCopyWithImpl<ArtistLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return loaded(artist, unities, events);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)?
        loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(artist, unities, events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistLoadingState value) loading,
    required TResult Function(ArtistLoadedState value) loaded,
    required TResult Function(ArtistFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistLoadingState value)? loading,
    TResult Function(ArtistLoadedState value)? loaded,
    TResult Function(ArtistFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ArtistLoadedState implements ArtistState {
  const factory ArtistLoadedState(ArtistFull artist, List<UnityShort> unities,
      List<EventShort> events) = _$ArtistLoadedState;

  ArtistFull get artist => throw _privateConstructorUsedError;
  List<UnityShort> get unities => throw _privateConstructorUsedError;
  List<EventShort> get events => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistLoadedStateCopyWith<ArtistLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistFailureStateCopyWith<$Res> {
  factory $ArtistFailureStateCopyWith(
          ArtistFailureState value, $Res Function(ArtistFailureState) then) =
      _$ArtistFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArtistFailureStateCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res>
    implements $ArtistFailureStateCopyWith<$Res> {
  _$ArtistFailureStateCopyWithImpl(
      ArtistFailureState _value, $Res Function(ArtistFailureState) _then)
      : super(_value, (v) => _then(v as ArtistFailureState));

  @override
  ArtistFailureState get _value => super._value as ArtistFailureState;
}

/// @nodoc

class _$ArtistFailureState implements ArtistFailureState {
  const _$ArtistFailureState();

  @override
  String toString() {
    return 'ArtistState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ArtistFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtistFull artist, List<UnityShort> unities,
            List<EventShort> events)?
        loaded,
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
    required TResult Function(ArtistLoadingState value) loading,
    required TResult Function(ArtistLoadedState value) loaded,
    required TResult Function(ArtistFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistLoadingState value)? loading,
    TResult Function(ArtistLoadedState value)? loaded,
    TResult Function(ArtistFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ArtistFailureState implements ArtistState {
  const factory ArtistFailureState() = _$ArtistFailureState;
}
