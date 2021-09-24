import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import 'empty_image_placeholder.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String? imageLink;
  final Completer<ImageInfo> _imageCompleter;
  MyCachedNetworkImage(this.imageLink, {Key? key})
      : _imageCompleter = Completer<ImageInfo>(),
        super(key: key);

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
            imageUrl: imageLink!,
            imageBuilder: (context, provider) {
              provider
                  .resolve(const ImageConfiguration())
                  .addListener(ImageStreamListener((imageInfo, _) {
                _imageCompleter.isCompleted
                    ? null
                    : _imageCompleter.complete(imageInfo);
              }));
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
