import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/buttons/button_content.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';

class WikiWideBookmarkButton extends StatelessWidget {
  WikiWideBookmarkButton({
    Key? key,
    required this.buttonText,
    required this.onButtonTap,
    this.iconWidget,
  }) : super(key: key);

  final String buttonText;
  final Function onButtonTap;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onButtonTap,
      child: Container(
        height: MyConstants.heightOfContainers,
        decoration: BoxDecoration(
          color: MyColors.accent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ButtonContent(
          leading: iconWidget,
          distanceBetweenLeadingAndText: 5,
          text: buttonText,
          textStyle: MyTextStyles.buttonWithOppositeColor,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
