import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ArtistPerformanceStatus { PERF_UPCOMING, PERF_LIVE, PERF_PAST }

extension ArtistPerformanceStatusExtension on ArtistPerformanceStatus {
  static _getArtistPerformanceStatusNameEnumMapping(BuildContext context, ArtistPerformanceStatus status) => {
    ArtistPerformanceStatus.PERF_UPCOMING: AppLocalizations.of(context)!.timetableStatusUpcoming,
    ArtistPerformanceStatus.PERF_LIVE: AppLocalizations.of(context)!.timetableStatusLive,
    ArtistPerformanceStatus.PERF_PAST: AppLocalizations.of(context)!.timetableStatusPast,
  }[status];

  String getArtistPerformanceStatusName(BuildContext context) =>
      _getArtistPerformanceStatusNameEnumMapping(context, this);
}
