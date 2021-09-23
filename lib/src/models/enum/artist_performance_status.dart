import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ArtistPerformanceStatus { UPCOMING, LIVE, PAST }

extension ArtistPerformanceStatusExtension on ArtistPerformanceStatus {
  static _getArtistPerformanceStatusNameEnumMapping(BuildContext context, ArtistPerformanceStatus status) => {
    ArtistPerformanceStatus.UPCOMING: AppLocalizations.of(context)!.timetableStatusUpcoming,
    ArtistPerformanceStatus.LIVE: AppLocalizations.of(context)!.timetableStatusLive,
    ArtistPerformanceStatus.PAST: AppLocalizations.of(context)!.timetableStatusPast,
  }[status];

  String getArtistPerformanceStatusName(BuildContext context) =>
      _getArtistPerformanceStatusNameEnumMapping(context, this);
}
