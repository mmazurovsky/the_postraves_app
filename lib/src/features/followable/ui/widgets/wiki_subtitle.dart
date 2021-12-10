import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/widgets/animations/wrappers.dart';
import '../../../../common/utils/followable_type_utils.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/models/geo/country.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/formatting_utils.dart';
import '../../../../common/widgets/other/row_of_widgets.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';

class WikiSubtitle extends StatelessWidget {
  final FollowableType entityType;
  final Country? country;
  final int? overallFollowers;
  final int? weeklyFollowers;
  final bool? isFollowed;
  const WikiSubtitle({
    Key? key,
    required this.entityType,
    this.country,
    this.overallFollowers,
    this.weeklyFollowers,
    this.isFollowed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: RowOfWidgets(
        children: [
          Text(
            FollowableTypeUtils.getTranslationSingularForType(entityType),
            style: MyTextStyles.sectionTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          entityType != FollowableType.EVENT && country != null
              ? Text(
                  country!.emojiCode,
                  style: MyTextStyles.countryFlag,
                )
              : null,
          entityType != FollowableType.EVENT && country != null
              ? Text(
                  country!.localName,
                  style: MyTextStyles.sectionTitle,
                )
              : null,
          Icon(
            isFollowed == null
                ? Ionicons.heart_outline
                : isFollowed!
                    ? Ionicons.heart
                    : Ionicons.heart_outline,
            size: 19,
            color: isFollowed == null
                ? MyColors.forInactiveStuff
                : isFollowed!
                    ? MyColors.accent
                    : MyColors.forInactiveStuff,
          ),
          overallFollowers != null
              ? Text(
                  overallFollowers.toString(),
                  style: isFollowed == null
                      ? MyTextStyles.sectionTitle
                      : isFollowed!
                          ? MyTextStyles.sectionTitleAccent
                          : MyTextStyles.sectionTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : BlinkAnimationWrapper(
                  startColor: MyColors.forInactiveStuff,
                  endColor: Colors.transparent,
                  widgetBuilder: (Color color) => Text(
                    'loading'.tr(),
                    style: MyTextStyles.wikiLoading(color),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          weeklyFollowers != null
              ? Text(
                  '(${FormattingUtils.resolveTextForWeeklyFollowers(weeklyFollowers!)})',
                  style: FormattingUtils.resolveTextStyleForWeeklyFollowers(
                      weeklyFollowers!),
                )
              : null,
        ],
      ),
    );
  }
}
