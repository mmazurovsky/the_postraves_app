import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/presentation/widgets/buttons/button_content.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WikiWideBookmarkButton extends StatelessWidget {
  final Function() onButtonTap;
  final bool isFollowed;

  const WikiWideBookmarkButton({
    required this.onButtonTap,
    required this.isFollowed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onButtonTap(),
      child: Container(
        height: MyConstants.heightOfContainers,
        decoration: BoxDecoration(
          color: isFollowed ? MyColors.forDarkButtons : MyColors.accent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ButtonContent(
          leading: Icon(
            isFollowed ? null : Ionicons.bookmark,
            size: 20,
            color: isFollowed ? MyColors.main : MyColors.mainOppositeColor,
          ),
          distanceBetweenLeadingAndText: 5,
          text: isFollowed
              ? AppLocalizations.of(context)!.wikiUnfollow
              : AppLocalizations.of(context)!.wikiFollow,
          textStyle: isFollowed
              ? MyTextStyles.buttonWithMainColor
              : MyTextStyles.buttonWithOppositeColor,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
