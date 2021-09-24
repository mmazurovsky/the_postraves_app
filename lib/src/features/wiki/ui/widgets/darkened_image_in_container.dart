import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/utils/image_dimensions.dart';

class DarkenedImageInContainer extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final String? imageLink;
  const DarkenedImageInContainer({
    Key? key,
    required this.child,
    required this.onTap,
    this.imageLink,
  }) : super(key: key);

  @override
  _DarkenedImageInContainerState createState() =>
      _DarkenedImageInContainerState();
}

class _DarkenedImageInContainerState extends State<DarkenedImageInContainer> {
  late MyCachedNetworkImage _eventImage;

  @override
  void initState() {
    super.initState();
    _eventImage = MyCachedNetworkImage(widget.imageLink);
  }

  @override
  Widget build(BuildContext context) {
    return MyHorizontalMargin(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () async {
            widget.onTap(await ImageDimensions.getImageInfo(_eventImage));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 145,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  _eventImage,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                    ),
                  ),
                  widget.child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
