import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../dto/image_dimensions.dart';
import '../dto/wiki_data_dto.dart';
import '../enum/wiki_rating_type.dart';
import '../../core/utils/my_constants.dart';
import '../geo/city.dart';
import '../geo/coordinate.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';

part 'place_short.freezed.dart';
part 'place_short.g.dart';

@freezed
class PlaceShort
    with _$PlaceShort
    implements
        GeneralFollowableInterface,
        EntityNamesInterface {

  const PlaceShort._();
  const factory PlaceShort({
    required City city,
    required String streetAddress,
    required Coordinate coordinate,
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    String? imageLink,
  }) = _PlaceShort;

  factory PlaceShort.fromJson(Map<String, dynamic> json) =>
      _$PlaceShortFromJson(json);

  @override
  String getEntityNameSingularFormString(BuildContext context) {
    return AppLocalizations.of(context)!.placeEntityNameSingular;
  }

  @override
  String getEntityNamePluralFormString(BuildContext context) {
    return AppLocalizations.of(context)!.placeEntityNamePlural;
  }

  @override
  Country? get country => city.country;

    @override
  WikiDataDto convertToWikiDataDto(ImageDimensions? imageDimensions) {
    return WikiDataDto(
      id: id,
      name: name,
      imageLink: imageLink,
      country: country,
      imageDimensions: imageDimensions,
      type: WikiFollowableType.PLACE,
    );
  }
}
