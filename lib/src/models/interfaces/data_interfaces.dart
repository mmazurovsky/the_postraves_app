import 'package:flutter/widgets.dart';
import '../dto/image_dimensions.dart';
import '../dto/wiki_data_dto.dart';
import '../enum/wiki_rating_type.dart';
import '../geo/country.dart';

abstract class BaseIdInterface {
  int get id;
}

abstract class BaseNameInterface {
  String get name;
}

abstract class LocationInterface {
  String get emojiCode;
  Country get country;
  String get localName;
  String get name;
}

abstract class EntityNamesInterface {
  String getEntityNameSingularFormString(BuildContext context);
  String getEntityNamePluralFormString(BuildContext context);
}

abstract class FollowableInterfaceWithType
    implements BaseIdInterface, BaseNameInterface {
  String? get imageLink;
  Country? get country;
  WikiFollowableType get type;
}

abstract class GeneralFollowableInterface
    implements
        BaseIdInterface,
        BaseNameInterface,
        EntityNamesInterface,
        ConvertableToWikiDataDtoInterface {
  String? get imageLink;
  Country? get country;
  int get overallFollowers;
  int get weeklyFollowers;
  bool get isFollowed;
  Map<String, dynamic> toJson();
}

abstract class ConvertableToWikiDataDtoInterface {
  WikiDataDto convertToWikiDataDto(ImageDimensions? imageDimensions);
}
