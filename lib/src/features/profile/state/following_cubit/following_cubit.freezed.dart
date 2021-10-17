// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'following_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowingStateTearOff {
  const _$FollowingStateTearOff();

  FollowingLoadingState loading() {
    return const FollowingLoadingState();
  }

  FollowingLoadedState loaded(
      {required List<EventShort> events,
      required List<ArtistShort> artists,
      required List<PlaceShort> places,
      required List<UnityShort> unities}) {
    return FollowingLoadedState(
      events: events,
      artists: artists,
      places: places,
      unities: unities,
    );
  }
}

/// @nodoc
const $FollowingState = _$FollowingStateTearOff();

/// @nodoc
mixin _$FollowingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<EventShort> events,
            List<ArtistShort> artists,
            List<PlaceShort> places,
            List<UnityShort> unities)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventShort> events, List<ArtistShort> artists,
            List<PlaceShort> places, List<UnityShort> unities)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FollowingLoadingState value) loading,
    required TResult Function(FollowingLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FollowingLoadingState value)? loading,
    TResult Function(FollowingLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingStateCopyWith<$Res> {
  factory $FollowingStateCopyWith(
          FollowingState value, $Res Function(FollowingState) then) =
      _$FollowingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FollowingStateCopyWithImpl<$Res>
    implements $FollowingStateCopyWith<$Res> {
  _$FollowingStateCopyWithImpl(this._value, this._then);

  final FollowingState _value;
  // ignore: unused_field
  final $Res Function(FollowingState) _then;
}

/// @nodoc
abstract class $FollowingLoadingStateCopyWith<$Res> {
  factory $FollowingLoadingStateCopyWith(FollowingLoadingState value,
          $Res Function(FollowingLoadingState) then) =
      _$FollowingLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FollowingLoadingStateCopyWithImpl<$Res>
    extends _$FollowingStateCopyWithImpl<$Res>
    implements $FollowingLoadingStateCopyWith<$Res> {
  _$FollowingLoadingStateCopyWithImpl(
      FollowingLoadingState _value, $Res Function(FollowingLoadingState) _then)
      : super(_value, (v) => _then(v as FollowingLoadingState));

  @override
  FollowingLoadingState get _value => super._value as FollowingLoadingState;
}

/// @nodoc

class _$FollowingLoadingState implements FollowingLoadingState {
  const _$FollowingLoadingState();

  @override
  String toString() {
    return 'FollowingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FollowingLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<EventShort> events,
            List<ArtistShort> artists,
            List<PlaceShort> places,
            List<UnityShort> unities)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventShort> events, List<ArtistShort> artists,
            List<PlaceShort> places, List<UnityShort> unities)?
        loaded,
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
    required TResult Function(FollowingLoadingState value) loading,
    required TResult Function(FollowingLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FollowingLoadingState value)? loading,
    TResult Function(FollowingLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FollowingLoadingState implements FollowingState {
  const factory FollowingLoadingState() = _$FollowingLoadingState;
}

/// @nodoc
abstract class $FollowingLoadedStateCopyWith<$Res> {
  factory $FollowingLoadedStateCopyWith(FollowingLoadedState value,
          $Res Function(FollowingLoadedState) then) =
      _$FollowingLoadedStateCopyWithImpl<$Res>;
  $Res call(
      {List<EventShort> events,
      List<ArtistShort> artists,
      List<PlaceShort> places,
      List<UnityShort> unities});
}

/// @nodoc
class _$FollowingLoadedStateCopyWithImpl<$Res>
    extends _$FollowingStateCopyWithImpl<$Res>
    implements $FollowingLoadedStateCopyWith<$Res> {
  _$FollowingLoadedStateCopyWithImpl(
      FollowingLoadedState _value, $Res Function(FollowingLoadedState) _then)
      : super(_value, (v) => _then(v as FollowingLoadedState));

  @override
  FollowingLoadedState get _value => super._value as FollowingLoadedState;

  @override
  $Res call({
    Object? events = freezed,
    Object? artists = freezed,
    Object? places = freezed,
    Object? unities = freezed,
  }) {
    return _then(FollowingLoadedState(
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>,
      places: places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceShort>,
      unities: unities == freezed
          ? _value.unities
          : unities // ignore: cast_nullable_to_non_nullable
              as List<UnityShort>,
    ));
  }
}

/// @nodoc

class _$FollowingLoadedState implements FollowingLoadedState {
  const _$FollowingLoadedState(
      {required this.events,
      required this.artists,
      required this.places,
      required this.unities});

  @override
  final List<EventShort> events;
  @override
  final List<ArtistShort> artists;
  @override
  final List<PlaceShort> places;
  @override
  final List<UnityShort> unities;

  @override
  String toString() {
    return 'FollowingState.loaded(events: $events, artists: $artists, places: $places, unities: $unities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FollowingLoadedState &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)) &&
            (identical(other.artists, artists) ||
                const DeepCollectionEquality()
                    .equals(other.artists, artists)) &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)) &&
            (identical(other.unities, unities) ||
                const DeepCollectionEquality().equals(other.unities, unities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(events) ^
      const DeepCollectionEquality().hash(artists) ^
      const DeepCollectionEquality().hash(places) ^
      const DeepCollectionEquality().hash(unities);

  @JsonKey(ignore: true)
  @override
  $FollowingLoadedStateCopyWith<FollowingLoadedState> get copyWith =>
      _$FollowingLoadedStateCopyWithImpl<FollowingLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<EventShort> events,
            List<ArtistShort> artists,
            List<PlaceShort> places,
            List<UnityShort> unities)
        loaded,
  }) {
    return loaded(events, artists, places, unities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventShort> events, List<ArtistShort> artists,
            List<PlaceShort> places, List<UnityShort> unities)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(events, artists, places, unities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FollowingLoadingState value) loading,
    required TResult Function(FollowingLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FollowingLoadingState value)? loading,
    TResult Function(FollowingLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FollowingLoadedState implements FollowingState {
  const factory FollowingLoadedState(
      {required List<EventShort> events,
      required List<ArtistShort> artists,
      required List<PlaceShort> places,
      required List<UnityShort> unities}) = _$FollowingLoadedState;

  List<EventShort> get events => throw _privateConstructorUsedError;
  List<ArtistShort> get artists => throw _privateConstructorUsedError;
  List<PlaceShort> get places => throw _privateConstructorUsedError;
  List<UnityShort> get unities => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingLoadedStateCopyWith<FollowingLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
