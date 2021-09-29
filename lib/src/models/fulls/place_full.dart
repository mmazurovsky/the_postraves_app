import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
        FollowableInterface,
        EntityNamesInterface {

  const PlaceFull._();
  const factory PlaceFull({
    String? about,
    String? instagramLink,
    String? soundcloudLink,
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
}
