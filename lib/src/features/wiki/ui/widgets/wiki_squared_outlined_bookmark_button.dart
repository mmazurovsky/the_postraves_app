import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';

class WikiSquaredOutlinedBookmarkButton extends StatelessWidget {
  final void Function() onIsFollowedChange;
  final bool isFollowed;

  const WikiSquaredOutlinedBookmarkButton(
      {required this.isFollowed,
      required this.onIsFollowedChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onIsFollowedChange,
      child: Container(
        height: MyConstants.heightOfContainers,
        width: MyConstants.heightOfContainers,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              color: isFollowed ? MyColors.forInactiveStuff2 : MyColors.accent,
              width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Ionicons.bookmark,
          size: 24,
          color: isFollowed ? MyColors.forInactiveStuff2 : MyColors.accent,
        ),
      ),
    );
  }
}
