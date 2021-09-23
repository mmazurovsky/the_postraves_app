// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shows_by_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShowsByDate _$ShowsByDateFromJson(Map<String, dynamic> json) {
  return _EventsByDate.fromJson(json);
}

/// @nodoc
class _$ShowsByDateTearOff {
  const _$ShowsByDateTearOff();

  _EventsByDate call(
      {required DateTime date, required List<EventShort> events}) {
    return _EventsByDate(
      date: date,
      events: events,
    );
  }

  ShowsByDate fromJson(Map<String, Object> json) {
    return ShowsByDate.fromJson(json);
  }
}

/// @nodoc
const $ShowsByDate = _$ShowsByDateTearOff();

/// @nodoc
mixin _$ShowsByDate {
  DateTime get date => throw _privateConstructorUsedError;
  List<EventShort> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowsByDateCopyWith<ShowsByDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowsByDateCopyWith<$Res> {
  factory $ShowsByDateCopyWith(
          ShowsByDate value, $Res Function(ShowsByDate) then) =
      _$ShowsByDateCopyWithImpl<$Res>;
  $Res call({DateTime date, List<EventShort> events});
}

/// @nodoc
class _$ShowsByDateCopyWithImpl<$Res> implements $ShowsByDateCopyWith<$Res> {
  _$ShowsByDateCopyWithImpl(this._value, this._then);

  final ShowsByDate _value;
  // ignore: unused_field
  final $Res Function(ShowsByDate) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
    ));
  }
}

/// @nodoc
abstract class _$EventsByDateCopyWith<$Res>
    implements $ShowsByDateCopyWith<$Res> {
  factory _$EventsByDateCopyWith(
          _EventsByDate value, $Res Function(_EventsByDate) then) =
      __$EventsByDateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, List<EventShort> events});
}

/// @nodoc
class __$EventsByDateCopyWithImpl<$Res> extends _$ShowsByDateCopyWithImpl<$Res>
    implements _$EventsByDateCopyWith<$Res> {
  __$EventsByDateCopyWithImpl(
      _EventsByDate _value, $Res Function(_EventsByDate) _then)
      : super(_value, (v) => _then(v as _EventsByDate));

  @override
  _EventsByDate get _value => super._value as _EventsByDate;

  @override
  $Res call({
    Object? date = freezed,
    Object? events = freezed,
  }) {
    return _then(_EventsByDate(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventsByDate extends _EventsByDate {
  const _$_EventsByDate({required this.date, required this.events}) : super._();

  factory _$_EventsByDate.fromJson(Map<String, dynamic> json) =>
      _$_$_EventsByDateFromJson(json);

  @override
  final DateTime date;
  @override
  final List<EventShort> events;

  @override
  String toString() {
    return 'ShowsByDate(date: $date, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventsByDate &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(events);

  @JsonKey(ignore: true)
  @override
  _$EventsByDateCopyWith<_EventsByDate> get copyWith =>
      __$EventsByDateCopyWithImpl<_EventsByDate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventsByDateToJson(this);
  }
}

abstract class _EventsByDate extends ShowsByDate {
  const factory _EventsByDate(
      {required DateTime date,
      required List<EventShort> events}) = _$_EventsByDate;
  const _EventsByDate._() : super._();

  factory _EventsByDate.fromJson(Map<String, dynamic> json) =
      _$_EventsByDate.fromJson;

  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  List<EventShort> get events => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventsByDateCopyWith<_EventsByDate> get copyWith =>
      throw _privateConstructorUsedError;
}
