import 'package:flutter/material.dart';

class ButtonContent extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String text;
  final TextStyle textStyle;
  final MainAxisAlignment mainAxisAlignment;
  final double? distanceBetweenLeadingAndText;

  ButtonContent({
    Key? key,
    this.leading,
    this.trailing,
    required this.text,
    required this.textStyle,
    required this.mainAxisAlignment,
    this.distanceBetweenLeadingAndText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              leading != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        leading!,
                        SizedBox(
                          width: distanceBetweenLeadingAndText != null
                              ? distanceBetweenLeadingAndText
                              : 13,
                        ),
                      ],
                    )
                  : Container(),
              Flexible(
                child: Text(
                  text,
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        trailing == null
            ? Container()
            : Row(
                children: [
                  SizedBox(
                    width: 13,
                  ),
                  trailing!,
                ],
              )
      ],
    );
  }
}
