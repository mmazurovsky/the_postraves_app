import 'package:flutter/material.dart';
import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/screen_size.dart';
import '../../../../models/shorts/artist_short.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list_item.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../my_navigation.dart';
import '../../../../core/utils/formatting_utils.dart';

class ArtistPerformanceItem extends StatefulWidget {
  final List<ArtistShort> artists;
  final DateTime startingDateTime;
  final DateTime endingDateTime;

  const ArtistPerformanceItem({
    Key? key,
    required this.artists,
    required this.startingDateTime,
    required this.endingDateTime,
  }) : super(key: key);

  @override
  State<ArtistPerformanceItem> createState() => _ArtistPerformanceItemState();
}

class _ArtistPerformanceItemState extends State<ArtistPerformanceItem> {
  late double _maxLineWidthForScreenSize;
  static const double
      _paddingFromRightForLineWidthWhenItIsCloseToRightCornerOfScreen = 8;

  @override
  void initState() {
    super.initState();
    _maxLineWidthForScreenSize =
        ScreenSize.width - MyConstants.horizontalPaddingOrMargin * 2;
  }

  double _calculateLineWidthForLiveEvent() {
    if (DateTime.now().isBefore(widget.endingDateTime)) {
      final calculatedLineWidth = _maxLineWidthForScreenSize *
              (DateTime.now().difference(widget.startingDateTime).inMinutes /
                  widget.endingDateTime
                      .difference(widget.startingDateTime)
                      .inMinutes);
      if (calculatedLineWidth > _maxLineWidthForScreenSize - _paddingFromRightForLineWidthWhenItIsCloseToRightCornerOfScreen) {
        return calculatedLineWidth - _paddingFromRightForLineWidthWhenItIsCloseToRightCornerOfScreen;
      } else {
        return calculatedLineWidth;
      }
    } else {
      return _maxLineWidthForScreenSize;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: DateTime.now().isAfter(widget.endingDateTime) ? 0.35 : 1,
      child: Column(
        children: [
          ...widget.artists.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final artist = entry.value;
              final artistWidget = RatingEntityListItem(
                horizontalPadding: MyConstants.horizontalPaddingOrMargin,
                entity: artist,
                onItemTap: (context, ArtistShort entity,
                        ImageDimensions? imageDimensions) =>
                    NavigatorFunctions.pushFollowable(
                  context: context,
                  wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
                ),
              );
              if (index + 1 != widget.artists.length) {
                return Column(
                  children: [
                    artistWidget,
                    MyHorizontalPadding(
                      child: Row(
                        children: [
                          const SizedBox(width: 18),
                          Image.asset(MyEmoji.link, width: 14),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return artistWidget;
              }
            },
          ),
          const SizedBox(height: 1),
          MyHorizontalPadding(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: _maxLineWidthForScreenSize,
                  height: 0.7,
                  decoration: BoxDecoration(
                    color: MyColors.forDividers,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                DateTime.now().isAfter(widget.startingDateTime)
                    ? Row(
                        children: [
                          Container(
                            width: _calculateLineWidthForLiveEvent(),
                            height: 2.5,
                            decoration: BoxDecoration(
                              color: MyColors.accent,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          DateTime.now().isBefore(widget.endingDateTime)
                              ? Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
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
                Text(FormattingUtils.getFormattedTime(widget.startingDateTime),
                    style: MyTextStyles.body),
                Text(FormattingUtils.getFormattedTime(widget.endingDateTime),
                    style: MyTextStyles.body),
              ],
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
