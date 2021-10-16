import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../dto/image_dimensions.dart';
import '../dto/wiki_data_dto.dart';
import '../enum/wiki_rating_type.dart';
import '../../core/utils/my_constants.dart';
import '../geo/city.dart';
import '../geo/coordinate.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'place_full.freezed.dart';
part 'place_full.g.dart';

@freezed
class PlaceFull
    with _$PlaceFull
    implements
        GeneralFollowableInterface,
        EntityNamesInterface {

  const PlaceFull._();
  const factory PlaceFull({
    String? about,
    String? instagramUsername,
    String? soundcloudUsername,
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    String? imageLink,
    required City city,
    required String streetAddress,
    required Coordinate coordinate,
  }) = _PlaceFull;

  factory PlaceFull.fromJson(Map<String, dynamic> json) =>
      _$PlaceFullFromJson(json);

  @override
  String getEntityNameSingularFormString(BuildContext context) {
    return AppLocalizations.of(context)!.placeEntityNameSingular;
  }

  @override
  String getEntityNamePluralFormString(BuildContext context) {
    return AppLocalizations.of(context)!.placeEntityNamePlural;
  }

  @override
  Country? get country => country;

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
