import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_dimensions.freezed.dart';
part 'image_dimensions.g.dart';

@freezed
class ImageDimensions with _$ImageDimensions {
  const ImageDimensions._();
  const factory ImageDimensions(
      {required double height,
      required double width}) = _ImageDimensions;

  factory ImageDimensions.fromJson(Map<String, dynamic> json) =>
      _$ImageDimensionsFromJson(json);
}
