// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketPrice _$_$_TicketPriceFromJson(Map<String, dynamic> json) {
  return _$_TicketPrice(
    id: json['id'] as int,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
    currency: _$enumDecode(_$MoneyCurrencyEnumMap, json['currency']),
  );
}

Map<String, dynamic> _$_$_TicketPriceToJson(_$_TicketPrice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'currency': _$MoneyCurrencyEnumMap[instance.currency],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$MoneyCurrencyEnumMap = {
  MoneyCurrency.RUB: 'RUB',
  MoneyCurrency.EUR: 'EUR',
  MoneyCurrency.USD: 'USD',
};
