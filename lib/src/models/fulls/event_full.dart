import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/core/utils/date_time_converter.dart';
import '../../core/utils/formatting_utils.dart';
import '../../core/utils/my_constants.dart';
import '../enum/event_status.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';
import '../related_to_event/ticket_price.dart';
import '../related_to_event/ticket_price_range.dart';
import '../shorts/place_short.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


part 'event_full.freezed.dart';
part 'event_full.g.dart';

@freezed
class EventFull
    with _$EventFull
    implements
        FollowableInterface,
        EntityNamesInterface {
  // @DateTimeConverter()
  const EventFull._();
  const factory EventFull({
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    required EventStatus status,
    @DateTimeConverter()
    required DateTime startDateTime,
    @DateTimeConverter()
    required DateTime endDateTime,
    required PlaceShort place,
    String? imageLink,
    String? about,
    String? ticketsLink,
    List<TicketPrice>? ticketPrices,
  }) = _EventFull;

  factory EventFull.fromJson(Map<String, dynamic> json) =>
      _$EventFullFromJson(json);

  TicketPriceRange? get priceRangeOfTickets {
    return ticketPrices == null ? null : FormattingUtils.getTicketPriceRangeForTickets(ticketPrices!);
  }

  // List<TimetableForSceneDto> getTimetableForSceneDtoList() {
  //   return timetable
  //       .map((timetableForScene) =>
  //           TimetableForSceneDto.fromModel(timetableForScene))
  //       .toList();
  // }

  @override
  String getEntityNameSingularFormString(BuildContext context) {
    return AppLocalizations.of(context)!.eventEntityNameSingular;
  }

  @override
  String getEntityNamePluralFormString(BuildContext context) {
    return AppLocalizations.of(context)!.eventEntityNamePlural;
  }

  @override
  Country? get country => country;
}
