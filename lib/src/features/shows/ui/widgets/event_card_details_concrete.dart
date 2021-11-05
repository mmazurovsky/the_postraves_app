import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/features/followable/ui/widgets/event_status_indicator.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/related_to_event/event_status.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import '../../../../common/utils/formatting_utils.dart';
import '../../../../common/widgets/other/widget_text_row.dart';
import 'event_card_details.dart';

class EventCardDetailsConcrete extends StatelessWidget {
  final EventShort _event;
  const EventCardDetailsConcrete(
    this._event, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EventCardDetails(
      topLeftWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: Icon(
            _event.place.isFollowed ? Ionicons.heart : Ionicons.compass_outline,
            size: 19,
            color: _event.place.isFollowed
                ? MyColors.accent
                : MyColors.forInactiveStuff,
          ),
        ),
        isTextAccentColor: _event.place.isFollowed,
        text: _event.place.name,
      ),
      bottomLeftWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: _event.status != EventStatus.LIVE
              ? const Icon(Ionicons.calendar_clear_outline,
                  size: 19, color: MyColors.forInactiveStuff)
              : EventStatusIndicator(_event.status),
        ),
        text: _event.status != EventStatus.UPCOMING &&
                _event.status != EventStatus.PRESALE
            ? FormattingUtils.getEventStatusNameTranslation(_event.status)
            : FormattingUtils.getFormattedDateShort(
                dateTime: _event.startDateTime,
              ),
      ),
      topRightWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: Icon(
            _event.isFollowed ? Ionicons.heart : Ionicons.heart_outline,
            size: 19,
            color:
                _event.isFollowed ? MyColors.accent : MyColors.forInactiveStuff,
          ),
        ),
        isTextAccentColor: _event.isFollowed,
        text: _event.overallFollowers.toString(),
      ),
      bottomRightWidget: WidgetTextRow(
        widget: const SizedBox(
          width: 20,
          child: Icon(
            Ionicons.pricetag_outline,
            size: 19,
            color: MyColors.forInactiveStuff,
          ),
        ),
        text: FormattingUtils.resolveTicketsPrice(_event.ticketPrices),
      ),
      verticalPaddingOfContent: 20,
    );
  }
}
