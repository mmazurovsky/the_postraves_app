import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../features/shows/ui/widgets/event_card_details_concrete.dart';
import '../../../features/shows/ui/widgets/event_card_details.dart';
import '../../../models/enum/event_status.dart';
import '../../../models/shorts/event_short.dart';
import '../../utils/my_constants.dart';
import '../../../models/dto/image_dimensions.dart';
import '../../utils/my_colors.dart';
import '../../../features/wiki/ui/widgets/darkened_image_in_container.dart';
import '../../utils/my_text_styles.dart';
import 'widget_text_row.dart';
import 'section_divider.dart';
import '../../../my_navigation.dart';
import '../../utils/formatting_utils.dart';

import '../../../features/wiki/ui/widgets/event_status_indicator.dart';

class ShortEventCardItem extends StatelessWidget {
  const ShortEventCardItem(this._event, [Key? key]) : super(key: key);
  final EventShort _event;

  @override
  Widget build(BuildContext context) {
    return DarkenedImageInContainer(
      onTap: (ImageDimensions? imageDimensions) =>
          NavigatorFunctions.pushFollowable(
        context: context,
        wikiDataDto: _event.convertToWikiDataDto(imageDimensions),
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
                const Icon(
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
            EventCardDetailsConcrete(
              _event,
            ),
          ],
        ),
      ),
    );
  }
}
