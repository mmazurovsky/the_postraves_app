import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/geo/country.dart';
import '../../../../core/presentation/widgets/row_of_widgets.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/animations/blink_animation_wrapper.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class WikiSubtitle extends StatelessWidget {
  const WikiSubtitle({
    Key? key,
    required this.entityType,
    this.country,
    this.overallFollowers,
  }) : super(key: key);
  final WikiFollowableType entityType;
  final Country? country;
  final int? overallFollowers;

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: RowOfWidgets(
        children: [
          Text(
            entityType.getNameSingular(context),
            style: MyTextStyles.sectionTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          country != null
              ? Text(
                  country!.emojiCode,
                  style: TextStyle(fontSize: 20),
                )
              : null,
          country != null
              ? Text(
                  country!.localName,
                  style: MyTextStyles.sectionTitle,
                )
              : null,
          // Image.asset(
          //   MyImages.diamond,
          //   width: MyConstants.diamondWidth,
          // ),
          const Icon(
            Ionicons.people_circle_outline,
            size: 19,
            color: MyColors.accent,
          ),
          overallFollowers != null
              ? Text(
                  overallFollowers.toString(),
                  style: MyTextStyles.sectionTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : BlinkAnimationWrapper(
                  startColor: MyColors.forInactiveStuff,
                  endColor: Colors.transparent,
                  widgetBuilder: (Color color) => Text(
                    AppLocalizations.of(context)!.loading,
                    style: MyTextStyles.wikiLoading(color),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
        ],
      ),
    );
  }
}
