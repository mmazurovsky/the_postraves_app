import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/utils/screen_size.dart';

import '../../../../core/presentation/widgets/modal_bottom_sheet_content.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../models/enum/view_mode.dart';
import '../../state/view_switcher_cubit/view_switcher_cubit_cubit.dart';

class SortModeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewSwitcherCubit, ViewSwitcherState>(
        builder: (context, state) {
      return ModalBottomSheetContent(
        height: MyConstants.heightOfSortModeSelectorModalBottomSheet,
        iconData: Ionicons.easel_outline,
        title: AppLocalizations.of(context)!.sortModeSelectorTitle,
        content: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: MyHorizontalMargin(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SortMode(
                  icon: Ionicons.calendar_clear_outline,
                  viewMode: ViewMode.SORT_BY_DATE,
                  isSelected: state is ByDateViewState,
                ),
                SortMode(
                  icon: Ionicons.heart_outline,
                  viewMode: ViewMode.SORT_BY_RATING,
                  isSelected: state is ByRatingViewState,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SortMode extends StatelessWidget {
  final IconData icon;
  final ViewMode viewMode;
  final bool isSelected;
  const SortMode({
    Key? key,
    required this.icon,
    required this.viewMode,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected
          ? () => {}
          : () {
              if (viewMode == ViewMode.SORT_BY_RATING) {
                BlocProvider.of<ViewSwitcherCubit>(context).showByRatingView();
              } else {
                BlocProvider.of<ViewSwitcherCubit>(context).showByDateView();
              }
              Navigator.of(context).pop();
            },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(15),
        width: ScreenSize.width / 2 - MyConstants.horizontalPaddingOrMargin * 2,
        decoration: BoxDecoration(
          color: isSelected ? MyColors.forEventCard : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: MyColors.accent, width: 1.2)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? MyColors.accent : MyColors.main,
              size: 25,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              viewMode.getButtonTitle(context),
              style: isSelected
                  ? MyTextStyles.smallerBodyWithAccentColor
                  : MyTextStyles.smallerBodyWithMainColor,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
