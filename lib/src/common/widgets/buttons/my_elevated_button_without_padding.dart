import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../constants/my_constants.dart';
import 'button_content.dart';


class MyElevatedButtonWithoutPadding extends StatelessWidget {
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String text;
  final Color buttonColor;
  final TextStyle textStyle;
  final Function onTap;
  final MainAxisAlignment mainAxisAlignment;
  final double? distanceBetweenLeadingAndText;

  const MyElevatedButtonWithoutPadding({
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
    return InkWell(
      highlightColor: MyColors.forButtonHighlight,
      borderRadius: BorderRadius.circular(8),
      onTap: () => onTap(),
      child: Container(
        height: MyConstants.heightOfContainers,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ButtonContent(
          leading: leadingIcon,
          text: text,
          textStyle: textStyle,
          mainAxisAlignment: mainAxisAlignment,
          trailing: trailingIcon,
          distanceBetweenLeadingAndText: distanceBetweenLeadingAndText,
        ),
      ),
    );
  }
}
