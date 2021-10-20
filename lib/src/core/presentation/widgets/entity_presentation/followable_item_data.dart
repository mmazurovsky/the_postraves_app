import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../utils/my_colors.dart';

import '../../../../models/interfaces/data_interfaces.dart';
import '../../../utils/my_constants.dart';
import '../../../utils/my_text_styles.dart';

class FollowableItemData<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final T entity;
  final bool showWeeklyFollowers;
  final String? hintText;

  const FollowableItemData({
    Key? key,
    required this.entity,
    this.showWeeklyFollowers = false,
    this.hintText,
  }) : super(key: key);

  TextStyle _resolveFollowersTextStyle() {
    if (showWeeklyFollowers) {
      if (entity.weeklyFollowers > 0) {
        return MyTextStyles.shortEntityPositiveWeeklyRating;
      } else if (entity.weeklyFollowers < 0) {
        return MyTextStyles.shortEntityNegativeWeeklyRating;
      } else {
        return MyTextStyles.shortEntityOverallRating;
      }
    } else {
      if (entity.isFollowed) {
        return MyTextStyles.shortEntityRatingAccent;
      } else {
        return MyTextStyles.shortEntityOverallRating;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            entity.country != null
                ? Row(
                    children: [
                      Text(
                        entity.country!.emojiCode,
                        style:
                            MyTextStyles.countryFlag,
                      ),
                      const SizedBox(width: 8),
                    ],
                  )
                : Container(),
            Flexible(
              child: Text(
                entity.name,
                style: MyTextStyles.shortEntityName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  entity.isFollowed ? Ionicons.heart : Ionicons.heart_outline,
                  size: 19,
                  color: MyColors.accent,
                ),
                const SizedBox(width: 8),
                Text(
                  showWeeklyFollowers
                      ? entity.weeklyFollowers > 0
                          ? '+${entity.weeklyFollowers}'
                          : entity.weeklyFollowers.toString()
                      : entity.overallFollowers.toString(),
                  style: _resolveFollowersTextStyle(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
