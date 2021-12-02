// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shows_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShowsStateTearOff {
  const _$ShowsStateTearOff();

  ShowsLoadingState loading() {
    return const ShowsLoadingState();
  }

  ShowsRefreshingState refreshing() {
    return const ShowsRefreshingState();
  }

  ShowsLoadedState loaded(List<EventShort> shows) {
    return ShowsLoadedState(
      shows,
    );
  }

  ShowsFailureState failure() {
    return const ShowsFailureState();
  }
}

/// @nodoc
const $ShowsState = _$ShowsStateTearOff();

/// @nodoc
mixin _$ShowsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(List<EventShort> shows) loaded,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(List<EventShort> shows)? loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowsLoadingState value) loading,
    required TResult Function(ShowsRefreshingState value) refreshing,
    required TResult Function(ShowsLoadedState value) loaded,
    required TResult Function(ShowsFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowsLoadingState value)? loading,
    TResult Function(ShowsRefreshingState value)? refreshing,
    TResult Function(ShowsLoadedState value)? loaded,
    TResult Function(ShowsFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowsStateCopyWith<$Res> {
  factory $ShowsStateCopyWith(
          ShowsState value, $Res Function(ShowsState) then) =
      _$ShowsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShowsStateCopyWithImpl<$Res> implements $ShowsStateCopyWith<$Res> {
  _$ShowsStateCopyWithImpl(this._value, this._then);

  final ShowsState _value;
  // ignore: unused_field
  final $Res Function(ShowsState) _then;
}

/// @nodoc
abstract class $ShowsLoadingStateCopyWith<$Res> {
  factory $ShowsLoadingStateCopyWith(
          ShowsLoadingState value, $Res Function(ShowsLoadingState) then) =
      _$ShowsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShowsLoadingStateCopyWithImpl<$Res>
    extends _$ShowsStateCopyWithImpl<$Res>
    implements $ShowsLoadingStateCopyWith<$Res> {
  _$ShowsLoadingStateCopyWithImpl(
      ShowsLoadingState _value, $Res Function(ShowsLoadingState) _then)
      : super(_value, (v) => _then(v as ShowsLoadingState));

  @override
  ShowsLoadingState get _value => super._value as ShowsLoadingState;
}

/// @nodoc

class _$ShowsLoadingState implements ShowsLoadingState {
  const _$ShowsLoadingState();

  @override
  String toString() {
    return 'ShowsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShowsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(List<EventShort> shows) loaded,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(List<EventShort> shows)? loaded,
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
    required TResult Function(ShowsLoadingState value) loading,
    required TResult Function(ShowsRefreshingState value) refreshing,
    required TResult Function(ShowsLoadedState value) loaded,
    required TResult Function(ShowsFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowsLoadingState value)? loading,
    TResult Function(ShowsRefreshingState value)? refreshing,
    TResult Function(ShowsLoadedState value)? loaded,
    TResult Function(ShowsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShowsLoadingState implements ShowsState {
  const factory ShowsLoadingState() = _$ShowsLoadingState;
}

/// @nodoc
abstract class $ShowsRefreshingStateCopyWith<$Res> {
  factory $ShowsRefreshingStateCopyWith(ShowsRefreshingState value,
          $Res Function(ShowsRefreshingState) then) =
      _$ShowsRefreshingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShowsRefreshingStateCopyWithImpl<$Res>
    extends _$ShowsStateCopyWithImpl<$Res>
    implements $ShowsRefreshingStateCopyWith<$Res> {
  _$ShowsRefreshingStateCopyWithImpl(
      ShowsRefreshingState _value, $Res Function(ShowsRefreshingState) _then)
      : super(_value, (v) => _then(v as ShowsRefreshingState));

  @override
  ShowsRefreshingState get _value => super._value as ShowsRefreshingState;
}

/// @nodoc

class _$ShowsRefreshingState implements ShowsRefreshingState {
  const _$ShowsRefreshingState();

  @override
  String toString() {
    return 'ShowsState.refreshing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShowsRefreshingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(List<EventShort> shows) loaded,
    required TResult Function() failure,
  }) {
    return refreshing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(List<EventShort> shows)? loaded,
    TResult Function()? failure,
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
    required TResult Function(ShowsLoadingState value) loading,
    required TResult Function(ShowsRefreshingState value) refreshing,
    required TResult Function(ShowsLoadedState value) loaded,
    required TResult Function(ShowsFailureState value) failure,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowsLoadingState value)? loading,
    TResult Function(ShowsRefreshingState value)? refreshing,
    TResult Function(ShowsLoadedState value)? loaded,
    TResult Function(ShowsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class ShowsRefreshingState implements ShowsState {
  const factory ShowsRefreshingState() = _$ShowsRefreshingState;
}

/// @nodoc
abstract class $ShowsLoadedStateCopyWith<$Res> {
  factory $ShowsLoadedStateCopyWith(
          ShowsLoadedState value, $Res Function(ShowsLoadedState) then) =
      _$ShowsLoadedStateCopyWithImpl<$Res>;
  $Res call({List<EventShort> shows});
}

/// @nodoc
class _$ShowsLoadedStateCopyWithImpl<$Res>
    extends _$ShowsStateCopyWithImpl<$Res>
    implements $ShowsLoadedStateCopyWith<$Res> {
  _$ShowsLoadedStateCopyWithImpl(
      ShowsLoadedState _value, $Res Function(ShowsLoadedState) _then)
      : super(_value, (v) => _then(v as ShowsLoadedState));

  @override
  ShowsLoadedState get _value => super._value as ShowsLoadedState;

  @override
  $Res call({
    Object? shows = freezed,
  }) {
    return _then(ShowsLoadedState(
      shows == freezed
          ? _value.shows
          : shows // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
    ));
  }
}

/// @nodoc

class _$ShowsLoadedState implements ShowsLoadedState {
  const _$ShowsLoadedState(this.shows);

  @override
  final List<EventShort> shows;

  @override
  String toString() {
    return 'ShowsState.loaded(shows: $shows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowsLoadedState &&
            (identical(other.shows, shows) ||
                const DeepCollectionEquality().equals(other.shows, shows)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(shows);

  @JsonKey(ignore: true)
  @override
  $ShowsLoadedStateCopyWith<ShowsLoadedState> get copyWith =>
      _$ShowsLoadedStateCopyWithImpl<ShowsLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(List<EventShort> shows) loaded,
    required TResult Function() failure,
  }) {
    return loaded(shows);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(List<EventShort> shows)? loaded,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(shows);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowsLoadingState value) loading,
    required TResult Function(ShowsRefreshingState value) refreshing,
    required TResult Function(ShowsLoadedState value) loaded,
    required TResult Function(ShowsFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowsLoadingState value)? loading,
    TResult Function(ShowsRefreshingState value)? refreshing,
    TResult Function(ShowsLoadedState value)? loaded,
    TResult Function(ShowsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShowsLoadedState implements ShowsState {
  const factory ShowsLoadedState(List<EventShort> shows) = _$ShowsLoadedState;

  List<EventShort> get shows => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowsLoadedStateCopyWith<ShowsLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowsFailureStateCopyWith<$Res> {
  factory $ShowsFailureStateCopyWith(
          ShowsFailureState value, $Res Function(ShowsFailureState) then) =
      _$ShowsFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShowsFailureStateCopyWithImpl<$Res>
    extends _$ShowsStateCopyWithImpl<$Res>
    implements $ShowsFailureStateCopyWith<$Res> {
  _$ShowsFailureStateCopyWithImpl(
      ShowsFailureState _value, $Res Function(ShowsFailureState) _then)
      : super(_value, (v) => _then(v as ShowsFailureState));

  @override
  ShowsFailureState get _value => super._value as ShowsFailureState;
}

/// @nodoc

class _$ShowsFailureState implements ShowsFailureState {
  const _$ShowsFailureState();

  @override
  String toString() {
    return 'ShowsState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShowsFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() refreshing,
    required TResult Function(List<EventShort> shows) loaded,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? refreshing,
    TResult Function(List<EventShort> shows)? loaded,
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
    required TResult Function(ShowsLoadingState value) loading,
    required TResult Function(ShowsRefreshingState value) refreshing,
    required TResult Function(ShowsLoadedState value) loaded,
    required TResult Function(ShowsFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowsLoadingState value)? loading,
    TResult Function(ShowsRefreshingState value)? refreshing,
    TResult Function(ShowsLoadedState value)? loaded,
    TResult Function(ShowsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ShowsFailureState implements ShowsState {
  const factory ShowsFailureState() = _$ShowsFailureState;
}
