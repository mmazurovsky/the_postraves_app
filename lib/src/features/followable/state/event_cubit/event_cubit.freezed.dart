// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventStateTearOff {
  const _$EventStateTearOff();

  EventLoadingState loading() {
    return const EventLoadingState();
  }

  EventRefreshingState refreshing() {
    return const EventRefreshingState();
  }

  EventFailureState failure() {
    return const EventFailureState();
  }

  EventLoadedState loaded(
      {required EventFull event,
      required List<UnityShort> orgs,
      required List<ArtistShort> lineup,
      required List<TimetableForSceneByDay> timetable}) {
    return EventLoadedState(
      event: event,
      orgs: orgs,
      lineup: lineup,
      timetable: timetable,
    );
  }
}

/// @nodoc
const $EventState = _$EventStateTearOff();

/// @nodoc
mixin _$EventState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function() failure,
    required TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function()? failure,
    TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventLoadingState value) loading,
    required TResult Function(EventRefreshingState value) refreshing,
    required TResult Function(EventFailureState value) failure,
    required TResult Function(EventLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventLoadingState value)? loading,
    TResult Function(EventRefreshingState value)? refreshing,
    TResult Function(EventFailureState value)? failure,
    TResult Function(EventLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
          EventState value, $Res Function(EventState) then) =
      _$EventStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventStateCopyWithImpl<$Res> implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  final EventState _value;
  // ignore: unused_field
  final $Res Function(EventState) _then;
}

/// @nodoc
abstract class $EventLoadingStateCopyWith<$Res> {
  factory $EventLoadingStateCopyWith(
          EventLoadingState value, $Res Function(EventLoadingState) then) =
      _$EventLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventLoadingStateCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res>
    implements $EventLoadingStateCopyWith<$Res> {
  _$EventLoadingStateCopyWithImpl(
      EventLoadingState _value, $Res Function(EventLoadingState) _then)
      : super(_value, (v) => _then(v as EventLoadingState));

  @override
  EventLoadingState get _value => super._value as EventLoadingState;
}

/// @nodoc

class _$EventLoadingState implements EventLoadingState {
  const _$EventLoadingState();

