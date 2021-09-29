import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/utils/my_constants.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'artist_short.freezed.dart';
part 'artist_short.g.dart';

@freezed
class ArtistShort
    with _$ArtistShort
    implements
        FollowableInterface,
        BaseNameInterface,
        EntityNamesInterface {

  const ArtistShort._();
  const factory ArtistShort({
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    String? imageLink,
    @Default(null) Country? country, //todo delete default
  }) = _ArtistShort;

  factory ArtistShort.fromJson(Map<String, dynamic> json) =>
      _$ArtistShortFromJson(json);

  @override
  String getEntityNameSingularFormString(BuildContext context) {
    return AppLocalizations.of(context)!.artistEntityNameSingular;
  }

  @override
  String getEntityNamePluralFormString(BuildContext context) {
    return AppLocalizations.of(context)!.artistEntityNamePlural;
  }
}
