import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/data/view_mode.dart';
import 'package:the_postraves_app/src/common/utils/formatting_utils.dart';
import 'package:the_postraves_app/src/common/widgets/buttons/my_elevated_button.dart';
import 'package:the_postraves_app/src/common/widgets/buttons/my_elevated_button_without_padding.dart';
import 'package:the_postraves_app/src/common/widgets/buttons/my_outlined_button_without_padding.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/selectors/modal_bottom_sheet_content.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';
import '../../state/view_switcher_cubit/view_switcher_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class SortModeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewSwitcherCubit, ViewSwitcherState>(
        builder: (context, state) {
      return ModalBottomSheetContent(
        height: MyConstants.heightOfSortModeSelectorModalBottomSheet,
        iconData: Ionicons.calendar_clear_outline,
        title: 'sortModeSelectorTitle'.tr(),
        content: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: MyHorizontalMargin(
            child: Column(
              children: [
                MyCalendar(),
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyOutlinedButtonWithoutPadding(
                      width: 180,
                      mainAxisAlignment: MainAxisAlignment.center,
                      text: 'dropFilter'.tr(),
                      onTap: Navigator.of(context).pop,
                      borderColor: MyColors.main,
                      textStyle: MyTextStyles.closeModalBottomSheet,
                    ),
                    SizedBox(width: 15),
                    MyOutlinedButtonWithoutPadding(
                      width: 180,
                      mainAxisAlignment: MainAxisAlignment.center,
                      text: 'applyFilter'.tr(),
                      onTap: Navigator.of(context).pop,
                      borderColor: MyColors.accent,
                      textStyle: MyTextStyles.closeModalBottomSheet,
                    ),
                  ],
                ),
              ],
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SortMode(
            //       icon: Ionicons.calendar_clear_outline,
            //       viewMode: ViewMode.SORT_BY_DATE,
            //       isSelected: state is ByDateViewState,
            //     ),
            //     SortMode(
            //       icon: Ionicons.heart_outline,
            //       viewMode: ViewMode.SORT_BY_RATING,
            //       isSelected: state is ByRatingViewState,
            //     ),
            //   ],
            // ),
          ),
        ),
      );
    });
  }
}

class MyCalendar extends StatefulWidget {
  MyCalendar({Key? key}) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime? startRange;
  DateTime? endRange;
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: CalendarFormat.twoWeeks,
      rangeStartDay: startRange,
      rangeEndDay: endRange,
      // onDaySelected: (selected, _) {
      //   print(selected);
      // },
      rangeSelectionMode: RangeSelectionMode.enforced,
      onRangeSelected: (startRange, endRange, ___) {
        setState(() {
          this.startRange = startRange;
          this.endRange = endRange;
        });
      },
      firstDay: today,
      focusedDay: endRange ?? startRange ?? today,
      lastDay: today.add(
        const Duration(days: 120),
      ),
      currentDay: today,
      headerStyle: HeaderStyle(
        headerPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        leftChevronVisible: false,
        rightChevronVisible: false,
        formatButtonVisible: false,
        titleTextFormatter: (datetime, _) =>
            FormattingUtils.getMonthAndYear(datetime),
        titleTextStyle: MyTextStyles.bodyWithInactiveColor,
      ),
      daysOfWeekHeight: 50,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: MyTextStyles.bodyWithInactiveColor,
        weekendStyle: MyTextStyles.bodyWithInactiveColor,
      ),
      calendarStyle: CalendarStyle(
        todayTextStyle: MyTextStyles.bodyFat,
        disabledTextStyle:
            MyTextStyles.body.copyWith(color: Colors.grey.shade800),
        outsideTextStyle: MyTextStyles.bodyFat,
        defaultTextStyle: MyTextStyles.body,
        holidayTextStyle: MyTextStyles.body,
        weekendTextStyle: MyTextStyles.body,
        rangeStartTextStyle: MyTextStyles.bodyWithAccentColor,
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        markerDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        holidayDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        disabledDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        withinRangeDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        rangeStartDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: MyColors.accent,
            width: 1,
          ),
        ),
        rangeEndDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: MyColors.accent,
            width: 1,
          ),
        ),
        rangeHighlightColor: Colors.transparent,
        rangeEndTextStyle: MyTextStyles.bodyWithAccentColor,
        withinRangeTextStyle: MyTextStyles.bodyWithAccentColor,
        // markerDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(5),
        //   border: Border.all(
        //     color: MyColors.accent,
        //     width: 1,
        //   ),
        // ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: MyColors.main,
            width: 1,
          ),
        ),
      ),
      locale: 'ru',
      startingDayOfWeek: StartingDayOfWeek.monday,
    );
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
              viewMode.buttonTitle,
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
