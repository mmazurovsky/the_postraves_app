import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import '../../../features/shows/ui/widgets/event_card_details_concrete.dart';
import '../../../features/wiki/ui/widgets/darkened_image_in_container.dart';
import '../../../my_navigation.dart';
import '../../constants/my_text_styles.dart';
import '../spacers/section_divider.dart';

class ShortEventCardItem extends StatelessWidget {
  const ShortEventCardItem(this._event, [Key? key]) : super(key: key);
  final EventShort _event;

  @override
  Widget build(BuildContext context) {
    return DarkenedImageInContainer(
      onTap: (ImageDimensions? imageDimensions) =>
          NavigatorFunctions.pushFollowable(
        context: context,
        followableData: _event.convertToFollowableData(imageDimensions),
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
