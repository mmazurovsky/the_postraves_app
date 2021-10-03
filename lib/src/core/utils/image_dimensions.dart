import '../presentation/widgets/my_cached_network_image.dart';

class ImageDimensions {
  final int _imageHeight;
  final int _imageWidth;

  ImageDimensions(this._imageHeight, this._imageWidth);

  int get imageHeight => _imageHeight;
  int get imageWidth => _imageWidth;

  static Future<ImageDimensions?> getImageDimensions(
      MyCachedNetworkImage image) async {
    final imageInfo = await image.imageInfo;

    return imageInfo == null
        ? null
        : ImageDimensions(imageInfo.image.height, imageInfo.image.width);
  }
}
