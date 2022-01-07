import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/src/provider.dart';
import 'package:the_postraves_app/src/features/followable/state/followable_change_notifier.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import '../../../followable/ui/widgets/event_status_indicator.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/related_to_event/event_status.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import '../../../../common/utils/formatting_utils.dart';
import '../../../../common/widgets/other/widget_text_row.dart';
import 'event_card_details.dart';

class EventCardDetailsConcrete extends StatefulWidget {
  final EventShort _event;
  const EventCardDetailsConcrete(
    this._event, {
    Key? key,
  }) : super(key: key);

  @override
  State<EventCardDetailsConcrete> createState() =>
      _EventCardDetailsConcreteState();
}

class _EventCardDetailsConcreteState extends State<EventCardDetailsConcrete> {
  FollowableVariables? _eventFollowableVariables;
  FollowableVariables? _placeFollowableVariables;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final watchedEvent = context
        .watch<FollowableChangeNotifier>()
        .get(widget._event.followableId);
    final watchedPlace = context
        .watch<FollowableChangeNotifier>()
        .get(widget._event.place.followableId);

    if (watchedEvent != null) {
      if (_eventFollowableVariables != watchedEvent) {
        _eventFollowableVariables = watchedEvent;
      }
    } else {
      _eventFollowableVariables = widget._event.followableVariables;
    }

    if (watchedPlace != null) {
      if (_placeFollowableVariables != watchedPlace) {
        _placeFollowableVariables = watchedPlace;
      }
    } else {
      _placeFollowableVariables = widget._event.place.followableVariables;
    }
  }

  @override
  Widget build(BuildContext context) {
    return EventCardDetails(
      topLeftWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: Icon(
            _placeFollowableVariables!.isFollowed
                ? Ionicons.heart
                : Ionicons.compass_outline,
            size: 19,
            color: _placeFollowableVariables!.isFollowed
                ? MyColors.accent
                : MyColors.forInactiveStuff,
          ),
        ),
        isTextAccentColor: _placeFollowableVariables!.isFollowed,
        text: widget._event.place.name,
      ),
      bottomLeftWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: widget._event.status != EventStatus.LIVE
              ? const Icon(Ionicons.calendar_clear_outline,
                  size: 19, color: MyColors.forInactiveStuff)
              : EventStatusIndicator(widget._event.status),
        ),
        text: widget._event.status != EventStatus.UPCOMING &&
                widget._event.status != EventStatus.PRESALE
            ? FormattingUtils.getEventStatusNameTranslation(
                widget._event.status)
            : FormattingUtils.getFormattedDateShort(
                dateTime: widget._event.startDateTime,
              ),
      ),
      topRightWidget: WidgetTextRow(
        widget: SizedBox(
          width: 20,
          child: Icon(
            _eventFollowableVariables!.isFollowed
                ? Ionicons.heart
                : Ionicons.heart_outline,
            size: 19,
            color: _eventFollowableVariables!.isFollowed
                ? MyColors.accent
                : MyColors.forInactiveStuff,
          ),
        ),
        isTextAccentColor: _eventFollowableVariables!.isFollowed,
        text: _eventFollowableVariables!.overallFollowers.toString(),
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
        text: FormattingUtils.resolveTicketsPrice(widget._event.ticketPrices),
      ),
      verticalPaddingOfContent: 20,
    );
  }
}
