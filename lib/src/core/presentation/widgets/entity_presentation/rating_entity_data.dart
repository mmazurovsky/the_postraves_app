import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/core/utils/my_colors.dart';

import '../../../../models/interfaces/data_interfaces.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_constants.dart';
import '../../../utils/my_text_styles.dart';

class RatingEntityData<T extends FollowableInterface> extends StatelessWidget {
  final T entity;

  const RatingEntityData({
    Key? key,
    required this.entity,
  }) : super(key: key);

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
                        entity.country!.countryEmoji,
                        style: const TextStyle(fontSize: MyConstants.diamondWidth),
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
                // Image.asset(
                //   MyImages.diamond,
                //   width: MyConstants.diamondWidth,
                // ),
                Icon(Ionicons.people_circle_outline, size: 19, color: MyColors.accent,),
                const SizedBox(width: 8),
                Text(
                  entity.overallFollowers.toString(),
                  style: MyTextStyles.shortEntityRating,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
