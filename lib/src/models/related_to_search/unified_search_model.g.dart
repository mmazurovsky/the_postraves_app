// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unified_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifiedSearchModel _$_$_UnifiedSearchModelFromJson(
    Map<String, dynamic> json) {
  return _$_UnifiedSearchModel(
    wikiDataDto:
        WikiDataDto.fromJson(json['wikiDataDto'] as Map<String, dynamic>),
    updatedDateTime: DateTime.parse(json['updatedDateTime'] as String),
  );
}

Map<String, dynamic> _$_$_UnifiedSearchModelToJson(
        _$_UnifiedSearchModel instance) =>
    <String, dynamic>{
      'wikiDataDto': instance.wikiDataDto.toJson(),
      'updatedDateTime': instance.updatedDateTime.toIso8601String(),
    };
