import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_text_styles.dart';
import 'buttons/my_outlined_button.dart';
import 'my_horizontal_padding.dart';
import 'section_divider.dart';

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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 30,
                height: 4,
                color: MyColors.forInactiveStuff.withOpacity(0.2),
              ),
              const SizedBox(height: 12),
              Icon(
                iconData,
                size: 40,
                color: MyColors.main,
              ),
              const SizedBox(height: 8),
              MyHorizontalPadding(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: MyTextStyles.modalBottomSheetTitle,
                ),
              ),
              const SizedBox(height: 15),
              const SectionDivider(needHorizontalMargin: true),
            ],
          ),
          Expanded(child: content),
          const SizedBox(height: 10),
          MyOutlinedButton(
            mainAxisAlignment: MainAxisAlignment.center,
            text: AppLocalizations.of(context)!.close,
            onTap: Navigator.of(context).pop,
            borderColor: MyColors.main,
            textStyle: MyTextStyles.closeModalBottomSheet,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
    
  }
}
