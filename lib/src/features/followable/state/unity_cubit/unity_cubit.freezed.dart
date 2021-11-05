// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'unity_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnityStateTearOff {
  const _$UnityStateTearOff();

  UnityLoadingState loading() {
    return const UnityLoadingState();
  }

  UnityLoadedState loaded(
      UnityFull unity, List<ArtistShort> artists, List<EventShort> events) {
    return UnityLoadedState(
      unity,
      artists,
      events,
    );
  }

  UnityFailureState failure() {
    return const UnityFailureState();
  }
}

/// @nodoc
const $UnityState = _$UnityStateTearOff();

/// @nodoc
mixin _$UnityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            UnityFull unity, List<ArtistShort> artists, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UnityFull unity, List<ArtistShort> artists,
            List<EventShort> events)?
        loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnityLoadingState value) loading,
    required TResult Function(UnityLoadedState value) loaded,
    required TResult Function(UnityFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnityLoadingState value)? loading,
    TResult Function(UnityLoadedState value)? loaded,
    TResult Function(UnityFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnityStateCopyWith<$Res> {
  factory $UnityStateCopyWith(
          UnityState value, $Res Function(UnityState) then) =
      _$UnityStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnityStateCopyWithImpl<$Res> implements $UnityStateCopyWith<$Res> {
  _$UnityStateCopyWithImpl(this._value, this._then);

  final UnityState _value;
  // ignore: unused_field
  final $Res Function(UnityState) _then;
}

/// @nodoc
abstract class $UnityLoadingStateCopyWith<$Res> {
  factory $UnityLoadingStateCopyWith(
          UnityLoadingState value, $Res Function(UnityLoadingState) then) =
      _$UnityLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnityLoadingStateCopyWithImpl<$Res>
    extends _$UnityStateCopyWithImpl<$Res>
    implements $UnityLoadingStateCopyWith<$Res> {
  _$UnityLoadingStateCopyWithImpl(
      UnityLoadingState _value, $Res Function(UnityLoadingState) _then)
      : super(_value, (v) => _then(v as UnityLoadingState));

  @override
  UnityLoadingState get _value => super._value as UnityLoadingState;
}

/// @nodoc

class _$UnityLoadingState implements UnityLoadingState {
  const _$UnityLoadingState();

  @override
  String toString() {
    return 'UnityState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnityLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            UnityFull unity, List<ArtistShort> artists, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UnityFull unity, List<ArtistShort> artists,
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
    required TResult Function(UnityLoadingState value) loading,
    required TResult Function(UnityLoadedState value) loaded,
    required TResult Function(UnityFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnityLoadingState value)? loading,
    TResult Function(UnityLoadedState value)? loaded,
    TResult Function(UnityFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UnityLoadingState implements UnityState {
  const factory UnityLoadingState() = _$UnityLoadingState;
}

/// @nodoc
abstract class $UnityLoadedStateCopyWith<$Res> {
  factory $UnityLoadedStateCopyWith(
          UnityLoadedState value, $Res Function(UnityLoadedState) then) =
      _$UnityLoadedStateCopyWithImpl<$Res>;
  $Res call(
      {UnityFull unity, List<ArtistShort> artists, List<EventShort> events});

  $UnityFullCopyWith<$Res> get unity;
}

/// @nodoc
class _$UnityLoadedStateCopyWithImpl<$Res>
    extends _$UnityStateCopyWithImpl<$Res>
    implements $UnityLoadedStateCopyWith<$Res> {
  _$UnityLoadedStateCopyWithImpl(
      UnityLoadedState _value, $Res Function(UnityLoadedState) _then)
      : super(_value, (v) => _then(v as UnityLoadedState));

  @override
  UnityLoadedState get _value => super._value as UnityLoadedState;

  @override
  $Res call({
    Object? unity = freezed,
    Object? artists = freezed,
    Object? events = freezed,
  }) {
    return _then(UnityLoadedState(
      unity == freezed
          ? _value.unity
          : unity // ignore: cast_nullable_to_non_nullable
              as UnityFull,
      artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>,
      events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
    ));
  }

  @override
  $UnityFullCopyWith<$Res> get unity {
    return $UnityFullCopyWith<$Res>(_value.unity, (value) {
      return _then(_value.copyWith(unity: value));
    });
  }
}

/// @nodoc

class _$UnityLoadedState implements UnityLoadedState {
  const _$UnityLoadedState(this.unity, this.artists, this.events);

  @override
  final UnityFull unity;
  @override
  final List<ArtistShort> artists;
  @override
  final List<EventShort> events;

  @override
  String toString() {
    return 'UnityState.loaded(unity: $unity, artists: $artists, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnityLoadedState &&
            (identical(other.unity, unity) ||
                const DeepCollectionEquality().equals(other.unity, unity)) &&
            (identical(other.artists, artists) ||
                const DeepCollectionEquality()
                    .equals(other.artists, artists)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(unity) ^
      const DeepCollectionEquality().hash(artists) ^
      const DeepCollectionEquality().hash(events);

  @JsonKey(ignore: true)
  @override
  $UnityLoadedStateCopyWith<UnityLoadedState> get copyWith =>
      _$UnityLoadedStateCopyWithImpl<UnityLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            UnityFull unity, List<ArtistShort> artists, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return loaded(unity, artists, events);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UnityFull unity, List<ArtistShort> artists,
            List<EventShort> events)?
        loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(unity, artists, events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnityLoadingState value) loading,
    required TResult Function(UnityLoadedState value) loaded,
    required TResult Function(UnityFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnityLoadingState value)? loading,
    TResult Function(UnityLoadedState value)? loaded,
    TResult Function(UnityFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UnityLoadedState implements UnityState {
  const factory UnityLoadedState(
          UnityFull unity, List<ArtistShort> artists, List<EventShort> events) =
      _$UnityLoadedState;

  UnityFull get unity => throw _privateConstructorUsedError;
  List<ArtistShort> get artists => throw _privateConstructorUsedError;
  List<EventShort> get events => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnityLoadedStateCopyWith<UnityLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnityFailureStateCopyWith<$Res> {
  factory $UnityFailureStateCopyWith(
          UnityFailureState value, $Res Function(UnityFailureState) then) =
      _$UnityFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnityFailureStateCopyWithImpl<$Res>
    extends _$UnityStateCopyWithImpl<$Res>
    implements $UnityFailureStateCopyWith<$Res> {
  _$UnityFailureStateCopyWithImpl(
      UnityFailureState _value, $Res Function(UnityFailureState) _then)
      : super(_value, (v) => _then(v as UnityFailureState));

  @override
  UnityFailureState get _value => super._value as UnityFailureState;
}

/// @nodoc

class _$UnityFailureState implements UnityFailureState {
  const _$UnityFailureState();

  @override
  String toString() {
    return 'UnityState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnityFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            UnityFull unity, List<ArtistShort> artists, List<EventShort> events)
        loaded,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UnityFull unity, List<ArtistShort> artists,
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
    required TResult Function(UnityLoadingState value) loading,
    required TResult Function(UnityLoadedState value) loaded,
    required TResult Function(UnityFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnityLoadingState value)? loading,
    TResult Function(UnityLoadedState value)? loaded,
    TResult Function(UnityFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UnityFailureState implements UnityState {
  const factory UnityFailureState() = _$UnityFailureState;
}
