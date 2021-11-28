import 'dart:math';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';
import 'package:sprintf/sprintf.dart';
import 'package:the_postraves_package/models/related_to_event/event_status.dart';
import 'package:the_postraves_package/models/related_to_event/money_currency.dart';
import 'package:the_postraves_package/models/related_to_event/ticket_price.dart';
import 'package:the_postraves_package/models/related_to_event/ticket_price_range.dart';
import '../constants/my_text_styles.dart';

class FormattingUtils {
  static getEventStatusNameTranslation(EventStatus status) => {
        EventStatus.UPCOMING: 'wikiEventStatusUpcoming'.tr(),
        EventStatus.PRESALE: 'wikiEventStatusPresale'.tr(),
        EventStatus.TOMORROW: 'wikiEventStatusTomorrow'.tr(),
        EventStatus.TODAY: 'wikiEventStatusToday'.tr(),
        EventStatus.LIVE: 'wikiEventStatusLive'.tr(),
        EventStatus.PAST: 'wikiEventStatusPast'.tr(),
        EventStatus.CANCELLED: 'wikiEventStatusCancelled'.tr(),
      }[status];

  static String resolveTextForWeeklyFollowers(int weeklyFollowers) {
    return weeklyFollowers > 0
        ? '+$weeklyFollowers'
        : weeklyFollowers.toString();
  }

  static TextStyle resolveTextStyleForWeeklyFollowers(int weeklyFollowers) {
    if (weeklyFollowers > 0) {
      return MyTextStyles.shortEntityPositiveWeeklyRating;
    } else if (weeklyFollowers < 0) {
      return MyTextStyles.shortEntityNegativeWeeklyRating;
    } else {
      return MyTextStyles.shortEntityOverallRating;
    }
  }

  static String getWeekdayName(
      {required int weekdayNumber, required bool isShortened}) {
    if (weekdayNumber < 1 || weekdayNumber > 7) {
      // TODO Exception
      return '';
    }
    if (weekdayNumber == 1) {
      if (isShortened) {
        return 'weekdayMondayShort'.tr();
      } else {
        return 'weekdayMondayLong'.tr();
      }
    } else if (weekdayNumber == 2) {
      if (isShortened) {
        return 'weekdayTuesdayShort'.tr();
      } else {
        return 'weekdayTuesdayLong'.tr();
      }
    } else if (weekdayNumber == 3) {
      if (isShortened) {
        return 'weekdayWednesdayShort'.tr();
      } else {
        return 'weekdayWednesdayLong'.tr();
      }
    } else if (weekdayNumber == 4) {
      if (isShortened) {
        return 'weekdayThursdayShort'.tr();
      } else {
        return 'weekdayThursdayLong'.tr();
      }
    } else if (weekdayNumber == 5) {
      if (isShortened) {
        return 'weekdayFridayShort'.tr();
      } else {
        return 'weekdayFridayLong'.tr();
      }
    } else if (weekdayNumber == 6) {
      if (isShortened) {
        return 'weekdaySaturdayShort'.tr();
      } else {
        return 'weekdaySaturdayLong'.tr();
      }
    } else {
      if (isShortened) {
        return 'weekdaySundayShort'.tr();
      } else {
        return 'weekdaySundayLong'.tr();
      }
    }
  }

  static String getMonthName({required int month}) {
    if (month < 1 || month > 12) {
      return ''; // TODO Exception
    }
    if (month == 1) {
      return 'monthJanuaryLong'.tr();
    } else if (month == 2) {
      return 'monthFebruaryLong'.tr();
    } else if (month == 3) {
      return 'monthMarchLong'.tr();
    } else if (month == 4) {
      return 'monthAprilLong'.tr();
    } else if (month == 5) {
      return 'monthMayLong'.tr();
    } else if (month == 6) {
      return 'monthJuneLong'.tr();
    } else if (month == 7) {
      return 'monthJulyLong'.tr();
    } else if (month == 8) {
      return 'monthAugustLong'.tr();
    } else if (month == 9) {
      return 'monthSeptemberLong'.tr();
    } else if (month == 10) {
      return 'monthOctoberLong'.tr();
    } else if (month == 11) {
      return 'monthNovemberLong'.tr();
    } else {
      return 'monthDecemberLong'.tr();
    }
  }

  static TicketPriceRange getTicketPriceRangeForTickets(
      List<TicketPrice> ticketPrices) {
    if (ticketPrices.length > 1) {
      MoneyCurrency moneyCurrency = ticketPrices.first.currency;
      List<double> prices = [];
      for (var ticket in ticketPrices) {
        prices.add(ticket.price);
      }
      TicketPriceRange ticketPriceRange = TicketPriceRange(
        minPrice: prices.reduce(min),
        maxPrice: prices.reduce(max),
        currency: moneyCurrency,
      );
      return ticketPriceRange;
    } else {
      TicketPriceRange ticketPriceRange = TicketPriceRange(
        minPrice: ticketPrices.first.price,
        maxPrice: null,
        currency: ticketPrices.first.currency,
      );
      return ticketPriceRange;
    }
  }

  static String resolveTicketsPrice(List<TicketPrice>? ticketPrices) {
    if (ticketPrices == null || ticketPrices.isEmpty) {
      return 'priceUnknown'.tr();
    }
    final priceRangeOfTickets = getTicketPriceRangeForTickets(ticketPrices);
    if (priceRangeOfTickets.maxPrice == null) {
      if (priceRangeOfTickets.minPrice == 0.0) {
        return 'priceFree'.tr();
      } else {
        return sprintf(
          '%s%s',
          [
            priceRangeOfTickets.minPrice.ceil(),
            priceRangeOfTickets.currency.symbol,
          ],
        );
      }
    } else {
      return sprintf(
        '${'from'.tr()} %s%s',
        [
          priceRangeOfTickets.minPrice.ceil(),
          priceRangeOfTickets.currency.symbol,
        ],
      );
    }
  }

  static String getFormattedDateShort({required DateTime dateTime}) {
    return sprintf('%s — %02i.%02i', [
      getWeekdayName(
        weekdayNumber: dateTime.weekday,
        isShortened: true,
      ),
      dateTime.day,
      dateTime.month,
    ]);
  }

  static String getMonthAndYear(DateTime dateTime) {
    return sprintf('%s — %i', [
      getMonthName(month: dateTime.month).toUpperCase(),
      dateTime.year,
    ]);
  }

  TicketPriceRange? getPriceRangeOfTickets(List<TicketPrice>? ticketPrices) {
    return ticketPrices?.isEmpty == null || ticketPrices?.isEmpty == true
        ? null
        : FormattingUtils.getTicketPriceRangeForTickets(ticketPrices!);
  }

  static String getFormattedDateLong({required DateTime dateTime}) {
    return sprintf('%02i %s — %s', [
      dateTime.day,
      getMonthName(month: dateTime.month).toUpperCase(),
      getWeekdayName(
        weekdayNumber: dateTime.weekday,
        isShortened: false,
      ).toUpperCase(),
    ]);
  }

  static String getFormattedTime(DateTime dateTime) {
    return sprintf('%02i:%02i', [
      dateTime.hour,
      dateTime.minute,
    ]);
  }

  static String getFormattedDateAndTime({required DateTime dateTime}) {
    return getFormattedDateShort(dateTime: dateTime) +
        ' ' +
        getFormattedTime(dateTime);
  }
}
