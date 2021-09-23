// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'unified_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifiedSearchModel _$UnifiedSearchModelFromJson(Map<String, dynamic> json) {
  return _UnifiedSearchModel.fromJson(json);
}

/// @nodoc
class _$UnifiedSearchModelTearOff {
  const _$UnifiedSearchModelTearOff();

  _UnifiedSearchModel call(
      {required int id,
      required String name,
      required String? imageLink,
      required WikiFollowableType type,
      required DateTime updatedDateTime,
      Country? country = null}) {
    return _UnifiedSearchModel(
      id: id,
      name: name,
      imageLink: imageLink,
      type: type,
      updatedDateTime: updatedDateTime,
      country: country,
    );
  }

  UnifiedSearchModel fromJson(Map<String, Object> json) {
    return UnifiedSearchModel.fromJson(json);
  }
}

/// @nodoc
const $UnifiedSearchModel = _$UnifiedSearchModelTearOff();

/// @nodoc
mixin _$UnifiedSearchModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  WikiFollowableType get type => throw _privateConstructorUsedError;
  DateTime get updatedDateTime => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifiedSearchModelCopyWith<UnifiedSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifiedSearchModelCopyWith<$Res> {
  factory $UnifiedSearchModelCopyWith(
          UnifiedSearchModel value, $Res Function(UnifiedSearchModel) then) =
      _$UnifiedSearchModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? imageLink,
      WikiFollowableType type,
      DateTime updatedDateTime,
      Country? country});

  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class _$UnifiedSearchModelCopyWithImpl<$Res>
    implements $UnifiedSearchModelCopyWith<$Res> {
  _$UnifiedSearchModelCopyWithImpl(this._value, this._then);

  final UnifiedSearchModel _value;
  // ignore: unused_field
  final $Res Function(UnifiedSearchModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageLink = freezed,
    Object? type = freezed,
    Object? updatedDateTime = freezed,
    Object? country = freezed,
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
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WikiFollowableType,
      updatedDateTime: updatedDateTime == freezed
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
    ));
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
abstract class _$UnifiedSearchModelCopyWith<$Res>
    implements $UnifiedSearchModelCopyWith<$Res> {
  factory _$UnifiedSearchModelCopyWith(
          _UnifiedSearchModel value, $Res Function(_UnifiedSearchModel) then) =
      __$UnifiedSearchModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? imageLink,
      WikiFollowableType type,
      DateTime updatedDateTime,
      Country? country});

  @override
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$UnifiedSearchModelCopyWithImpl<$Res>
    extends _$UnifiedSearchModelCopyWithImpl<$Res>
    implements _$UnifiedSearchModelCopyWith<$Res> {
  __$UnifiedSearchModelCopyWithImpl(
      _UnifiedSearchModel _value, $Res Function(_UnifiedSearchModel) _then)
      : super(_value, (v) => _then(v as _UnifiedSearchModel));

  @override
  _UnifiedSearchModel get _value => super._value as _UnifiedSearchModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageLink = freezed,
    Object? type = freezed,
    Object? updatedDateTime = freezed,
    Object? country = freezed,
  }) {
    return _then(_UnifiedSearchModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WikiFollowableType,
      updatedDateTime: updatedDateTime == freezed
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifiedSearchModel extends _UnifiedSearchModel {
  const _$_UnifiedSearchModel(
      {required this.id,
      required this.name,
      required this.imageLink,
      required this.type,
      required this.updatedDateTime,
      this.country = null})
      : super._();

  factory _$_UnifiedSearchModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UnifiedSearchModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? imageLink;
  @override
  final WikiFollowableType type;
  @override
  final DateTime updatedDateTime;
  @JsonKey(defaultValue: null)
  @override
  final Country? country;

  @override
  String toString() {
    return 'UnifiedSearchModel(id: $id, name: $name, imageLink: $imageLink, type: $type, updatedDateTime: $updatedDateTime, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifiedSearchModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.updatedDateTime, updatedDateTime)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(updatedDateTime) ^
      const DeepCollectionEquality().hash(country);

  @JsonKey(ignore: true)
  @override
  _$UnifiedSearchModelCopyWith<_UnifiedSearchModel> get copyWith =>
      __$UnifiedSearchModelCopyWithImpl<_UnifiedSearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UnifiedSearchModelToJson(this);
  }
}

abstract class _UnifiedSearchModel extends UnifiedSearchModel {
  const factory _UnifiedSearchModel(
      {required int id,
      required String name,
      required String? imageLink,
      required WikiFollowableType type,
      required DateTime updatedDateTime,
      Country? country}) = _$_UnifiedSearchModel;
  const _UnifiedSearchModel._() : super._();

  factory _UnifiedSearchModel.fromJson(Map<String, dynamic> json) =
      _$_UnifiedSearchModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  WikiFollowableType get type => throw _privateConstructorUsedError;
  @override
  DateTime get updatedDateTime => throw _privateConstructorUsedError;
  @override
  Country? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifiedSearchModelCopyWith<_UnifiedSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
