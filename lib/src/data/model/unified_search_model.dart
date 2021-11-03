import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/models/geo/country.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

part 'unified_search_model.freezed.dart';
part 'unified_search_model.g.dart';

@freezed
class UnifiedSearchModel
    with _$UnifiedSearchModel
    implements FollowableInterfaceWithType {
  const UnifiedSearchModel._();
  const factory UnifiedSearchModel({
    required FollowableData followableData,
    required DateTime updatedDateTime,
  }) = _UnifiedSearchModel;

  factory UnifiedSearchModel.fromJson(Map<String, dynamic> json) =>
      _$UnifiedSearchModelFromJson(json);

  @override
  Country? get country => followableData.country;

  @override
  int get id => followableData.id;

  @override
  String? get imageLink => followableData.imageLink;

  @override
  String get name => followableData.name;

  @override
  FollowableType get type => followableData.type;
}
