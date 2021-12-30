import 'package:flutter/material.dart';

class EventCardDetails extends StatelessWidget {
  final Widget topLeftWidget;
  final Widget bottomLeftWidget;
  final Widget topRightWidget;
  final Widget bottomRightWidget;
  final double verticalPaddingOfContent;
  const EventCardDetails({
    Key? key,
    required this.topLeftWidget,
    required this.bottomLeftWidget,
    required this.topRightWidget,
    required this.bottomRightWidget,
    required this.verticalPaddingOfContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                topLeftWidget,
                const SizedBox(height: 5),
                bottomLeftWidget,
              ],
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                topRightWidget,
                const SizedBox(height: 5),
                bottomRightWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
