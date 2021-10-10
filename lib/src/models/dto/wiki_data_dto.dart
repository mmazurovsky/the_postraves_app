import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/models/dto/image_dimensions.dart';
import 'package:the_postraves_app/src/models/enum/wiki_rating_type.dart';
import 'package:the_postraves_app/src/models/geo/country.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';

part 'wiki_data_dto.freezed.dart';
part 'wiki_data_dto.g.dart';

@freezed
class WikiDataDto with _$WikiDataDto implements FollowableInterfaceWithType {
  const WikiDataDto._();
  const factory WikiDataDto(
      {required String name,
      required String? imageLink,
      @Default(null) ImageDimensions? imageDimensions,
      @Default(null) Country? country,
      required int id,
      required WikiFollowableType type}) = _WikiDataDto;

  factory WikiDataDto.fromJson(Map<String, dynamic> json) =>
      _$WikiDataDtoFromJson(json);
}
