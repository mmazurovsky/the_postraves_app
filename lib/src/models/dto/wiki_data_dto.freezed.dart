// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'wiki_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WikiDataDto _$WikiDataDtoFromJson(Map<String, dynamic> json) {
  return _WikiDataDto.fromJson(json);
}

/// @nodoc
class _$WikiDataDtoTearOff {
  const _$WikiDataDtoTearOff();

  _WikiDataDto call(
      {required String name,
      required String? imageLink,
      ImageDimensions? imageDimensions = null,
      Country? country = null,
      required int id,
      required WikiFollowableType type}) {
    return _WikiDataDto(
      name: name,
      imageLink: imageLink,
      imageDimensions: imageDimensions,
      country: country,
      id: id,
      type: type,
    );
  }

  WikiDataDto fromJson(Map<String, Object> json) {
    return WikiDataDto.fromJson(json);
  }
}

/// @nodoc
const $WikiDataDto = _$WikiDataDtoTearOff();

/// @nodoc
mixin _$WikiDataDto {
  String get name => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  ImageDimensions? get imageDimensions => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  WikiFollowableType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WikiDataDtoCopyWith<WikiDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WikiDataDtoCopyWith<$Res> {
  factory $WikiDataDtoCopyWith(
          WikiDataDto value, $Res Function(WikiDataDto) then) =
      _$WikiDataDtoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? imageLink,
      ImageDimensions? imageDimensions,
      Country? country,
      int id,
      WikiFollowableType type});

  $ImageDimensionsCopyWith<$Res>? get imageDimensions;
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class _$WikiDataDtoCopyWithImpl<$Res> implements $WikiDataDtoCopyWith<$Res> {
  _$WikiDataDtoCopyWithImpl(this._value, this._then);

  final WikiDataDto _value;
  // ignore: unused_field
  final $Res Function(WikiDataDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageLink = freezed,
    Object? imageDimensions = freezed,
    Object? country = freezed,
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      imageDimensions: imageDimensions == freezed
          ? _value.imageDimensions
          : imageDimensions // ignore: cast_nullable_to_non_nullable
              as ImageDimensions?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WikiFollowableType,
    ));
  }

  @override
  $ImageDimensionsCopyWith<$Res>? get imageDimensions {
    if (_value.imageDimensions == null) {
      return null;
    }

    return $ImageDimensionsCopyWith<$Res>(_value.imageDimensions!, (value) {
      return _then(_value.copyWith(imageDimensions: value));
    });
  }

  @override
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value));
    });
  }
}

/// @nodoc
abstract class _$WikiDataDtoCopyWith<$Res>
    implements $WikiDataDtoCopyWith<$Res> {
  factory _$WikiDataDtoCopyWith(
          _WikiDataDto value, $Res Function(_WikiDataDto) then) =
      __$WikiDataDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? imageLink,
      ImageDimensions? imageDimensions,
      Country? country,
      int id,
      WikiFollowableType type});

  @override
  $ImageDimensionsCopyWith<$Res>? get imageDimensions;
  @override
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$WikiDataDtoCopyWithImpl<$Res> extends _$WikiDataDtoCopyWithImpl<$Res>
    implements _$WikiDataDtoCopyWith<$Res> {
  __$WikiDataDtoCopyWithImpl(
      _WikiDataDto _value, $Res Function(_WikiDataDto) _then)
      : super(_value, (v) => _then(v as _WikiDataDto));

  @override
  _WikiDataDto get _value => super._value as _WikiDataDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageLink = freezed,
    Object? imageDimensions = freezed,
    Object? country = freezed,
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_WikiDataDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      imageDimensions: imageDimensions == freezed
          ? _value.imageDimensions
          : imageDimensions // ignore: cast_nullable_to_non_nullable
              as ImageDimensions?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WikiFollowableType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WikiDataDto extends _WikiDataDto {
  const _$_WikiDataDto(
      {required this.name,
      required this.imageLink,
      this.imageDimensions = null,
      this.country = null,
      required this.id,
      required this.type})
      : super._();

  factory _$_WikiDataDto.fromJson(Map<String, dynamic> json) =>
      _$_$_WikiDataDtoFromJson(json);

  @override
  final String name;
  @override
  final String? imageLink;
  @JsonKey(defaultValue: null)
  @override
  final ImageDimensions? imageDimensions;
  @JsonKey(defaultValue: null)
  @override
  final Country? country;
  @override
  final int id;
  @override
  final WikiFollowableType type;

  @override
  String toString() {
    return 'WikiDataDto(name: $name, imageLink: $imageLink, imageDimensions: $imageDimensions, country: $country, id: $id, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WikiDataDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.imageDimensions, imageDimensions) ||
                const DeepCollectionEquality()
                    .equals(other.imageDimensions, imageDimensions)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(imageDimensions) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$WikiDataDtoCopyWith<_WikiDataDto> get copyWith =>
      __$WikiDataDtoCopyWithImpl<_WikiDataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WikiDataDtoToJson(this);
  }
}

abstract class _WikiDataDto extends WikiDataDto {
  const factory _WikiDataDto(
      {required String name,
      required String? imageLink,
      ImageDimensions? imageDimensions,
      Country? country,
      required int id,
      required WikiFollowableType type}) = _$_WikiDataDto;
  const _WikiDataDto._() : super._();

  factory _WikiDataDto.fromJson(Map<String, dynamic> json) =
      _$_WikiDataDto.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  ImageDimensions? get imageDimensions => throw _privateConstructorUsedError;
  @override
  Country? get country => throw _privateConstructorUsedError;
  @override
  int get id => throw _privateConstructorUsedError;
  @override
  WikiFollowableType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WikiDataDtoCopyWith<_WikiDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}
