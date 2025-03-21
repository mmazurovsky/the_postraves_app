import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../constants/my_text_styles.dart';
import '../buttons/my_outlined_button.dart';
import '../spacers/my_horizontal_padding.dart';
import '../spacers/section_divider.dart';


class ModalBottomSheetContent extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Widget content;
  final double height;

  const ModalBottomSheetContent({
    Key? key,
    required this.iconData,
    required this.title,
    required this.content,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: MyColors.bottomNavBar,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyHorizontalPadding(
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 30,
                  height: 4,
                  color: MyColors.forInactiveStuff.withOpacity(0.2),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 3),
                    Icon(
                      iconData,
                      size: 24,
                      color: MyColors.main,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        style: MyTextStyles.modalBottomSheetTitle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const SectionDivider(needHorizontalMargin: false),
              ],
            ),
          ),
          Expanded(child: content),
          // const SizedBox(height: 10),
          // MyOutlinedButton(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   text: 'close'.tr(),
          //   onTap: Navigator.of(context).pop,
          //   borderColor: MyColors.main,
          //   textStyle: MyTextStyles.closeModalBottomSheet,
          // ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
