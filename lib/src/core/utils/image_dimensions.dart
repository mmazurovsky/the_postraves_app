import '../presentation/widgets/my_cached_network_image.dart';

class ImageDimensions {
  final int _imageHeight;
  final int _imageWidth;

  ImageDimensions(this._imageHeight, this._imageWidth);
  ImageDimensions.defaultDimensions() : this(800, 800); //todo check it is ok

  int get imageHeight => _imageHeight;
  int get imageWidth => _imageWidth;

  static Future<ImageDimensions?> getImageInfo(
      MyCachedNetworkImage image) async {
    final imageInfo = await image.imageInfo;
    return imageInfo == null ? null : ImageDimensions(imageInfo.image.height, imageInfo.image.width);
  }
}
