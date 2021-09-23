// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'view_switcher_cubit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ViewSwitcherStateTearOff {
  const _$ViewSwitcherStateTearOff();

  ByDateViewState byDate() {
    return const ByDateViewState();
  }

  ByRatingViewState byRating() {
    return const ByRatingViewState();
  }
}

/// @nodoc
const $ViewSwitcherState = _$ViewSwitcherStateTearOff();

/// @nodoc
mixin _$ViewSwitcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() byDate,
    required TResult Function() byRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? byDate,
    TResult Function()? byRating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ByDateViewState value) byDate,
    required TResult Function(ByRatingViewState value) byRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ByDateViewState value)? byDate,
    TResult Function(ByRatingViewState value)? byRating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewSwitcherStateCopyWith<$Res> {
  factory $ViewSwitcherStateCopyWith(
          ViewSwitcherState value, $Res Function(ViewSwitcherState) then) =
      _$ViewSwitcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ViewSwitcherStateCopyWithImpl<$Res>
    implements $ViewSwitcherStateCopyWith<$Res> {
  _$ViewSwitcherStateCopyWithImpl(this._value, this._then);

  final ViewSwitcherState _value;
  // ignore: unused_field
  final $Res Function(ViewSwitcherState) _then;
}

/// @nodoc
abstract class $ByDateViewStateCopyWith<$Res> {
  factory $ByDateViewStateCopyWith(
          ByDateViewState value, $Res Function(ByDateViewState) then) =
      _$ByDateViewStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ByDateViewStateCopyWithImpl<$Res>
    extends _$ViewSwitcherStateCopyWithImpl<$Res>
    implements $ByDateViewStateCopyWith<$Res> {
  _$ByDateViewStateCopyWithImpl(
      ByDateViewState _value, $Res Function(ByDateViewState) _then)
      : super(_value, (v) => _then(v as ByDateViewState));

  @override
  ByDateViewState get _value => super._value as ByDateViewState;
}

/// @nodoc

class _$ByDateViewState implements ByDateViewState {
  const _$ByDateViewState();

  @override
  String toString() {
    return 'ViewSwitcherState.byDate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ByDateViewState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() byDate,
    required TResult Function() byRating,
  }) {
    return byDate();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? byDate,
    TResult Function()? byRating,
    required TResult orElse(),
  }) {
    if (byDate != null) {
      return byDate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ByDateViewState value) byDate,
    required TResult Function(ByRatingViewState value) byRating,
  }) {
    return byDate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ByDateViewState value)? byDate,
    TResult Function(ByRatingViewState value)? byRating,
    required TResult orElse(),
  }) {
    if (byDate != null) {
      return byDate(this);
    }
    return orElse();
  }
}

abstract class ByDateViewState implements ViewSwitcherState {
  const factory ByDateViewState() = _$ByDateViewState;
}

/// @nodoc
abstract class $ByRatingViewStateCopyWith<$Res> {
  factory $ByRatingViewStateCopyWith(
          ByRatingViewState value, $Res Function(ByRatingViewState) then) =
      _$ByRatingViewStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ByRatingViewStateCopyWithImpl<$Res>
    extends _$ViewSwitcherStateCopyWithImpl<$Res>
    implements $ByRatingViewStateCopyWith<$Res> {
  _$ByRatingViewStateCopyWithImpl(
      ByRatingViewState _value, $Res Function(ByRatingViewState) _then)
      : super(_value, (v) => _then(v as ByRatingViewState));

  @override
  ByRatingViewState get _value => super._value as ByRatingViewState;
}

/// @nodoc

class _$ByRatingViewState implements ByRatingViewState {
  const _$ByRatingViewState();

  @override
  String toString() {
    return 'ViewSwitcherState.byRating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ByRatingViewState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() byDate,
    required TResult Function() byRating,
  }) {
    return byRating();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? byDate,
    TResult Function()? byRating,
    required TResult orElse(),
  }) {
    if (byRating != null) {
      return byRating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ByDateViewState value) byDate,
    required TResult Function(ByRatingViewState value) byRating,
  }) {
    return byRating(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ByDateViewState value)? byDate,
    TResult Function(ByRatingViewState value)? byRating,
    required TResult orElse(),
  }) {
    if (byRating != null) {
      return byRating(this);
    }
    return orElse();
  }
}

abstract class ByRatingViewState implements ViewSwitcherState {
  const factory ByRatingViewState() = _$ByRatingViewState;
}
