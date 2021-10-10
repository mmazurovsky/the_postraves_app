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
      {required WikiDataDto wikiDataDto, required DateTime updatedDateTime}) {
    return _UnifiedSearchModel(
      wikiDataDto: wikiDataDto,
      updatedDateTime: updatedDateTime,
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
  WikiDataDto get wikiDataDto => throw _privateConstructorUsedError;
  DateTime get updatedDateTime => throw _privateConstructorUsedError;

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
  $Res call({WikiDataDto wikiDataDto, DateTime updatedDateTime});

  $WikiDataDtoCopyWith<$Res> get wikiDataDto;
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
    Object? wikiDataDto = freezed,
    Object? updatedDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      wikiDataDto: wikiDataDto == freezed
          ? _value.wikiDataDto
          : wikiDataDto // ignore: cast_nullable_to_non_nullable
              as WikiDataDto,
      updatedDateTime: updatedDateTime == freezed
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $WikiDataDtoCopyWith<$Res> get wikiDataDto {
    return $WikiDataDtoCopyWith<$Res>(_value.wikiDataDto, (value) {
      return _then(_value.copyWith(wikiDataDto: value));
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
  $Res call({WikiDataDto wikiDataDto, DateTime updatedDateTime});

  @override
  $WikiDataDtoCopyWith<$Res> get wikiDataDto;
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
    Object? wikiDataDto = freezed,
    Object? updatedDateTime = freezed,
  }) {
    return _then(_UnifiedSearchModel(
      wikiDataDto: wikiDataDto == freezed
          ? _value.wikiDataDto
          : wikiDataDto // ignore: cast_nullable_to_non_nullable
              as WikiDataDto,
      updatedDateTime: updatedDateTime == freezed
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifiedSearchModel extends _UnifiedSearchModel {
  const _$_UnifiedSearchModel(
      {required this.wikiDataDto, required this.updatedDateTime})
      : super._();

  factory _$_UnifiedSearchModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UnifiedSearchModelFromJson(json);

  @override
  final WikiDataDto wikiDataDto;
  @override
  final DateTime updatedDateTime;

  @override
  String toString() {
    return 'UnifiedSearchModel(wikiDataDto: $wikiDataDto, updatedDateTime: $updatedDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifiedSearchModel &&
            (identical(other.wikiDataDto, wikiDataDto) ||
                const DeepCollectionEquality()
                    .equals(other.wikiDataDto, wikiDataDto)) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.updatedDateTime, updatedDateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(wikiDataDto) ^
      const DeepCollectionEquality().hash(updatedDateTime);

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
      {required WikiDataDto wikiDataDto,
      required DateTime updatedDateTime}) = _$_UnifiedSearchModel;
  const _UnifiedSearchModel._() : super._();

  factory _UnifiedSearchModel.fromJson(Map<String, dynamic> json) =
      _$_UnifiedSearchModel.fromJson;

  @override
  WikiDataDto get wikiDataDto => throw _privateConstructorUsedError;
  @override
  DateTime get updatedDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifiedSearchModelCopyWith<_UnifiedSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
