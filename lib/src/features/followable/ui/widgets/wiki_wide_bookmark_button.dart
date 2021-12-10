import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/buttons/button_content.dart';

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
              color: isFollowed
                  ? MyColors.forInactiveStuffDarker
                  : Colors.transparent,
              width: 1.5),
        ),
        child: ButtonContent(
          leading: Icon(
            Ionicons.heart,
            size: 22,
            color: isFollowed
                ? MyColors.forInactiveStuff
                : MyColors.mainOppositeColor,
          ),
          distanceBetweenLeadingAndText: 5,
          text: isFollowed ? 'wikiUnfollow'.tr() : 'wikiFollow'.tr(),
          textStyle: isFollowed
              ? MyTextStyles.buttonWithInactiveStuffColor
              : MyTextStyles.buttonWithOppositeColorBold,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
