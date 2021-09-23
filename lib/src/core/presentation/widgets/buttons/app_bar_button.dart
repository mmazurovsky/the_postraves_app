import 'package:flutter/material.dart';

import '../../../utils/my_constants.dart';

class AppBarButton extends StatelessWidget {
  AppBarButton({
    Key? key,
    required this.iconWidget,
    required this.containerOpacity,
    required this.onTap,
  }) : super(key: key);

  final double containerOpacity;
  final Icon iconWidget;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(),
      padding: EdgeInsets.all(10),
      visualDensity: VisualDensity.standard,
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: MyConstants.heightOfContainers,
        minWidth: MyConstants.heightOfContainers,
        maxHeight: MyConstants.heightOfContainers,
        maxWidth: MyConstants.heightOfContainers,
      ),
      icon: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: containerOpacity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
              ),
            ),
            iconWidget,
          ],
        ),
      ),
    );
  }
}
