import 'package:freezed_annotation/freezed_annotation.dart';
import '../dto/wiki_data_dto.dart';
import '../geo/country.dart';
import '../enum/wiki_rating_type.dart';
import '../interfaces/data_interfaces.dart';

part 'unified_search_model.freezed.dart';
part 'unified_search_model.g.dart';

@freezed
class UnifiedSearchModel
    with _$UnifiedSearchModel
    implements FollowableInterfaceWithType {
  const UnifiedSearchModel._();
  const factory UnifiedSearchModel({
    required WikiDataDto wikiDataDto,
    required DateTime updatedDateTime,
  }) = _UnifiedSearchModel;

  factory UnifiedSearchModel.fromJson(Map<String, dynamic> json) =>
      _$UnifiedSearchModelFromJson(json);

  @override
  Country? get country => wikiDataDto.country;

  @override
  int get id => wikiDataDto.id;

  @override
  String? get imageLink => wikiDataDto.imageLink;

  @override
  String get name => wikiDataDto.name;

  @override
  WikiFollowableType get type => wikiDataDto.type;
}
