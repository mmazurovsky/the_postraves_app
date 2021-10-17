import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


enum ChartType { weekly, overall }

extension ChartTypeExtension on ChartType {
  static _chartTypeTitleMapping(BuildContext context, ChartType thisType) => {
        ChartType.weekly: AppLocalizations.of(context)!.chartOfTheWeekTitle,
        ChartType.overall: AppLocalizations.of(context)!.chartOverallTitle,
      }[thisType];

  static _chartTypeShowWeeklyFollowersMapping(ChartType thisType) => {
        ChartType.weekly: true,
        ChartType.overall: false,
      }[thisType];

  String getChartTitle(BuildContext ctx) => _chartTypeTitleMapping(ctx, this);
  bool get getChartShowWeeklyFollowers => _chartTypeShowWeeklyFollowersMapping(this);
}
