import 'package:easy_localization/src/public_ext.dart';

enum ViewMode { SORT_BY_DATE, SORT_BY_RATING, SHOW_RECOMMENDED }

extension ViewModeExtension on ViewMode {
  static _getNameMapping(ViewMode mode) {
    return {
      ViewMode.SORT_BY_DATE:
          'sortModeSelectorByDate'.tr(),
      ViewMode.SORT_BY_RATING:
          'sortModeSelectorByPopularity'.tr(),
      ViewMode.SHOW_RECOMMENDED:
          'sortModeSelectorByRecommended'.tr(),
    }[mode];
  }

  String get buttonTitle => _getNameMapping(this);
}
