import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/utils/my_constants.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'unity_full.freezed.dart';
part 'unity_full.g.dart';

@freezed
class UnityFull with _$UnityFull
    implements
        FollowableInterface,
        EntityNamesInterface,
        EntityEndpointInterface {

  const UnityFull._();
  const factory UnityFull({
    String? about,
    String? instagramLink,
    String? soundcloudLink,
    String? bandcampLink,
    required int id,
    required String name,
    required int overallFollowers,
    required int weeklyFollowers,
    required bool isFollowed,
    String? imageLink,
    Country? country,
  }) = _UnityFull;

  factory UnityFull.fromJson(Map<String, dynamic> json) => _$UnityFullFromJson(json);

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
