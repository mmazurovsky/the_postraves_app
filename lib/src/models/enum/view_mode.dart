import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ViewMode { SORT_BY_DATE, SORT_BY_RATING, SHOW_RECOMMENDED }

extension ViewModeExtension on ViewMode {
  static _getNameMapping(BuildContext context, ViewMode mode) {
    return {
      ViewMode.SORT_BY_DATE:
          AppLocalizations.of(context)!.sortModeSelectorByDate,
      ViewMode.SORT_BY_RATING:
          AppLocalizations.of(context)!.sortModeSelectorByPopularity,
      ViewMode.SHOW_RECOMMENDED:
          AppLocalizations.of(context)!.sortModeSelectorByRecommended,
    }[mode];
  }

  String getButtonTitle(BuildContext context) => _getNameMapping(context, this);
}
