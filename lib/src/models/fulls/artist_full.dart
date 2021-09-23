import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/core/utils/my_constants.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'artist_full.freezed.dart';
part 'artist_full.g.dart';

@freezed
class ArtistFull
    with _$ArtistFull
    implements
        FollowableInterface,
        EntityNamesInterface,
        EntityEndpointInterface {

  const ArtistFull._();
  const factory ArtistFull({
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    String? imageLink,
    Country? country,
    String? about,
    String? soundcloudLink,
    String? instagramLink,
  }) = _ArtistFull;

  factory ArtistFull.fromJson(Map<String, dynamic> json) =>
      _$ArtistFullFromJson(json);

  @override
  String getEntityNameSingularFormString(BuildContext context) {
    return AppLocalizations.of(context)!.artistEntityNameSingular;
  }

  @override
  String getEntityNamePluralFormString(BuildContext context) {
    return AppLocalizations.of(context)!.artistEntityNamePlural;
  }

  @override
  String getEntityEndpoint() {
    return MyConstants.artistsEndpoint;
  }
}