  @override
  String toString() {
    return 'EventState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EventLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function() failure,
    required TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function()? failure,
    TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)?
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
    required TResult Function(EventLoadingState value) loading,
    required TResult Function(EventRefreshingState value) refreshing,
    required TResult Function(EventFailureState value) failure,
    required TResult Function(EventLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventLoadingState value)? loading,
    TResult Function(EventRefreshingState value)? refreshing,
    TResult Function(EventFailureState value)? failure,
    TResult Function(EventLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EventLoadingState implements EventState {
  const factory EventLoadingState() = _$EventLoadingState;
}

/// @nodoc
abstract class $EventRefreshingStateCopyWith<$Res> {
  factory $EventRefreshingStateCopyWith(EventRefreshingState value,
          $Res Function(EventRefreshingState) then) =
      _$EventRefreshingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventRefreshingStateCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res>
    implements $EventRefreshingStateCopyWith<$Res> {
  _$EventRefreshingStateCopyWithImpl(
      EventRefreshingState _value, $Res Function(EventRefreshingState) _then)
      : super(_value, (v) => _then(v as EventRefreshingState));

  @override
  EventRefreshingState get _value => super._value as EventRefreshingState;
}

/// @nodoc

class _$EventRefreshingState implements EventRefreshingState {
  const _$EventRefreshingState();

  @override
  String toString() {
    return 'EventState.refreshing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EventRefreshingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function() failure,
    required TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)
        loaded,
  }) {
    return refreshing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function()? failure,
    TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)?
        loaded,
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
    required TResult Function(EventLoadingState value) loading,
    required TResult Function(EventRefreshingState value) refreshing,
    required TResult Function(EventFailureState value) failure,
    required TResult Function(EventLoadedState value) loaded,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventLoadingState value)? loading,
    TResult Function(EventRefreshingState value)? refreshing,
    TResult Function(EventFailureState value)? failure,
    TResult Function(EventLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class EventRefreshingState implements EventState {
  const factory EventRefreshingState() = _$EventRefreshingState;
}

/// @nodoc
abstract class $EventFailureStateCopyWith<$Res> {
  factory $EventFailureStateCopyWith(
          EventFailureState value, $Res Function(EventFailureState) then) =
      _$EventFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventFailureStateCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res>
    implements $EventFailureStateCopyWith<$Res> {
  _$EventFailureStateCopyWithImpl(
      EventFailureState _value, $Res Function(EventFailureState) _then)
      : super(_value, (v) => _then(v as EventFailureState));

  @override
  EventFailureState get _value => super._value as EventFailureState;
}

/// @nodoc

class _$EventFailureState implements EventFailureState {
  const _$EventFailureState();

  @override
  String toString() {
    return 'EventState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EventFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function() failure,
    required TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)
        loaded,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function()? failure,
    TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)?
        loaded,
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
    required TResult Function(EventLoadingState value) loading,
    required TResult Function(EventRefreshingState value) refreshing,
    required TResult Function(EventFailureState value) failure,
    required TResult Function(EventLoadedState value) loaded,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventLoadingState value)? loading,
    TResult Function(EventRefreshingState value)? refreshing,
    TResult Function(EventFailureState value)? failure,
    TResult Function(EventLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class EventFailureState implements EventState {
  const factory EventFailureState() = _$EventFailureState;
}

/// @nodoc
abstract class $EventLoadedStateCopyWith<$Res> {
  factory $EventLoadedStateCopyWith(
          EventLoadedState value, $Res Function(EventLoadedState) then) =
      _$EventLoadedStateCopyWithImpl<$Res>;
  $Res call(
      {EventFull event,
      List<UnityShort> orgs,
      List<ArtistShort> lineup,
      List<TimetableForSceneByDay> timetable});

  $EventFullCopyWith<$Res> get event;
}

/// @nodoc
class _$EventLoadedStateCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res>
    implements $EventLoadedStateCopyWith<$Res> {
  _$EventLoadedStateCopyWithImpl(
      EventLoadedState _value, $Res Function(EventLoadedState) _then)
      : super(_value, (v) => _then(v as EventLoadedState));

  @override
  EventLoadedState get _value => super._value as EventLoadedState;

  @override
  $Res call({
    Object? event = freezed,
    Object? orgs = freezed,
    Object? lineup = freezed,
    Object? timetable = freezed,
  }) {
    return _then(EventLoadedState(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventFull,
      orgs: orgs == freezed
          ? _value.orgs
          : orgs // ignore: cast_nullable_to_non_nullable
              as List<UnityShort>,
      lineup: lineup == freezed
          ? _value.lineup
          : lineup // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>,
      timetable: timetable == freezed
          ? _value.timetable
          : timetable // ignore: cast_nullable_to_non_nullable
              as List<TimetableForSceneByDay>,
    ));
  }

  @override
  $EventFullCopyWith<$Res> get event {
    return $EventFullCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$EventLoadedState implements EventLoadedState {
  const _$EventLoadedState(
      {required this.event,
      required this.orgs,
      required this.lineup,
      required this.timetable});

  @override
  final EventFull event;
  @override
  final List<UnityShort> orgs;
  @override
  final List<ArtistShort> lineup;
  @override
  final List<TimetableForSceneByDay> timetable;

  @override
  String toString() {
    return 'EventState.loaded(event: $event, orgs: $orgs, lineup: $lineup, timetable: $timetable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventLoadedState &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.orgs, orgs) ||
                const DeepCollectionEquality().equals(other.orgs, orgs)) &&
            (identical(other.lineup, lineup) ||
                const DeepCollectionEquality().equals(other.lineup, lineup)) &&
            (identical(other.timetable, timetable) ||
                const DeepCollectionEquality()
                    .equals(other.timetable, timetable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(orgs) ^
      const DeepCollectionEquality().hash(lineup) ^
      const DeepCollectionEquality().hash(timetable);

  @JsonKey(ignore: true)
  @override
  $EventLoadedStateCopyWith<EventLoadedState> get copyWith =>
      _$EventLoadedStateCopyWithImpl<EventLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function() failure,
    required TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)
        loaded,
  }) {
    return loaded(event, orgs, lineup, timetable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function()? failure,
    TResult Function(EventFull event, List<UnityShort> orgs,
            List<ArtistShort> lineup, List<TimetableForSceneByDay> timetable)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(event, orgs, lineup, timetable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventLoadingState value) loading,
    required TResult Function(EventRefreshingState value) refreshing,
    required TResult Function(EventFailureState value) failure,
    required TResult Function(EventLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventLoadingState value)? loading,
    TResult Function(EventRefreshingState value)? refreshing,
    TResult Function(EventFailureState value)? failure,
    TResult Function(EventLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class EventLoadedState implements EventState {
  const factory EventLoadedState(
      {required EventFull event,
      required List<UnityShort> orgs,
      required List<ArtistShort> lineup,
      required List<TimetableForSceneByDay> timetable}) = _$EventLoadedState;

  EventFull get event => throw _privateConstructorUsedError;
  List<UnityShort> get orgs => throw _privateConstructorUsedError;
  List<ArtistShort> get lineup => throw _privateConstructorUsedError;
  List<TimetableForSceneByDay> get timetable =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventLoadedStateCopyWith<EventLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
