import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../constants/my_constants.dart';
import 'button_content.dart';

class MyOutlinedButtonWithoutPadding extends StatelessWidget {
  final Function onTap;
  final String text;
  final TextStyle textStyle;
  final Color borderColor;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final MainAxisAlignment mainAxisAlignment;
  final double contentHorizontalPadding;
  final double? distanceBetweenLeadingAndText;
  final double? width;

  const MyOutlinedButtonWithoutPadding({
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
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: MyColors.forButtonHighlight,
      borderRadius: BorderRadius.circular(8),
      onTap: () => onTap(),
      child: Container(
        height: MyConstants.heightOfContainers,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: contentHorizontalPadding),
          child: ButtonContent(
            leading: leadingIcon,
            text: text,
            textStyle: textStyle,
            mainAxisAlignment: mainAxisAlignment,
            trailing: trailingIcon,
            distanceBetweenLeadingAndText: distanceBetweenLeadingAndText,
          ),
        ),
      ),
    );
  }
}
