import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../shows/ui/widgets/event_card_details.dart';
import '../../../../models/enum/event_status.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import 'darkened_image_in_container.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/widget_text_row.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../my_navigation.dart';
import '../../../../core/utils/formatting_utils.dart';

import '../../../../core/utils/my_assets.dart';
import 'event_status_indicator.dart';

class ShortEventCardItem extends StatelessWidget {
  const ShortEventCardItem(this._event, [Key? key]) : super(key: key);
  final EventShort _event;

  @override
  Widget build(BuildContext context) {
    return DarkenedImageInContainer(
      onTap: (ImageDimensions? imageDimensions) => NavigatorFunctions.pushEvent(
        context: context,
        imageLink: _event.imageLink,
        id: _event.id,
        name: _event.name,
        imageDimensions: imageDimensions,
      ),
      imageLink: _event.imageLink,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    _event.name,
                    style: MyTextStyles.shortEventName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Ionicons.chevron_forward_outline,
                  size: 22,
                  color: MyColors.accent,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SectionDivider(needHorizontalMargin: false),
            SizedBox(
              height: 15,
            ),
            EventCardDetails(
              topLeftWidget: WidgetTextRow(
                widget: Container(
                  width: 20,
                  alignment: Alignment.center,
                  child: Text(_event.place.city.country.emojiCode,
                      style: TextStyle(fontSize: MyConstants.diamondWidth)),
                ),
                text: _event.place.city.localizedName,
              ),
              bottomLeftWidget: WidgetTextRow(
                widget: SizedBox(
                  width: 20,
                  child: Icon(
                    Ionicons.location_outline,
                    size: 19,
                    color: MyColors.accent,
                  ),
                ),
                text: _event.place.name,
              ),
              topRightWidget: WidgetTextRow(
                widget: const SizedBox(
                  width: 20,
                  child: Icon(
                    Ionicons.people_circle_outline,
                    size: 19,
                    color: MyColors.accent,
                  ),
                ),
                text: _event.overallFollowers.toString(),
              ),
              bottomRightWidget: WidgetTextRow(
                widget: SizedBox(
                  width: 20,
                  child: _event.status != EventStatus.LIVE
                      ? Icon(Ionicons.calendar_clear_outline,
                          size: 19, color: MyColors.accent)
                      : EventStatusIndicator(_event.status),
                ),
                text: _event.status != EventStatus.UPCOMING
                    ? _event.status.getStatusName(context)
                    : FormattingUtils.getFormattedDateShort(
                        context: context,
                        dateTime: _event.startDateTime,
                      ),
              ),
              verticalPaddingOfContent: 8,
            ),
          ],
        ),
      ),
    );
  }
}
