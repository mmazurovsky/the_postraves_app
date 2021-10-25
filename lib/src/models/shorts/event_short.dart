import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/utils/date_time_converter.dart';
import '../dto/image_dimensions.dart';
import '../dto/wiki_data_dto.dart';
import '../enum/wiki_rating_type.dart';
import '../../core/utils/formatting_utils.dart';
import '../../core/utils/my_constants.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';
import '../related_to_event/ticket_price.dart';
import '../related_to_event/ticket_price_range.dart';
import '../enum/event_status.dart';
import 'place_short.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'event_short.freezed.dart';
part 'event_short.g.dart';

@freezed
class EventShort
    with _$EventShort
    implements GeneralFollowableInterface, EntityNamesInterface {
  const EventShort._();
  const factory EventShort({
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    required EventStatus status,
    @DateTimeConverter() required DateTime startDateTime,
    required PlaceShort place,
    required List<TicketPrice>? ticketPrices,
    String? imageLink,
  }) = _EventShort;

  factory EventShort.fromJson(Map<String, dynamic> json) =>
      _$EventShortFromJson(json);

  // @DateTimeConverter()
  // final DateTime startDateTime;

  @override
  Country? get country {
    return place.city.country;
  }

  TicketPriceRange? get priceRangeOfTickets {
    return ticketPrices?.isEmpty == null || ticketPrices?.isEmpty == true
        ? null
        : FormattingUtils.getTicketPriceRangeForTickets(ticketPrices!);
  }

  @override
  String getEntityNameSingularFormString(BuildContext context) {
    return AppLocalizations.of(context)!.eventEntityNameSingular;
  }

  @override
  String getEntityNamePluralFormString(BuildContext context) {
    return AppLocalizations.of(context)!.eventEntityNamePlural;
  }

  @override
  WikiDataDto convertToWikiDataDto(ImageDimensions? imageDimensions) {
    return WikiDataDto(
      id: id,
      name: name,
      imageLink: imageLink,
      country: country,
      imageDimensions: imageDimensions,
      type: WikiFollowableType.EVENT,
    );
  }
}
