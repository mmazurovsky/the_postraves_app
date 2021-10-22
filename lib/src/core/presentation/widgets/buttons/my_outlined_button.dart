import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/buttons/my_outlined_button_without_padding.dart';
import 'button_content.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_constants.dart';
import '../my_horizontal_padding.dart';

class MyOutlinedButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final TextStyle textStyle;
  final Color borderColor;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final MainAxisAlignment mainAxisAlignment;
  final double contentHorizontalPadding;
  final double? distanceBetweenLeadingAndText;

  const MyOutlinedButton({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.onTap,
    required this.borderColor,
    required this.mainAxisAlignment,
    this.distanceBetweenLeadingAndText,
    this.leadingIcon,
    this.trailingIcon,
    this.contentHorizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: MyOutlinedButtonWithoutPadding(
        onTap: onTap,
        leadingIcon: leadingIcon,
        distanceBetweenLeadingAndText: distanceBetweenLeadingAndText,
        mainAxisAlignment: mainAxisAlignment,
        text: text,
        textStyle: textStyle,
        borderColor: borderColor,
        contentHorizontalPadding: contentHorizontalPadding,
        trailingIcon: trailingIcon,
      ),
    );
  }
}
