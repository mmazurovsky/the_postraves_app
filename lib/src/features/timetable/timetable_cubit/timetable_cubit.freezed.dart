// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timetable_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimetableStateTearOff {
  const _$TimetableStateTearOff();

  TimetableInitialState initial() {
    return const TimetableInitialState();
  }

  TimetableRefreshingState refreshing() {
    return const TimetableRefreshingState();
  }

  TimetableLoadedState loaded(
      {required List<TimetableForSceneByDay> timetable}) {
    return TimetableLoadedState(
      timetable: timetable,
    );
  }
}

/// @nodoc
const $TimetableState = _$TimetableStateTearOff();

/// @nodoc
mixin _$TimetableState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refreshing,
    required TResult Function(List<TimetableForSceneByDay> timetable) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refreshing,
    TResult Function(List<TimetableForSceneByDay> timetable)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimetableInitialState value) initial,
    required TResult Function(TimetableRefreshingState value) refreshing,
    required TResult Function(TimetableLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimetableInitialState value)? initial,
    TResult Function(TimetableRefreshingState value)? refreshing,
    TResult Function(TimetableLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableStateCopyWith<$Res> {
  factory $TimetableStateCopyWith(
          TimetableState value, $Res Function(TimetableState) then) =
      _$TimetableStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TimetableStateCopyWithImpl<$Res>
    implements $TimetableStateCopyWith<$Res> {
  _$TimetableStateCopyWithImpl(this._value, this._then);

  final TimetableState _value;
  // ignore: unused_field
  final $Res Function(TimetableState) _then;
}

/// @nodoc
abstract class $TimetableInitialStateCopyWith<$Res> {
  factory $TimetableInitialStateCopyWith(TimetableInitialState value,
          $Res Function(TimetableInitialState) then) =
      _$TimetableInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TimetableInitialStateCopyWithImpl<$Res>
    extends _$TimetableStateCopyWithImpl<$Res>
    implements $TimetableInitialStateCopyWith<$Res> {
  _$TimetableInitialStateCopyWithImpl(
      TimetableInitialState _value, $Res Function(TimetableInitialState) _then)
      : super(_value, (v) => _then(v as TimetableInitialState));

  @override
  TimetableInitialState get _value => super._value as TimetableInitialState;
}

/// @nodoc

class _$TimetableInitialState implements TimetableInitialState {
  const _$TimetableInitialState();

  @override
  String toString() {
    return 'TimetableState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TimetableInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refreshing,
    required TResult Function(List<TimetableForSceneByDay> timetable) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refreshing,
    TResult Function(List<TimetableForSceneByDay> timetable)? loaded,
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
    required TResult Function(TimetableInitialState value) initial,
    required TResult Function(TimetableRefreshingState value) refreshing,
    required TResult Function(TimetableLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimetableInitialState value)? initial,
    TResult Function(TimetableRefreshingState value)? refreshing,
    TResult Function(TimetableLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TimetableInitialState implements TimetableState {
  const factory TimetableInitialState() = _$TimetableInitialState;
}

/// @nodoc
abstract class $TimetableRefreshingStateCopyWith<$Res> {
  factory $TimetableRefreshingStateCopyWith(TimetableRefreshingState value,
          $Res Function(TimetableRefreshingState) then) =
      _$TimetableRefreshingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TimetableRefreshingStateCopyWithImpl<$Res>
    extends _$TimetableStateCopyWithImpl<$Res>
    implements $TimetableRefreshingStateCopyWith<$Res> {
  _$TimetableRefreshingStateCopyWithImpl(TimetableRefreshingState _value,
      $Res Function(TimetableRefreshingState) _then)
      : super(_value, (v) => _then(v as TimetableRefreshingState));

  @override
  TimetableRefreshingState get _value =>
      super._value as TimetableRefreshingState;
}

/// @nodoc

class _$TimetableRefreshingState implements TimetableRefreshingState {
  const _$TimetableRefreshingState();

  @override
  String toString() {
    return 'TimetableState.refreshing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TimetableRefreshingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refreshing,
    required TResult Function(List<TimetableForSceneByDay> timetable) loaded,
  }) {
    return refreshing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refreshing,
    TResult Function(List<TimetableForSceneByDay> timetable)? loaded,
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
    required TResult Function(TimetableInitialState value) initial,
    required TResult Function(TimetableRefreshingState value) refreshing,
    required TResult Function(TimetableLoadedState value) loaded,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimetableInitialState value)? initial,
    TResult Function(TimetableRefreshingState value)? refreshing,
    TResult Function(TimetableLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class TimetableRefreshingState implements TimetableState {
  const factory TimetableRefreshingState() = _$TimetableRefreshingState;
}

/// @nodoc
abstract class $TimetableLoadedStateCopyWith<$Res> {
  factory $TimetableLoadedStateCopyWith(TimetableLoadedState value,
          $Res Function(TimetableLoadedState) then) =
      _$TimetableLoadedStateCopyWithImpl<$Res>;
  $Res call({List<TimetableForSceneByDay> timetable});
}

/// @nodoc
class _$TimetableLoadedStateCopyWithImpl<$Res>
    extends _$TimetableStateCopyWithImpl<$Res>
    implements $TimetableLoadedStateCopyWith<$Res> {
  _$TimetableLoadedStateCopyWithImpl(
      TimetableLoadedState _value, $Res Function(TimetableLoadedState) _then)
      : super(_value, (v) => _then(v as TimetableLoadedState));

  @override
  TimetableLoadedState get _value => super._value as TimetableLoadedState;

  @override
  $Res call({
    Object? timetable = freezed,
  }) {
    return _then(TimetableLoadedState(
      timetable: timetable == freezed
          ? _value.timetable
          : timetable // ignore: cast_nullable_to_non_nullable
              as List<TimetableForSceneByDay>,
    ));
  }
}

/// @nodoc

class _$TimetableLoadedState implements TimetableLoadedState {
  const _$TimetableLoadedState({required this.timetable});

  @override
  final List<TimetableForSceneByDay> timetable;

  @override
  String toString() {
    return 'TimetableState.loaded(timetable: $timetable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TimetableLoadedState &&
            (identical(other.timetable, timetable) ||
                const DeepCollectionEquality()
                    .equals(other.timetable, timetable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(timetable);

  @JsonKey(ignore: true)
  @override
  $TimetableLoadedStateCopyWith<TimetableLoadedState> get copyWith =>
      _$TimetableLoadedStateCopyWithImpl<TimetableLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refreshing,
    required TResult Function(List<TimetableForSceneByDay> timetable) loaded,
  }) {
    return loaded(timetable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refreshing,
    TResult Function(List<TimetableForSceneByDay> timetable)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(timetable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimetableInitialState value) initial,
    required TResult Function(TimetableRefreshingState value) refreshing,
    required TResult Function(TimetableLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimetableInitialState value)? initial,
    TResult Function(TimetableRefreshingState value)? refreshing,
    TResult Function(TimetableLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TimetableLoadedState implements TimetableState {
  const factory TimetableLoadedState(
          {required List<TimetableForSceneByDay> timetable}) =
      _$TimetableLoadedState;

  List<TimetableForSceneByDay> get timetable =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableLoadedStateCopyWith<TimetableLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
