import 'package:flutter/material.dart';

import '../../utils/my_text_styles.dart';

class EventCardRow extends StatelessWidget {
  final Widget leftWidget;
  final String rightText;

  const EventCardRow(
      {Key? key, required this.leftWidget, required this.rightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget,
        Text(
          rightText,
          style: MyTextStyles.cardEventDetails,
        ),
      ],
    );
  }
}
