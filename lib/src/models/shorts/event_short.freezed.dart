// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_short.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventShort _$EventShortFromJson(Map<String, dynamic> json) {
  return _EventShort.fromJson(json);
}

/// @nodoc
class _$EventShortTearOff {
  const _$EventShortTearOff();

  _EventShort call(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      required EventStatus status,
      @DateTimeConverter() required DateTime startDateTime,
      required PlaceShort place,
      required List<TicketPrice>? ticketPrices,
      String? imageLink}) {
    return _EventShort(
      id: id,
      name: name,
      overallFollowers: overallFollowers,
      weeklyFollowers: weeklyFollowers,
      isFollowed: isFollowed,
      status: status,
      startDateTime: startDateTime,
      place: place,
      ticketPrices: ticketPrices,
      imageLink: imageLink,
    );
  }

  EventShort fromJson(Map<String, Object> json) {
    return EventShort.fromJson(json);
  }
}

/// @nodoc
const $EventShort = _$EventShortTearOff();

/// @nodoc
mixin _$EventShort {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get overallFollowers => throw _privateConstructorUsedError;
  int get weeklyFollowers => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;
  EventStatus get status => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get startDateTime => throw _privateConstructorUsedError;
  PlaceShort get place => throw _privateConstructorUsedError;
  List<TicketPrice>? get ticketPrices => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventShortCopyWith<EventShort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventShortCopyWith<$Res> {
  factory $EventShortCopyWith(
          EventShort value, $Res Function(EventShort) then) =
      _$EventShortCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      EventStatus status,
      @DateTimeConverter() DateTime startDateTime,
      PlaceShort place,
      List<TicketPrice>? ticketPrices,
      String? imageLink});

  $PlaceShortCopyWith<$Res> get place;
}

/// @nodoc
class _$EventShortCopyWithImpl<$Res> implements $EventShortCopyWith<$Res> {
  _$EventShortCopyWithImpl(this._value, this._then);

  final EventShort _value;
  // ignore: unused_field
  final $Res Function(EventShort) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? status = freezed,
    Object? startDateTime = freezed,
    Object? place = freezed,
    Object? ticketPrices = freezed,
    Object? imageLink = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overallFollowers: overallFollowers == freezed
          ? _value.overallFollowers
          : overallFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyFollowers: weeklyFollowers == freezed
          ? _value.weeklyFollowers
          : weeklyFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowed: isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceShort,
      ticketPrices: ticketPrices == freezed
          ? _value.ticketPrices
          : ticketPrices // ignore: cast_nullable_to_non_nullable
              as List<TicketPrice>?,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PlaceShortCopyWith<$Res> get place {
    return $PlaceShortCopyWith<$Res>(_value.place, (value) {
      return _then(_value.copyWith(place: value));
    });
  }
}

/// @nodoc
abstract class _$EventShortCopyWith<$Res> implements $EventShortCopyWith<$Res> {
  factory _$EventShortCopyWith(
          _EventShort value, $Res Function(_EventShort) then) =
      __$EventShortCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      EventStatus status,
      @DateTimeConverter() DateTime startDateTime,
      PlaceShort place,
      List<TicketPrice>? ticketPrices,
      String? imageLink});

  @override
  $PlaceShortCopyWith<$Res> get place;
}

/// @nodoc
class __$EventShortCopyWithImpl<$Res> extends _$EventShortCopyWithImpl<$Res>
    implements _$EventShortCopyWith<$Res> {
  __$EventShortCopyWithImpl(
      _EventShort _value, $Res Function(_EventShort) _then)
      : super(_value, (v) => _then(v as _EventShort));

  @override
  _EventShort get _value => super._value as _EventShort;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? status = freezed,
    Object? startDateTime = freezed,
    Object? place = freezed,
    Object? ticketPrices = freezed,
    Object? imageLink = freezed,
  }) {
    return _then(_EventShort(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overallFollowers: overallFollowers == freezed
          ? _value.overallFollowers
          : overallFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyFollowers: weeklyFollowers == freezed
          ? _value.weeklyFollowers
          : weeklyFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowed: isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceShort,
      ticketPrices: ticketPrices == freezed
          ? _value.ticketPrices
          : ticketPrices // ignore: cast_nullable_to_non_nullable
              as List<TicketPrice>?,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventShort extends _EventShort {
  const _$_EventShort(
      {required this.id,
      required this.name,
      required this.overallFollowers,
      required this.weeklyFollowers,
      required this.isFollowed,
      required this.status,
      @DateTimeConverter() required this.startDateTime,
      required this.place,
      required this.ticketPrices,
      this.imageLink})
      : super._();

  factory _$_EventShort.fromJson(Map<String, dynamic> json) =>
      _$_$_EventShortFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int overallFollowers;
  @override
  final int weeklyFollowers;
  @override
  final bool isFollowed;
  @override
  final EventStatus status;
  @override
  @DateTimeConverter()
  final DateTime startDateTime;
  @override
  final PlaceShort place;
  @override
  final List<TicketPrice>? ticketPrices;
  @override
  final String? imageLink;

  @override
  String toString() {
    return 'EventShort(id: $id, name: $name, overallFollowers: $overallFollowers, weeklyFollowers: $weeklyFollowers, isFollowed: $isFollowed, status: $status, startDateTime: $startDateTime, place: $place, ticketPrices: $ticketPrices, imageLink: $imageLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventShort &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.overallFollowers, overallFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.overallFollowers, overallFollowers)) &&
            (identical(other.weeklyFollowers, weeklyFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.weeklyFollowers, weeklyFollowers)) &&
            (identical(other.isFollowed, isFollowed) ||
                const DeepCollectionEquality()
                    .equals(other.isFollowed, isFollowed)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.startDateTime, startDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.startDateTime, startDateTime)) &&
            (identical(other.place, place) ||
                const DeepCollectionEquality().equals(other.place, place)) &&
            (identical(other.ticketPrices, ticketPrices) ||
                const DeepCollectionEquality()
                    .equals(other.ticketPrices, ticketPrices)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(overallFollowers) ^
      const DeepCollectionEquality().hash(weeklyFollowers) ^
      const DeepCollectionEquality().hash(isFollowed) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(startDateTime) ^
      const DeepCollectionEquality().hash(place) ^
      const DeepCollectionEquality().hash(ticketPrices) ^
      const DeepCollectionEquality().hash(imageLink);

  @JsonKey(ignore: true)
  @override
  _$EventShortCopyWith<_EventShort> get copyWith =>
      __$EventShortCopyWithImpl<_EventShort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventShortToJson(this);
  }
}

abstract class _EventShort extends EventShort {
  const factory _EventShort(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      required EventStatus status,
      @DateTimeConverter() required DateTime startDateTime,
      required PlaceShort place,
      required List<TicketPrice>? ticketPrices,
      String? imageLink}) = _$_EventShort;
  const _EventShort._() : super._();

  factory _EventShort.fromJson(Map<String, dynamic> json) =
      _$_EventShort.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get overallFollowers => throw _privateConstructorUsedError;
  @override
  int get weeklyFollowers => throw _privateConstructorUsedError;
  @override
  bool get isFollowed => throw _privateConstructorUsedError;
  @override
  EventStatus get status => throw _privateConstructorUsedError;
  @override
  @DateTimeConverter()
  DateTime get startDateTime => throw _privateConstructorUsedError;
  @override
  PlaceShort get place => throw _privateConstructorUsedError;
  @override
  List<TicketPrice>? get ticketPrices => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventShortCopyWith<_EventShort> get copyWith =>
      throw _privateConstructorUsedError;
}
