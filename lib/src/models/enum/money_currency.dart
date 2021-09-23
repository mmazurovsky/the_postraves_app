enum MoneyCurrency { RUB, EUR, USD }

extension MoneyCurrencyExtension on MoneyCurrency {
  
  static const currencySymbols = {
    MoneyCurrency.RUB: '₽',
    MoneyCurrency.EUR: '€',
    MoneyCurrency.USD: r'$',
  };

  String? get currencySymbol => currencySymbols[this];
}
