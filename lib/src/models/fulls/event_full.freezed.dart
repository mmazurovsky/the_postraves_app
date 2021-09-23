// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_full.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventFull _$EventFullFromJson(Map<String, dynamic> json) {
  return _EventFull.fromJson(json);
}

/// @nodoc
class _$EventFullTearOff {
  const _$EventFullTearOff();

  _EventFull call(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      required EventStatus status,
      required DateTime startDateTime,
      required DateTime endDateTime,
      required PlaceShort place,
      String? imageLink,
      String? about,
      String? ticketsLink,
      List<TicketPrice>? ticketPrices}) {
    return _EventFull(
      id: id,
      name: name,
      overallFollowers: overallFollowers,
      weeklyFollowers: weeklyFollowers,
      isFollowed: isFollowed,
      status: status,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      place: place,
      imageLink: imageLink,
      about: about,
      ticketsLink: ticketsLink,
      ticketPrices: ticketPrices,
    );
  }

  EventFull fromJson(Map<String, Object> json) {
    return EventFull.fromJson(json);
  }
}

/// @nodoc
const $EventFull = _$EventFullTearOff();

/// @nodoc
mixin _$EventFull {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get overallFollowers => throw _privateConstructorUsedError;
  int get weeklyFollowers => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;
  EventStatus get status => throw _privateConstructorUsedError;
  DateTime get startDateTime => throw _privateConstructorUsedError;
  DateTime get endDateTime => throw _privateConstructorUsedError;
  PlaceShort get place => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get ticketsLink => throw _privateConstructorUsedError;
  List<TicketPrice>? get ticketPrices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventFullCopyWith<EventFull> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventFullCopyWith<$Res> {
  factory $EventFullCopyWith(EventFull value, $Res Function(EventFull) then) =
      _$EventFullCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      EventStatus status,
      DateTime startDateTime,
      DateTime endDateTime,
      PlaceShort place,
      String? imageLink,
      String? about,
      String? ticketsLink,
      List<TicketPrice>? ticketPrices});

  $PlaceShortCopyWith<$Res> get place;
}

/// @nodoc
class _$EventFullCopyWithImpl<$Res> implements $EventFullCopyWith<$Res> {
  _$EventFullCopyWithImpl(this._value, this._then);

  final EventFull _value;
  // ignore: unused_field
  final $Res Function(EventFull) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? status = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? place = freezed,
    Object? imageLink = freezed,
    Object? about = freezed,
    Object? ticketsLink = freezed,
    Object? ticketPrices = freezed,
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
      endDateTime: endDateTime == freezed
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceShort,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketsLink: ticketsLink == freezed
          ? _value.ticketsLink
          : ticketsLink // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketPrices: ticketPrices == freezed
          ? _value.ticketPrices
          : ticketPrices // ignore: cast_nullable_to_non_nullable
              as List<TicketPrice>?,
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
abstract class _$EventFullCopyWith<$Res> implements $EventFullCopyWith<$Res> {
  factory _$EventFullCopyWith(
          _EventFull value, $Res Function(_EventFull) then) =
      __$EventFullCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      EventStatus status,
      DateTime startDateTime,
      DateTime endDateTime,
      PlaceShort place,
      String? imageLink,
      String? about,
      String? ticketsLink,
      List<TicketPrice>? ticketPrices});

  @override
  $PlaceShortCopyWith<$Res> get place;
}

/// @nodoc
class __$EventFullCopyWithImpl<$Res> extends _$EventFullCopyWithImpl<$Res>
    implements _$EventFullCopyWith<$Res> {
  __$EventFullCopyWithImpl(_EventFull _value, $Res Function(_EventFull) _then)
      : super(_value, (v) => _then(v as _EventFull));

  @override
  _EventFull get _value => super._value as _EventFull;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? status = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? place = freezed,
    Object? imageLink = freezed,
    Object? about = freezed,
    Object? ticketsLink = freezed,
    Object? ticketPrices = freezed,
  }) {
    return _then(_EventFull(
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
      endDateTime: endDateTime == freezed
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceShort,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketsLink: ticketsLink == freezed
          ? _value.ticketsLink
          : ticketsLink // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketPrices: ticketPrices == freezed
          ? _value.ticketPrices
          : ticketPrices // ignore: cast_nullable_to_non_nullable
              as List<TicketPrice>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventFull extends _EventFull {
  const _$_EventFull(
      {required this.id,
      required this.name,
      required this.overallFollowers,
      required this.weeklyFollowers,
      required this.isFollowed,
      required this.status,
      required this.startDateTime,
      required this.endDateTime,
      required this.place,
      this.imageLink,
      this.about,
      this.ticketsLink,
      this.ticketPrices})
      : super._();

  factory _$_EventFull.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFullFromJson(json);

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
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final PlaceShort place;
  @override
  final String? imageLink;
  @override
  final String? about;
  @override
  final String? ticketsLink;
  @override
  final List<TicketPrice>? ticketPrices;

  @override
  String toString() {
    return 'EventFull(id: $id, name: $name, overallFollowers: $overallFollowers, weeklyFollowers: $weeklyFollowers, isFollowed: $isFollowed, status: $status, startDateTime: $startDateTime, endDateTime: $endDateTime, place: $place, imageLink: $imageLink, about: $about, ticketsLink: $ticketsLink, ticketPrices: $ticketPrices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventFull &&
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
            (identical(other.endDateTime, endDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.endDateTime, endDateTime)) &&
            (identical(other.place, place) ||
                const DeepCollectionEquality().equals(other.place, place)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.ticketsLink, ticketsLink) ||
                const DeepCollectionEquality()
                    .equals(other.ticketsLink, ticketsLink)) &&
            (identical(other.ticketPrices, ticketPrices) ||
                const DeepCollectionEquality()
                    .equals(other.ticketPrices, ticketPrices)));
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
      const DeepCollectionEquality().hash(endDateTime) ^
      const DeepCollectionEquality().hash(place) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(ticketsLink) ^
      const DeepCollectionEquality().hash(ticketPrices);

  @JsonKey(ignore: true)
  @override
  _$EventFullCopyWith<_EventFull> get copyWith =>
      __$EventFullCopyWithImpl<_EventFull>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventFullToJson(this);
  }
}

abstract class _EventFull extends EventFull {
  const factory _EventFull(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      required EventStatus status,
      required DateTime startDateTime,
      required DateTime endDateTime,
      required PlaceShort place,
      String? imageLink,
      String? about,
      String? ticketsLink,
      List<TicketPrice>? ticketPrices}) = _$_EventFull;
  const _EventFull._() : super._();

  factory _EventFull.fromJson(Map<String, dynamic> json) =
      _$_EventFull.fromJson;

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
  DateTime get startDateTime => throw _privateConstructorUsedError;
  @override
  DateTime get endDateTime => throw _privateConstructorUsedError;
  @override
  PlaceShort get place => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  String? get about => throw _privateConstructorUsedError;
  @override
  String? get ticketsLink => throw _privateConstructorUsedError;
  @override
  List<TicketPrice>? get ticketPrices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventFullCopyWith<_EventFull> get copyWith =>
      throw _privateConstructorUsedError;
}
