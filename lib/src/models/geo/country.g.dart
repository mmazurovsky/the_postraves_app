// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$_$_CountryFromJson(Map<String, dynamic> json) {
  return _$_Country(
    name: json['name'] as String,
    localName: json['localName'] as String,
    phoneCode: json['phoneCode'] as String?,
    emojiCode: json['emojiCode'] as String,
  );
}

Map<String, dynamic> _$_$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'name': instance.name,
      'localName': instance.localName,
      'phoneCode': instance.phoneCode,
      'emojiCode': instance.emojiCode,
    };
