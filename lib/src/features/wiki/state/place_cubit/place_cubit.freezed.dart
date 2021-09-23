// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'place_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlaceStateTearOff {
  const _$PlaceStateTearOff();

  PlaceLoadingState loading() {
    return const PlaceLoadingState();
  }

  PlaceLoadedState loaded(
      PlaceFull place, List<Scene> scenes, List<EventShort> events) {
    return PlaceLoadedState(
      place,
      scenes,
      events,
    );
  }

  PlaceFailureState failure() {
    return const PlaceFailureState();
  }
}

/// @nodoc
const $PlaceState = _$PlaceStateTearOff();

/// @nodoc
mixin _$PlaceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)?
        loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceLoadingState value) loading,
    required TResult Function(PlaceLoadedState value) loaded,
    required TResult Function(PlaceFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceLoadingState value)? loading,
    TResult Function(PlaceLoadedState value)? loaded,
    TResult Function(PlaceFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceStateCopyWith<$Res> {
  factory $PlaceStateCopyWith(
          PlaceState value, $Res Function(PlaceState) then) =
      _$PlaceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaceStateCopyWithImpl<$Res> implements $PlaceStateCopyWith<$Res> {
  _$PlaceStateCopyWithImpl(this._value, this._then);

  final PlaceState _value;
  // ignore: unused_field
  final $Res Function(PlaceState) _then;
}

/// @nodoc
abstract class $PlaceLoadingStateCopyWith<$Res> {
  factory $PlaceLoadingStateCopyWith(
          PlaceLoadingState value, $Res Function(PlaceLoadingState) then) =
      _$PlaceLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaceLoadingStateCopyWithImpl<$Res>
    extends _$PlaceStateCopyWithImpl<$Res>
    implements $PlaceLoadingStateCopyWith<$Res> {
  _$PlaceLoadingStateCopyWithImpl(
      PlaceLoadingState _value, $Res Function(PlaceLoadingState) _then)
      : super(_value, (v) => _then(v as PlaceLoadingState));

  @override
  PlaceLoadingState get _value => super._value as PlaceLoadingState;
}

/// @nodoc

class _$PlaceLoadingState implements PlaceLoadingState {
  const _$PlaceLoadingState();

  @override
  String toString() {
    return 'PlaceState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PlaceLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)?
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
    required TResult Function(PlaceLoadingState value) loading,
    required TResult Function(PlaceLoadedState value) loaded,
    required TResult Function(PlaceFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceLoadingState value)? loading,
    TResult Function(PlaceLoadedState value)? loaded,
    TResult Function(PlaceFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PlaceLoadingState implements PlaceState {
  const factory PlaceLoadingState() = _$PlaceLoadingState;
}

/// @nodoc
abstract class $PlaceLoadedStateCopyWith<$Res> {
  factory $PlaceLoadedStateCopyWith(
          PlaceLoadedState value, $Res Function(PlaceLoadedState) then) =
      _$PlaceLoadedStateCopyWithImpl<$Res>;
  $Res call({PlaceFull place, List<Scene> scenes, List<EventShort> events});

  $PlaceFullCopyWith<$Res> get place;
}

/// @nodoc
class _$PlaceLoadedStateCopyWithImpl<$Res>
    extends _$PlaceStateCopyWithImpl<$Res>
    implements $PlaceLoadedStateCopyWith<$Res> {
  _$PlaceLoadedStateCopyWithImpl(
      PlaceLoadedState _value, $Res Function(PlaceLoadedState) _then)
      : super(_value, (v) => _then(v as PlaceLoadedState));

  @override
  PlaceLoadedState get _value => super._value as PlaceLoadedState;

  @override
  $Res call({
    Object? place = freezed,
    Object? scenes = freezed,
    Object? events = freezed,
  }) {
    return _then(PlaceLoadedState(
      place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceFull,
      scenes == freezed
          ? _value.scenes
          : scenes // ignore: cast_nullable_to_non_nullable
              as List<Scene>,
      events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
    ));
  }

  @override
  $PlaceFullCopyWith<$Res> get place {
    return $PlaceFullCopyWith<$Res>(_value.place, (value) {
      return _then(_value.copyWith(place: value));
    });
  }
}

/// @nodoc

class _$PlaceLoadedState implements PlaceLoadedState {
  const _$PlaceLoadedState(this.place, this.scenes, this.events);

  @override
  final PlaceFull place;
  @override
  final List<Scene> scenes;
  @override
  final List<EventShort> events;

  @override
  String toString() {
    return 'PlaceState.loaded(place: $place, scenes: $scenes, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlaceLoadedState &&
            (identical(other.place, place) ||
                const DeepCollectionEquality().equals(other.place, place)) &&
            (identical(other.scenes, scenes) ||
                const DeepCollectionEquality().equals(other.scenes, scenes)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(place) ^
      const DeepCollectionEquality().hash(scenes) ^
      const DeepCollectionEquality().hash(events);

  @JsonKey(ignore: true)
  @override
  $PlaceLoadedStateCopyWith<PlaceLoadedState> get copyWith =>
      _$PlaceLoadedStateCopyWithImpl<PlaceLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return loaded(place, scenes, events);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)?
        loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(place, scenes, events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceLoadingState value) loading,
    required TResult Function(PlaceLoadedState value) loaded,
    required TResult Function(PlaceFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceLoadingState value)? loading,
    TResult Function(PlaceLoadedState value)? loaded,
    TResult Function(PlaceFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PlaceLoadedState implements PlaceState {
  const factory PlaceLoadedState(
          PlaceFull place, List<Scene> scenes, List<EventShort> events) =
      _$PlaceLoadedState;

  PlaceFull get place => throw _privateConstructorUsedError;
  List<Scene> get scenes => throw _privateConstructorUsedError;
  List<EventShort> get events => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceLoadedStateCopyWith<PlaceLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceFailureStateCopyWith<$Res> {
  factory $PlaceFailureStateCopyWith(
          PlaceFailureState value, $Res Function(PlaceFailureState) then) =
      _$PlaceFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaceFailureStateCopyWithImpl<$Res>
    extends _$PlaceStateCopyWithImpl<$Res>
    implements $PlaceFailureStateCopyWith<$Res> {
  _$PlaceFailureStateCopyWithImpl(
      PlaceFailureState _value, $Res Function(PlaceFailureState) _then)
      : super(_value, (v) => _then(v as PlaceFailureState));

  @override
  PlaceFailureState get _value => super._value as PlaceFailureState;
}

/// @nodoc

class _$PlaceFailureState implements PlaceFailureState {
  const _$PlaceFailureState();

  @override
  String toString() {
    return 'PlaceState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PlaceFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            PlaceFull place, List<Scene> scenes, List<EventShort> events)?
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
    required TResult Function(PlaceLoadingState value) loading,
    required TResult Function(PlaceLoadedState value) loaded,
    required TResult Function(PlaceFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceLoadingState value)? loading,
    TResult Function(PlaceLoadedState value)? loaded,
    TResult Function(PlaceFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PlaceFailureState implements PlaceState {
  const factory PlaceFailureState() = _$PlaceFailureState;
}
