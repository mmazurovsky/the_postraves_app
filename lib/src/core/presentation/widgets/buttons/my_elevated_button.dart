import 'package:flutter/material.dart';
import '../my_horizontal_padding.dart';
import 'my_elevated_button_without_padding.dart';

class MyElevatedButton extends StatelessWidget {
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String text;
  final Color buttonColor;
  final TextStyle textStyle;
  final Function onTap;
  final MainAxisAlignment mainAxisAlignment;
  final double? distanceBetweenLeadingAndText;

  const MyElevatedButton({
    Key? key,
    this.leadingIcon,
    this.trailingIcon,
    required this.text,
    required this.buttonColor,
    required this.textStyle,
    required this.onTap,
    required this.mainAxisAlignment,
    this.distanceBetweenLeadingAndText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: MyElevatedButtonWithoutPadding(
        onTap: () => onTap(),
        leadingIcon: leadingIcon,
        distanceBetweenLeadingAndText: distanceBetweenLeadingAndText,
        text: text,
        textStyle: textStyle,
        buttonColor: buttonColor,
        mainAxisAlignment: mainAxisAlignment,
        trailingIcon: trailingIcon,
      ),
    );
  }
}
