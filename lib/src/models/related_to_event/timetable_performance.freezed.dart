// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timetable_performance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimetablePerformance _$TimetablePerformanceFromJson(Map<String, dynamic> json) {
  return _TimetablePerformance.fromJson(json);
}

/// @nodoc
class _$TimetablePerformanceTearOff {
  const _$TimetablePerformanceTearOff();

  _TimetablePerformance call(
      {required List<ArtistShort> artists,
      @DateTimeConverter() required DateTime startingDateTime,
      @DateTimeConverter() required DateTime endingDateTime,
      String? typeOfPerformance}) {
    return _TimetablePerformance(
      artists: artists,
      startingDateTime: startingDateTime,
      endingDateTime: endingDateTime,
      typeOfPerformance: typeOfPerformance,
    );
  }

  TimetablePerformance fromJson(Map<String, Object> json) {
    return TimetablePerformance.fromJson(json);
  }
}

/// @nodoc
const $TimetablePerformance = _$TimetablePerformanceTearOff();

/// @nodoc
mixin _$TimetablePerformance {
  List<ArtistShort> get artists => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get startingDateTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get endingDateTime => throw _privateConstructorUsedError;
  String? get typeOfPerformance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetablePerformanceCopyWith<TimetablePerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetablePerformanceCopyWith<$Res> {
  factory $TimetablePerformanceCopyWith(TimetablePerformance value,
          $Res Function(TimetablePerformance) then) =
      _$TimetablePerformanceCopyWithImpl<$Res>;
  $Res call(
      {List<ArtistShort> artists,
      @DateTimeConverter() DateTime startingDateTime,
      @DateTimeConverter() DateTime endingDateTime,
      String? typeOfPerformance});
}

/// @nodoc
class _$TimetablePerformanceCopyWithImpl<$Res>
    implements $TimetablePerformanceCopyWith<$Res> {
  _$TimetablePerformanceCopyWithImpl(this._value, this._then);

  final TimetablePerformance _value;
  // ignore: unused_field
  final $Res Function(TimetablePerformance) _then;

  @override
  $Res call({
    Object? artists = freezed,
    Object? startingDateTime = freezed,
    Object? endingDateTime = freezed,
    Object? typeOfPerformance = freezed,
  }) {
    return _then(_value.copyWith(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>,
      startingDateTime: startingDateTime == freezed
          ? _value.startingDateTime
          : startingDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endingDateTime: endingDateTime == freezed
          ? _value.endingDateTime
          : endingDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      typeOfPerformance: typeOfPerformance == freezed
          ? _value.typeOfPerformance
          : typeOfPerformance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TimetablePerformanceCopyWith<$Res>
    implements $TimetablePerformanceCopyWith<$Res> {
  factory _$TimetablePerformanceCopyWith(_TimetablePerformance value,
          $Res Function(_TimetablePerformance) then) =
      __$TimetablePerformanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ArtistShort> artists,
      @DateTimeConverter() DateTime startingDateTime,
      @DateTimeConverter() DateTime endingDateTime,
      String? typeOfPerformance});
}

/// @nodoc
class __$TimetablePerformanceCopyWithImpl<$Res>
    extends _$TimetablePerformanceCopyWithImpl<$Res>
    implements _$TimetablePerformanceCopyWith<$Res> {
  __$TimetablePerformanceCopyWithImpl(
      _TimetablePerformance _value, $Res Function(_TimetablePerformance) _then)
      : super(_value, (v) => _then(v as _TimetablePerformance));

  @override
  _TimetablePerformance get _value => super._value as _TimetablePerformance;

  @override
  $Res call({
    Object? artists = freezed,
    Object? startingDateTime = freezed,
    Object? endingDateTime = freezed,
    Object? typeOfPerformance = freezed,
  }) {
    return _then(_TimetablePerformance(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>,
      startingDateTime: startingDateTime == freezed
          ? _value.startingDateTime
          : startingDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endingDateTime: endingDateTime == freezed
          ? _value.endingDateTime
          : endingDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      typeOfPerformance: typeOfPerformance == freezed
          ? _value.typeOfPerformance
          : typeOfPerformance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimetablePerformance implements _TimetablePerformance {
  const _$_TimetablePerformance(
      {required this.artists,
      @DateTimeConverter() required this.startingDateTime,
      @DateTimeConverter() required this.endingDateTime,
      this.typeOfPerformance});

  factory _$_TimetablePerformance.fromJson(Map<String, dynamic> json) =>
      _$_$_TimetablePerformanceFromJson(json);

  @override
  final List<ArtistShort> artists;
  @override
  @DateTimeConverter()
  final DateTime startingDateTime;
  @override
  @DateTimeConverter()
  final DateTime endingDateTime;
  @override
  final String? typeOfPerformance;

  @override
  String toString() {
    return 'TimetablePerformance(artists: $artists, startingDateTime: $startingDateTime, endingDateTime: $endingDateTime, typeOfPerformance: $typeOfPerformance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimetablePerformance &&
            (identical(other.artists, artists) ||
                const DeepCollectionEquality()
                    .equals(other.artists, artists)) &&
            (identical(other.startingDateTime, startingDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.startingDateTime, startingDateTime)) &&
            (identical(other.endingDateTime, endingDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.endingDateTime, endingDateTime)) &&
            (identical(other.typeOfPerformance, typeOfPerformance) ||
                const DeepCollectionEquality()
                    .equals(other.typeOfPerformance, typeOfPerformance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(artists) ^
      const DeepCollectionEquality().hash(startingDateTime) ^
      const DeepCollectionEquality().hash(endingDateTime) ^
      const DeepCollectionEquality().hash(typeOfPerformance);

  @JsonKey(ignore: true)
  @override
  _$TimetablePerformanceCopyWith<_TimetablePerformance> get copyWith =>
      __$TimetablePerformanceCopyWithImpl<_TimetablePerformance>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimetablePerformanceToJson(this);
  }
}

abstract class _TimetablePerformance implements TimetablePerformance {
  const factory _TimetablePerformance(
      {required List<ArtistShort> artists,
      @DateTimeConverter() required DateTime startingDateTime,
      @DateTimeConverter() required DateTime endingDateTime,
      String? typeOfPerformance}) = _$_TimetablePerformance;

  factory _TimetablePerformance.fromJson(Map<String, dynamic> json) =
      _$_TimetablePerformance.fromJson;

  @override
  List<ArtistShort> get artists => throw _privateConstructorUsedError;
  @override
  @DateTimeConverter()
  DateTime get startingDateTime => throw _privateConstructorUsedError;
  @override
  @DateTimeConverter()
  DateTime get endingDateTime => throw _privateConstructorUsedError;
  @override
  String? get typeOfPerformance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimetablePerformanceCopyWith<_TimetablePerformance> get copyWith =>
      throw _privateConstructorUsedError;
}
