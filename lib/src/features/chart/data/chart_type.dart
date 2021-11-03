import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';


enum ChartType { weekly, overall }

extension ChartTypeExtension on ChartType {
  static _chartTypeTitleMapping(BuildContext context, ChartType thisType) => {
        ChartType.weekly: 'chartOfTheWeekTitle'.tr(),
        ChartType.overall: 'chartOverallTitle'.tr(),
      }[thisType];

  static _chartTypeShowWeeklyFollowersMapping(ChartType thisType) => {
        ChartType.weekly: true,
        ChartType.overall: false,
      }[thisType];

  String getChartTitle(BuildContext ctx) => _chartTypeTitleMapping(ctx, this);
  bool get getChartShowWeeklyFollowers => _chartTypeShowWeeklyFollowersMapping(this);
}
