import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/money_currency.dart';


part 'ticket_price_range.freezed.dart';

@freezed
class TicketPriceRange with _$TicketPriceRange {

  factory TicketPriceRange({
    required double minPrice,
    required double? maxPrice,
    required MoneyCurrency currency,
  }) = _TicketPriceRange;
}
