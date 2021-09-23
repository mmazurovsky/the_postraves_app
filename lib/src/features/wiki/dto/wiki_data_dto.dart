import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/enum/wiki_rating_type.dart';
import '../../../models/geo/country.dart';
import '../../../models/interfaces/data_interfaces.dart';

part 'wiki_data_dto.freezed.dart';

@freezed
class WikiDataDto with _$WikiDataDto implements SimpleFollowableInterface {
  const factory WikiDataDto(
      {required String name,
      required String? imageLink,
      Country? country,
      required int? overallFollowers,
      required int id,
      required WikiFollowableType type}) = _WikiDataDto;
}
