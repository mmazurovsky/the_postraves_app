import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/buttons/button_content.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';


class ButtonWithIcons extends StatelessWidget {
  final Widget? leadingIcon;
  final String buttonText;
  final Function onButtonTap;
  final double verticalPadding;
  final Widget? trailingIcon;
  const ButtonWithIcons({
    Key? key,
    this.leadingIcon,
    required this.buttonText,
    required this.onButtonTap,
    required this.verticalPadding,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: MyColors.forButtonHighlight,
      onTap: () => onButtonTap(),
      child: MyHorizontalPadding(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: ButtonContent(
            mainAxisAlignment: MainAxisAlignment.start,
            leading: leadingIcon,
            distanceBetweenLeadingAndText: 13,
            text: buttonText,
            trailing: trailingIcon ?? Icon(
                    Ionicons.chevron_forward_outline,
                    size: 26,
                    color: MyColors.accent,
                  ),
            textStyle: MyTextStyles.buttonWithArrow,
          ),
        ),
      ),
    );
  }
}
