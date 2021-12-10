import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';

import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/related_to_event/event_status.dart';
import 'package:the_postraves_package/service/open_link_service.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/buttons/my_elevated_button_without_padding.dart';
import 'wiki_squared_outlined_bookmark_button.dart';
import 'wiki_wide_bookmark_button.dart';

class EventMainButton extends StatelessWidget {
  final EventStatus status;
  final String? ticketsLink;
  final bool isFollowed;
  final void Function() onIsFollowedChange;
  const EventMainButton(
      {required this.status,
      required this.ticketsLink,
      required this.isFollowed,
      required this.onIsFollowedChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ticketsLink != null &&
            status != EventStatus.PAST &&
            status != EventStatus.CANCELLED
        ? Row(
            children: [
              Expanded(
                child: MyElevatedButtonWithoutPadding(
                  leadingIcon: const Icon(
                    Ionicons.ticket,
                    size: 21,
                    color: MyColors.mainOppositeColor,
                  ),
                  text: 'wikiEventBuyTicket'.tr(),
                  buttonColor: MyColors.accent,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onTap: () => OpenLinkService.openUrl(ticketsLink!),
                  textStyle: MyTextStyles.buttonWithOppositeColorBold,
                  distanceBetweenLeadingAndText: 5,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              WikiSquaredOutlinedBookmarkButton(
                isFollowed: isFollowed,
                onIsFollowedChange: onIsFollowedChange,
              ),
            ],
          )
        : WikiWideBookmarkButton(
            isFollowed: isFollowed,
            onIsFollowedChange: onIsFollowedChange,
          );
  }
}
