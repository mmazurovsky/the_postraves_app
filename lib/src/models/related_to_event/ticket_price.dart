import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/money_currency.dart';

part 'ticket_price.freezed.dart';
part 'ticket_price.g.dart';

@freezed
class TicketPrice with _$TicketPrice {

  const factory TicketPrice({
    required int id,
    required String name,
    required double price,
    required MoneyCurrency currency,
  }) = _TicketPrice;

  factory TicketPrice.fromJson(Map<String, dynamic> json) =>
      _$TicketPriceFromJson(json);
}
