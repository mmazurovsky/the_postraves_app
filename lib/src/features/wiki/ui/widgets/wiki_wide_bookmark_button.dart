import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/presentation/widgets/buttons/button_content.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WikiWideBookmarkButton extends StatelessWidget {
  final Function() onIsFollowedChange;
  final bool isFollowed;

  const WikiWideBookmarkButton({
    required this.onIsFollowedChange,
    required this.isFollowed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onIsFollowedChange(),
      child: Container(
        height: MyConstants.heightOfContainers,
        decoration: BoxDecoration(
          color: isFollowed ? Colors.transparent : MyColors.accent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isFollowed ? MyColors.forInactiveStuffDarker : Colors.transparent,
              width: 1.5),
        ),
        child: ButtonContent(
          leading: Icon(
            Ionicons.heart,
            size: 22,
            color: isFollowed
                ? MyColors.forInactiveStuffDarker
                : MyColors.mainOppositeColor,
          ),
          distanceBetweenLeadingAndText: 5,
          text: isFollowed
              ? AppLocalizations.of(context)!.wikiUnfollow
              : AppLocalizations.of(context)!.wikiFollow,
          textStyle: isFollowed
              ? MyTextStyles.buttonWithInactiveStuffDarkerColor
              : MyTextStyles.buttonWithOppositeColor,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
