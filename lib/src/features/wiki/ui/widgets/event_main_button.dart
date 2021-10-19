import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/buttons/my_elevated_button_without_padding.dart';
import 'package:the_postraves_app/src/core/service/open_link_service.dart';
import 'package:the_postraves_app/src/core/utils/my_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/core/utils/my_text_styles.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_squared_outlined_bookmark_button.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_wide_bookmark_button.dart';
import 'package:the_postraves_app/src/models/enum/event_status.dart';

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
                  text: AppLocalizations.of(context)!.wikiEventBuyTicket,
                  buttonColor: MyColors.accent,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onTap: () => OpenLinkService.openUrl(ticketsLink!),
                  textStyle: MyTextStyles.buttonWithOppositeColor,
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
