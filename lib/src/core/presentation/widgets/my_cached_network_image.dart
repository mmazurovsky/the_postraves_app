import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import 'empty_image_placeholder.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String? imageLink;
  final Completer<ImageInfo> _imageCompleter;
  MyCachedNetworkImage(this.imageLink, {Key? key})
      : _imageCompleter = Completer<ImageInfo>(),
        super(key: ValueKey(imageLink));

  Future<ImageInfo?> get imageInfo async {
    return imageLink == null || imageLink!.length < 3
        ? null
        : await _imageCompleter.future;
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
                          'CachedNetworkImage exception: $exception, stacktrace: $stackTrace'),
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
