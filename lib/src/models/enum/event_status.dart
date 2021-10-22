import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

enum EventStatus { UPCOMING, PRESALE, TOMORROW, TODAY, LIVE, PAST, CANCELLED }

extension EventStatusExtension on EventStatus {
  static _getEventStatusNameMapping(BuildContext context, EventStatus status) =>
      {
        EventStatus.UPCOMING:
            AppLocalizations.of(context)!.wikiEventStatusUpcoming,
        EventStatus.PRESALE:
            AppLocalizations.of(context)!.wikiEventStatusPresale,
        EventStatus.TOMORROW:
            AppLocalizations.of(context)!.wikiEventStatusTomorrow,
        EventStatus.TODAY: AppLocalizations.of(context)!.wikiEventStatusToday,
        EventStatus.LIVE: AppLocalizations.of(context)!.wikiEventStatusLive,
        EventStatus.PAST: AppLocalizations.of(context)!.wikiEventStatusPast,
        // TODO:
        EventStatus.CANCELLED: "TODO",
      }[status];

  String getStatusName(BuildContext context) =>
      _getEventStatusNameMapping(context, this);
}
