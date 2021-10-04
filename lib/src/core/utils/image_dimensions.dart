import '../presentation/widgets/my_cached_network_image.dart';

class ImageDimensions {
  final double _imageHeight;
  final double _imageWidth;

  ImageDimensions(this._imageHeight, this._imageWidth);

  double get imageHeight => _imageHeight;
  double get imageWidth => _imageWidth;

  static Future<ImageDimensions?> getImageDimensions(
      MyCachedNetworkImage image) async {
    final imageInfo = await image.imageInfo;

    return imageInfo == null
        ? null
        : ImageDimensions(imageInfo.image.height.toDouble(),
            imageInfo.image.width.toDouble());
  }
}
