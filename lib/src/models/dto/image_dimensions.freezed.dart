// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'image_dimensions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageDimensions _$ImageDimensionsFromJson(Map<String, dynamic> json) {
  return _ImageDimensions.fromJson(json);
}

/// @nodoc
class _$ImageDimensionsTearOff {
  const _$ImageDimensionsTearOff();

  _ImageDimensions call({required double height, required double width}) {
    return _ImageDimensions(
      height: height,
      width: width,
    );
  }

  ImageDimensions fromJson(Map<String, Object> json) {
    return ImageDimensions.fromJson(json);
  }
}

/// @nodoc
const $ImageDimensions = _$ImageDimensionsTearOff();

/// @nodoc
mixin _$ImageDimensions {
  double get height => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDimensionsCopyWith<ImageDimensions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDimensionsCopyWith<$Res> {
  factory $ImageDimensionsCopyWith(
          ImageDimensions value, $Res Function(ImageDimensions) then) =
      _$ImageDimensionsCopyWithImpl<$Res>;
  $Res call({double height, double width});
}

/// @nodoc
class _$ImageDimensionsCopyWithImpl<$Res>
    implements $ImageDimensionsCopyWith<$Res> {
  _$ImageDimensionsCopyWithImpl(this._value, this._then);

  final ImageDimensions _value;
  // ignore: unused_field
  final $Res Function(ImageDimensions) _then;

  @override
  $Res call({
    Object? height = freezed,
    Object? width = freezed,
  }) {
    return _then(_value.copyWith(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ImageDimensionsCopyWith<$Res>
    implements $ImageDimensionsCopyWith<$Res> {
  factory _$ImageDimensionsCopyWith(
          _ImageDimensions value, $Res Function(_ImageDimensions) then) =
      __$ImageDimensionsCopyWithImpl<$Res>;
  @override
  $Res call({double height, double width});
}

/// @nodoc
class __$ImageDimensionsCopyWithImpl<$Res>
    extends _$ImageDimensionsCopyWithImpl<$Res>
    implements _$ImageDimensionsCopyWith<$Res> {
  __$ImageDimensionsCopyWithImpl(
      _ImageDimensions _value, $Res Function(_ImageDimensions) _then)
      : super(_value, (v) => _then(v as _ImageDimensions));

  @override
  _ImageDimensions get _value => super._value as _ImageDimensions;

  @override
  $Res call({
    Object? height = freezed,
    Object? width = freezed,
  }) {
    return _then(_ImageDimensions(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageDimensions extends _ImageDimensions {
  const _$_ImageDimensions({required this.height, required this.width})
      : super._();

  factory _$_ImageDimensions.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageDimensionsFromJson(json);

  @override
  final double height;
  @override
  final double width;

  @override
  String toString() {
    return 'ImageDimensions(height: $height, width: $width)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageDimensions &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(width);

  @JsonKey(ignore: true)
  @override
  _$ImageDimensionsCopyWith<_ImageDimensions> get copyWith =>
      __$ImageDimensionsCopyWithImpl<_ImageDimensions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageDimensionsToJson(this);
  }
}

abstract class _ImageDimensions extends ImageDimensions {
  const factory _ImageDimensions(
      {required double height, required double width}) = _$_ImageDimensions;
  const _ImageDimensions._() : super._();

  factory _ImageDimensions.fromJson(Map<String, dynamic> json) =
      _$_ImageDimensions.fromJson;

  @override
  double get height => throw _privateConstructorUsedError;
  @override
  double get width => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageDimensionsCopyWith<_ImageDimensions> get copyWith =>
      throw _privateConstructorUsedError;
}
