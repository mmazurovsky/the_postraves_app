import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../wiki/ui/widgets/event_status_indicator.dart';
import '../../../../models/enum/event_status.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../core/presentation/widgets/widget_text_row.dart';
import '../../../../core/utils/formatting_utils.dart';
import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/my_colors.dart';
import 'event_card_details.dart';

class EventCardDetailsConcrete extends StatelessWidget {
  final EventShort _event;
  const EventCardDetailsConcrete(this._event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EventCardDetails(
      topLeftWidget: WidgetTextRow(
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
      bottomLeftWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: _event.status != EventStatus.LIVE
              ? Icon(Ionicons.calendar_clear_outline,
                  size: 19, color: MyColors.accent)
              : EventStatusIndicator(_event.status),
        ),
        text: _event.status != EventStatus.UPCOMING &&
                _event.status != EventStatus.PRESALE
            ? _event.status.getStatusName(context)
            : FormattingUtils.getFormattedDateShort(
                context: context,
                dateTime: _event.startDateTime,
              ),
      ),
      topRightWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: Icon(
            _event.isFollowed ? Ionicons.heart : Ionicons.heart_outline,
            size: 19,
            color: MyColors.accent,
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
            color: MyColors.accent,
          ),
        ),
        text: FormattingUtils.resolveTicketsPrice(
            context: context, priceRangeOfTickets: _event.priceRangeOfTickets),
      ),
      verticalPaddingOfContent: 20,
    );
  }
}
