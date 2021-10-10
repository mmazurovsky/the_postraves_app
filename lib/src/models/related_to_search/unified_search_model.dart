import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/models/dto/wiki_data_dto.dart';
import 'package:the_postraves_app/src/models/geo/country.dart';
import 'package:the_postraves_app/src/models/enum/wiki_rating_type.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';

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
