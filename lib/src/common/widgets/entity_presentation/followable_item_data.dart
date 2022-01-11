import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:the_postraves_app/src/features/followable/state/followable_change_notifier.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../constants/my_text_styles.dart';
import '../../utils/formatting_utils.dart';

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

  TextStyle _resolveFollowersTextStyle(
      FollowableVariables followableVariables) {
    if (showWeeklyFollowers) {
      return FormattingUtils.resolveTextStyleForWeeklyFollowers(
          followableVariables.weeklyFollowers);
    } else {
      if (followableVariables.isFollowed) {
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
                        style: MyTextStyles.countryFlag,
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
            ChangeNotifierProvider.value(
              value: context
                  .read<FollowableVariablesService>()
                  .get(entity.newFollowableId),
              builder: (context, _) {
                final variables = context.watch<FollowableVariables?>() ??
                    entity.newFollowableVariables;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      variables.isFollowed
                          ? Ionicons.heart
                          : Ionicons.heart_outline,
                      size: 19,
                      color: variables.isFollowed
                          ? MyColors.accent
                          : MyColors.forInactiveStuff,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      showWeeklyFollowers
                          ? FormattingUtils.resolveTextForWeeklyFollowers(
                              variables.weeklyFollowers)
                          : variables.overallFollowers.toString(),
                      style: _resolveFollowersTextStyle(variables),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
