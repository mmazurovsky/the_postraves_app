import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/utils/my_constants.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';

part 'unity_short.freezed.dart';
part 'unity_short.g.dart';

@freezed
class UnityShort
    with _$UnityShort
    implements
        FollowableInterface,
        EntityNamesInterface,
        EntityEndpointInterface {

  const UnityShort._();
  const factory UnityShort({
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    String? imageLink,
    @Default(null)
    Country? country, //todo delete default
  }) = _UnityShort;

  factory UnityShort.fromJson(Map<String, dynamic> json) =>
      _$UnityShortFromJson(json);

  @override
  String getEntityNameSingularFormString(BuildContext context) {
    return AppLocalizations.of(context)!.unityEntityNameSingular;
  }

  @override
  String getEntityNamePluralFormString(BuildContext context) {
    return AppLocalizations.of(context)!.unityEntityNamePlural;
  }

  @override
  String getEntityEndpoint() {
    return MyConstants.unitiesEndpoint;
  }
}
