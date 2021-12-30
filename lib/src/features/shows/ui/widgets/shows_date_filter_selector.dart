import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ionicons/ionicons.dart';
import '../../../../common/data/view_mode.dart';
import '../../../../common/utils/formatting_utils.dart';
import '../../../../common/widgets/buttons/my_outlined_button_without_padding.dart';
import '../../state/date_filter_change_notifier.dart';
import '../../state/shows_cubit/shows_cubit.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/selectors/modal_bottom_sheet_content.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';
import '../../state/view_switcher_cubit/view_switcher_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class ShowsDateFilterSelector extends StatelessWidget {
  const ShowsDateFilterSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filterText = context.read<DateTimeFilterChangeNotifier>().isFiltered
        ? 'filterNew'
        : 'filter';
    return ModalBottomSheetContent(
      height: MyConstants.heightOfFilterByDateSelectorModalBottomSheet,
      iconData: Ionicons.calendar_clear_outline,
      title: 'showsFilterByDate'.tr(),
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: MyHorizontalMargin(
          child: Column(
            children: [
              const MyCalendar(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (context.read<DateTimeFilterChangeNotifier>().isFiltered)
                    Expanded(
                      child: MyOutlinedButtonWithoutPadding(
                        mainAxisAlignment: MainAxisAlignment.center,
                        text: 'drop'.tr(),
                        onTap: () {
                          context.read<ShowsCubit>().dropFilter();
                          Navigator.of(context).pop();
                        },
                        borderColor: MyColors.main,
                        textStyle: MyTextStyles.closeModalBottomSheet,
                      ),
                    ),
                  if (context.read<DateTimeFilterChangeNotifier>().isFiltered)
                    const SizedBox(width: 15),
                  Expanded(
                    child: MyOutlinedButtonWithoutPadding(
                      mainAxisAlignment: MainAxisAlignment.center,
                      text: filterText.tr(),
                      onTap: () {
                        if (context
                                .read<DateTimeFilterChangeNotifier>()
                                .startDateTime !=
                            null) {
                          context.read<ShowsCubit>().loadFilteredShows();
                          Navigator.of(context).pop();
                        }
                      },
                      borderColor: context
                                  .watch<DateTimeFilterChangeNotifier>()
                                  .startDateTime ==
                              null
                          ? MyColors.forInactiveStuff
                          : MyColors.accent,
                      textStyle: context
                                  .watch<DateTimeFilterChangeNotifier>()
                                  .startDateTime ==
                              null
                          ? MyTextStyles.closeModalBottomSheetInactive
                          : MyTextStyles.closeModalBottomSheet,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: context.locale.languageCode,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: CalendarFormat.twoWeeks,
      rangeStartDay:
          context.watch<DateTimeFilterChangeNotifier>().startDateTime,
      rangeEndDay: context.watch<DateTimeFilterChangeNotifier>().endDateTime,
      rangeSelectionMode: RangeSelectionMode.enforced,
      onRangeSelected: (startRange, endRange, ___) {
        context.read<DateTimeFilterChangeNotifier>().startDateTime = startRange;
        context.read<DateTimeFilterChangeNotifier>().endDateTime = endRange;
      },
      firstDay: today,
      focusedDay: context.read<DateTimeFilterChangeNotifier>().endDateTime ??
          context.read<DateTimeFilterChangeNotifier>().startDateTime ??
          today,
      lastDay: today.add(
        const Duration(days: 120),
      ),
      currentDay: today,
      headerStyle: HeaderStyle(
        headerPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        leftChevronVisible: false,
        rightChevronVisible: false,
        formatButtonVisible: false,
        titleTextFormatter: (datetime, _) =>
            FormattingUtils.getMonthAndYear(datetime),
        titleTextStyle: MyTextStyles.bodyWithInactiveColor,
      ),
      daysOfWeekHeight: 50,
      daysOfWeekStyle: const DaysOfWeekStyle(
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
            const SizedBox(
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
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
