import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/constants/my_text_styles.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_constants.dart';

class WikiSquaredOutlinedBookmarkButton extends StatelessWidget {
  final void Function() onIsFollowedChange;
  final bool isFollowed;
  final int overallFollowers;

  const WikiSquaredOutlinedBookmarkButton({
    required this.isFollowed,
    required this.onIsFollowedChange,
    required this.overallFollowers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onIsFollowedChange,
      child: Container(
        padding: const EdgeInsets.all(4),
        height: MyConstants.heightOfContainers,
        width: MyConstants.heightOfContainers,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              color: isFollowed ? MyColors.forInactiveStuffDarker : MyColors.accent,
              width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isFollowed ? Ionicons.heart : Ionicons.heart_outline,
              size: 22,
              color: MyColors.accent,
            ),
            const SizedBox(height: 2),
            Text(
              overallFollowers.toString(),
              style: isFollowed
                  ? MyTextStyles.activeFollowers
                  : MyTextStyles.inactiveFollowers,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
