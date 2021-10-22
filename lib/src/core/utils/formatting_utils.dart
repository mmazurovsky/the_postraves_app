import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:the_postraves_app/src/core/utils/my_text_styles.dart';
import '../../models/enum/money_currency.dart';
import '../../models/related_to_event/ticket_price.dart';
import '../../models/related_to_event/ticket_price_range.dart';

import 'package:sprintf/sprintf.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormattingUtils {
  FormattingUtils();

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
      {required BuildContext context,
      required int weekdayNumber,
      required bool isShortened}) {
    if (weekdayNumber < 1 || weekdayNumber > 7) {
      // TODO Exception
      return '';
    }
    if (weekdayNumber == 1) {
      if (isShortened) {
        return AppLocalizations.of(context)!.weekdayMondayShort;
      } else {
        return AppLocalizations.of(context)!.weekdayMondayLong;
      }
    } else if (weekdayNumber == 2) {
      if (isShortened) {
        return AppLocalizations.of(context)!.weekdayTuesdayShort;
      } else {
        return AppLocalizations.of(context)!.weekdayTuesdayLong;
      }
    } else if (weekdayNumber == 3) {
      if (isShortened) {
        return AppLocalizations.of(context)!.weekdayWednesdayShort;
      } else {
        return AppLocalizations.of(context)!.weekdayWednesdayLong;
      }
    } else if (weekdayNumber == 4) {
      if (isShortened) {
        return AppLocalizations.of(context)!.weekdayThursdayShort;
      } else {
        return AppLocalizations.of(context)!.weekdayThursdayLong;
      }
    } else if (weekdayNumber == 5) {
      if (isShortened) {
        return AppLocalizations.of(context)!.weekdayFridayShort;
      } else {
        return AppLocalizations.of(context)!.weekdayFridayLong;
      }
    } else if (weekdayNumber == 6) {
      if (isShortened) {
        return AppLocalizations.of(context)!.weekdaySaturdayShort;
      } else {
        return AppLocalizations.of(context)!.weekdaySaturdayLong;
      }
    } else {
      if (isShortened) {
        return AppLocalizations.of(context)!.weekdaySundayShort;
      } else {
        return AppLocalizations.of(context)!.weekdaySundayLong;
      }
    }
  }

  static String getMonthName(
      {required BuildContext context, required int month}) {
    if (month < 1 || month > 12) {
      return ''; // TODO Exception
    }
    if (month == 1) {
      return AppLocalizations.of(context)!.monthJanuaryLong;
    } else if (month == 2) {
      return AppLocalizations.of(context)!.monthFebruaryLong;
    } else if (month == 3) {
      return AppLocalizations.of(context)!.monthMarchLong;
    } else if (month == 4) {
      return AppLocalizations.of(context)!.monthAprilLong;
    } else if (month == 5) {
      return AppLocalizations.of(context)!.monthMayLong;
    } else if (month == 6) {
      return AppLocalizations.of(context)!.monthJuneLong;
    } else if (month == 7) {
      return AppLocalizations.of(context)!.monthJulyLong;
    } else if (month == 8) {
      return AppLocalizations.of(context)!.monthAugustLong;
    } else if (month == 9) {
      return AppLocalizations.of(context)!.monthSeptemberLong;
    } else if (month == 10) {
      return AppLocalizations.of(context)!.monthOctoberLong;
    } else if (month == 11) {
      return AppLocalizations.of(context)!.monthNovemberLong;
    } else {
      return AppLocalizations.of(context)!.monthDecemberLong;
    }
  }

  // TODO: check without
  static TicketPriceRange getTicketPriceRangeForTickets(
      List<TicketPrice> tickets) {
    assert(tickets.isNotEmpty);
    if (tickets.length > 1) {
      MoneyCurrency moneyCurrency = tickets.first.currency;
      List<double> prices = [];
      for (var ticket in tickets) {
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
        minPrice: tickets.first.price,
        maxPrice: null,
        currency: tickets.first.currency,
      );
      return ticketPriceRange;
    }
  }

  static String resolveTicketsPrice(
      {required BuildContext context, TicketPriceRange? priceRangeOfTickets}) {
    if (priceRangeOfTickets == null) {
      return AppLocalizations.of(context)!.priceUnknown;
    } else if (priceRangeOfTickets.maxPrice == null) {
      if (priceRangeOfTickets.minPrice == 0.0) {
        return AppLocalizations.of(context)!.priceFree;
      } else {
        return sprintf(
          '%s%s',
          [
            priceRangeOfTickets.minPrice.ceil(),
            priceRangeOfTickets.currency.currencySymbol,
          ],
        );
      }
    } else {
      return sprintf(
        '${AppLocalizations.of(context)!.from} %s%s',
        [
          priceRangeOfTickets.minPrice.ceil(),
          priceRangeOfTickets.currency.currencySymbol,
        ],
      );
    }
  }

  static String getFormattedDateShort(
      {required BuildContext context, required DateTime dateTime}) {
    return sprintf('%s — %02i.%02i', [
      getWeekdayName(
        context: context,
        weekdayNumber: dateTime.weekday,
        isShortened: true,
      ),
      dateTime.day,
      dateTime.month,
    ]);
  }

  static String getFormattedDateLong(
      {required BuildContext context, required DateTime dateTime}) {
    return sprintf('%02i %s — %s', [
      dateTime.day,
      getMonthName(context: context, month: dateTime.month).toUpperCase(),
      getWeekdayName(
        context: context,
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

  static String getFormattedDateAndTime(
      {required BuildContext context, required DateTime dateTime}) {
    return getFormattedDateShort(context: context, dateTime: dateTime) +
        ' ' +
        getFormattedTime(dateTime);
  }
}
