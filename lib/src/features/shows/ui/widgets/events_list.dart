import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:the_postraves_app/src/common/constants/my_text_styles.dart';
import 'package:the_postraves_app/src/common/utils/formatting_utils.dart';
import 'package:the_postraves_app/src/common/widgets/spacers/my_horizontal_padding.dart';
import 'package:the_postraves_app/src/features/shows/state/date_filter_change_notifier.dart';
import 'package:the_postraves_app/src/features/shows/ui/widgets/shows_date_filter_selector.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../common/constants/my_constants.dart';

import 'empty_shows_placeholder.dart';
import 'event_card.dart';

class UnfilteredEventsList extends StatelessWidget {
  final List<EventShort> events;
  final void Function() onRefresh;
  final RefreshController refreshController;

  const UnfilteredEventsList({
    Key? key,
    required this.events,
    required this.onRefresh,
    required this.refreshController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      controller: refreshController,
      onRefresh: onRefresh,
      child: events.isNotEmpty
          ? ListView.separated(
            physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 15),
              itemCount: events.length,
              itemBuilder: (context, i) => EventCard(
                key: ValueKey(events[i].id),
                loadedEvent: events[i],
              ),
              separatorBuilder: (context, i) => const SizedBox(
                height: MyConstants.endingOfScreenOrSpaceBetweenElements,
              ),
            )
          : const SingleChildScrollView(
              child: EmptyShowsPlaceholder(isFiltered: false)),
    );
  }
}

class FilteredEventsList extends StatelessWidget {
  final List<EventShort> events;
  const FilteredEventsList(this.events, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startDate =
        context.read<DateTimeFilterChangeNotifier>().startDateTime!;
    final endDate = context.read<DateTimeFilterChangeNotifier>().endDateTime;
    return events.isNotEmpty
        ? ListView.separated(
            itemCount: events.isEmpty ? 0 : events.length + 1,
            separatorBuilder: (context, i) => const SizedBox(
                  height: MyConstants.endingOfScreenOrSpaceBetweenElements,
                ),
            itemBuilder: (context, i) {
              if (i == 0) {
                return MyHorizontalPadding(
                  child: InkWell(
                    onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => ShowsDateFilterSelector(),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'filtered'.tr(),
                            style: MyTextStyles.filtered,
                          ),
                          Text(
                            '${FormattingUtils.getFormattedDateWithoutWeekday(dateTime: startDate)}${endDate != null ? ' — ${FormattingUtils.getFormattedDateWithoutWeekday(dateTime: endDate)}' : ''}',
                            style: MyTextStyles.filtered,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                i -= 1;
                return EventCard(
                  key: ValueKey(events[i].id),
                  loadedEvent: events[i],
                );
              }
            })
        : const SingleChildScrollView(
            child: EmptyShowsPlaceholder(isFiltered: true),
          );
  }
}
