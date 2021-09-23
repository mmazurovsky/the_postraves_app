import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
        FollowableInterface,
        EntityNamesInterface,
        EntityEndpointInterface {

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
  String getEntityEndpoint() {
    return MyConstants.placesEndpoint;
  }

  @override
  Country? get country => this.country;
}
