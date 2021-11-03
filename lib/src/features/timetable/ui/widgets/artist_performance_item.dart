import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import '../../../../common/widgets/entity_presentation/followable_item.dart';
import '../../../../common/utils/formatting_utils.dart';
import '../../../../common/constants/my_assets.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/navigation/my_navigation.dart';

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
      if (calculatedLineWidth >
          _maxLineWidthForScreenSize -
              _paddingFromRightForLineWidthWhenItIsCloseToRightCornerOfScreen) {
        return calculatedLineWidth -
            _paddingFromRightForLineWidthWhenItIsCloseToRightCornerOfScreen;
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
              final artistWidget = FollowableItem(
                key: ValueKey(artist.id),
                horizontalPadding: MyConstants.horizontalPaddingOrMargin,
                entity: artist,
                onItemTap: (context, ArtistShort entity,
                        ImageDimensions? imageDimensions) =>
                    NavigatorFunctions.pushFollowable(
                  context: context,
                  followableData:
                      entity.convertToFollowableData(imageDimensions),
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
