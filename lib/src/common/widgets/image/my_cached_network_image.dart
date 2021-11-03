import 'dart:async';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'empty_image_placeholder.dart';



class MyCachedNetworkImage extends StatelessWidget {
  final String? imageLink;
  final Completer<ImageInfo> _imageCompleter;
  MyCachedNetworkImage(this.imageLink, {Key? key})
      : _imageCompleter = Completer<ImageInfo>(),
        super(key: ValueKey(imageLink));

  Future<ImageDimensions?> getImageDimensions() async {
    if (imageLink == null || imageLink!.length < 3) {
      return null;
    } else {
      final imageInfo = await _imageCompleter.future;
      return ImageDimensions(height: imageInfo.image.height.toDouble(),
              width: imageInfo.image.width.toDouble());
    }
  }

  @override
  Widget build(BuildContext context) {
    return imageLink == null || imageLink!.length < 3
        ? const EmptyImagePlaceholder()
        : CachedNetworkImage(
            key: ValueKey(imageLink! + 'cached1'),
            imageUrl: imageLink!,
            imageBuilder: (context, provider) {
              provider.resolve(const ImageConfiguration()).addListener(
                    ImageStreamListener(
                      (imageInfo, _) {
                        if (!_imageCompleter.isCompleted) {
                          _imageCompleter.complete(imageInfo);
                        }
                      },
                      onError: (exception, stackTrace) => log(
                          'CachedNetworkImage exception: $exception, stacktrace: $stackTrace'), //TODO exception
                    ),
                  );
              return Image(
                image: provider,
                fit: BoxFit.cover,
              );
            },
            placeholder: (context, url) =>
                Container(color: MyColors.forEventCard),
            errorWidget: (context, url, smth) => const EmptyImagePlaceholder(),
          );
  }
}
