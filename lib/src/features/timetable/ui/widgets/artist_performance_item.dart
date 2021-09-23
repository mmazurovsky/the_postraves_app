import 'package:flutter/material.dart';
import '../../../../models/enum/artist_performance_status.dart';
import '../../../../models/shorts/artist_short.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list_item.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../my_navigation.dart';
import '../../../../core/utils/formatting_utils.dart';

class ArtistPerformanceItem extends StatelessWidget {
  final List<ArtistShort> artists;
  final DateTime startingDateTime;
  final DateTime endingDateTime;

  ArtistPerformanceItem({
    Key? key,
    required this.artists,
    required this.startingDateTime,
    required this.endingDateTime,
  }) : super(key: key);

  ArtistPerformanceStatus _resolvePerformanceStatus() {
    if (DateTime.now().isAfter(endingDateTime)) {
      return ArtistPerformanceStatus.PAST;
    } else if (DateTime.now().isBefore(startingDateTime)) {
      return ArtistPerformanceStatus.UPCOMING;
    } else
      return ArtistPerformanceStatus.LIVE;
  }

  @override
  Widget build(BuildContext context) {
    final performanceStatus = _resolvePerformanceStatus();

    double lineWidth = MediaQuery.of(context).size.width -
        MyConstants.horizontalPaddingOrMargin * 2;

    return Opacity(
      opacity: performanceStatus == ArtistPerformanceStatus.PAST ? 0.35 : 1,
      child: Column(
        children: [
          ...artists.map(
            (artist) => RatingEntityListItem(
              horizontalPadding: MyConstants.horizontalPaddingOrMargin,
              entity: artist,
              onItemTap: (context, ArtistShort entity,
                      ImageDimensions imageDimensions) =>
                  NavigatorFunctions.pushArtist(
                context: context,
                id: entity.id,
                name: entity.name,
                country: entity.country,
                imageLink: entity.imageLink,
                imageDimensions: imageDimensions,
              ),
            ),

            //todo chain for b2b
          ),
          SizedBox(height: 1),
          MyHorizontalPadding(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: lineWidth,
                  height: 0.7,
                  decoration: BoxDecoration(
                    color: MyColors.forDividers,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                DateTime.now().isAfter(startingDateTime)
                    ? Row(
                        children: [
                          Container(
                            width: DateTime.now().isBefore(endingDateTime)
                                ? lineWidth *
                                    (DateTime.now()
                                            .difference(startingDateTime)
                                            .inMinutes /
                                        endingDateTime
                                            .difference(startingDateTime)
                                            .inMinutes)
                                : lineWidth,
                            height: 2.5,
                            decoration: BoxDecoration(
                              color: MyColors.accent,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          DateTime.now().isBefore(endingDateTime)
                              ? Container(
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColors.accent,
                                  ),
                                )
                              : Container()
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          SizedBox(height: 5),
          MyHorizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(FormattingUtils.getFormattedTime(startingDateTime),
                    style: MyTextStyles.body),
                Text(FormattingUtils.getFormattedTime(endingDateTime),
                    style: MyTextStyles.body),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
