// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timetable_day_performances_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimetableDayPerformancesDtoTearOff {
  const _$TimetableDayPerformancesDtoTearOff();

  _TimetableDayPerformances call(
      {required DateTime date,
      required List<TimetablePerformance> performances}) {
    return _TimetableDayPerformances(
      date: date,
      performances: performances,
    );
  }
}

/// @nodoc
const $TimetableDayPerformancesDto = _$TimetableDayPerformancesDtoTearOff();

/// @nodoc
mixin _$TimetableDayPerformancesDto {
  DateTime get date => throw _privateConstructorUsedError;
  List<TimetablePerformance> get performances =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimetableDayPerformancesDtoCopyWith<TimetableDayPerformancesDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableDayPerformancesDtoCopyWith<$Res> {
  factory $TimetableDayPerformancesDtoCopyWith(
          TimetableDayPerformancesDto value,
          $Res Function(TimetableDayPerformancesDto) then) =
      _$TimetableDayPerformancesDtoCopyWithImpl<$Res>;
  $Res call({DateTime date, List<TimetablePerformance> performances});
}

/// @nodoc
class _$TimetableDayPerformancesDtoCopyWithImpl<$Res>
    implements $TimetableDayPerformancesDtoCopyWith<$Res> {
  _$TimetableDayPerformancesDtoCopyWithImpl(this._value, this._then);

  final TimetableDayPerformancesDto _value;
  // ignore: unused_field
  final $Res Function(TimetableDayPerformancesDto) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? performances = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      performances: performances == freezed
          ? _value.performances
          : performances // ignore: cast_nullable_to_non_nullable
              as List<TimetablePerformance>,
    ));
  }
}

/// @nodoc
abstract class _$TimetableDayPerformancesCopyWith<$Res>
    implements $TimetableDayPerformancesDtoCopyWith<$Res> {
  factory _$TimetableDayPerformancesCopyWith(_TimetableDayPerformances value,
          $Res Function(_TimetableDayPerformances) then) =
      __$TimetableDayPerformancesCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, List<TimetablePerformance> performances});
}

/// @nodoc
class __$TimetableDayPerformancesCopyWithImpl<$Res>
    extends _$TimetableDayPerformancesDtoCopyWithImpl<$Res>
    implements _$TimetableDayPerformancesCopyWith<$Res> {
  __$TimetableDayPerformancesCopyWithImpl(_TimetableDayPerformances _value,
      $Res Function(_TimetableDayPerformances) _then)
      : super(_value, (v) => _then(v as _TimetableDayPerformances));

  @override
  _TimetableDayPerformances get _value =>
      super._value as _TimetableDayPerformances;

  @override
  $Res call({
    Object? date = freezed,
    Object? performances = freezed,
  }) {
    return _then(_TimetableDayPerformances(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      performances: performances == freezed
          ? _value.performances
          : performances // ignore: cast_nullable_to_non_nullable
              as List<TimetablePerformance>,
    ));
  }
}

/// @nodoc

class _$_TimetableDayPerformances implements _TimetableDayPerformances {
  const _$_TimetableDayPerformances(
      {required this.date, required this.performances});

  @override
  final DateTime date;
  @override
  final List<TimetablePerformance> performances;

  @override
  String toString() {
    return 'TimetableDayPerformancesDto(date: $date, performances: $performances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimetableDayPerformances &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.performances, performances) ||
                const DeepCollectionEquality()
                    .equals(other.performances, performances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(performances);

  @JsonKey(ignore: true)
  @override
  _$TimetableDayPerformancesCopyWith<_TimetableDayPerformances> get copyWith =>
      __$TimetableDayPerformancesCopyWithImpl<_TimetableDayPerformances>(
          this, _$identity);
}

abstract class _TimetableDayPerformances
    implements TimetableDayPerformancesDto {
  const factory _TimetableDayPerformances(
          {required DateTime date,
          required List<TimetablePerformance> performances}) =
      _$_TimetableDayPerformances;

  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  List<TimetablePerformance> get performances =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimetableDayPerformancesCopyWith<_TimetableDayPerformances> get copyWith =>
      throw _privateConstructorUsedError;
}
