import 'package:flutter/material.dart';

import '../../utils/my_text_styles.dart';

class WidgetTextRow extends StatelessWidget {
  final String text;
  final Widget widget;
  final bool isTextAccentColor;

  const WidgetTextRow(
      {Key? key,
      required this.widget,
      required this.text,
      this.isTextAccentColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          widget,
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(text,
                overflow: TextOverflow.ellipsis,
                style: isTextAccentColor
                    ? MyTextStyles.cardEventDetailsAccent
                    : MyTextStyles.cardEventDetailsInActive),
          ),
        ],
      ),
    );
  }
}
