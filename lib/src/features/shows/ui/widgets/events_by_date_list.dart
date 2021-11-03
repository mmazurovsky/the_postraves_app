import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_postraves_package/models/related_to_event/shows_by_date.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/widgets/spacers/ending_of_screen.dart';
import 'date_for_events_list.dart';
import 'empty_shows_placeholder.dart';
import 'event_card.dart';


class EventsByDateList extends StatelessWidget {
  final Function onRefresh;
  final RefreshController refreshController;
  final List<ShowsByDate> eventsByDate;

  const EventsByDateList({
    required this.eventsByDate,
    required this.onRefresh,
    required this.refreshController,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      controller: refreshController,
      onRefresh: () => onRefresh(),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: eventsByDate.isEmpty
            ? [SliverToBoxAdapter(child: EmptyShowsPlaceholder())]
            : [
                ...eventsByDate.map(
                  (dateElement) => SliverStickyHeader(
                    header: DateForEventsList(dateElement.date),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            height: MyConstants
                                .endingOfScreenOrSpaceBetweenElements,
                          ),
                          ...dateElement.events
                              .map((event) => EventCard(
                                  key: ValueKey(event.id), loadedEvent: event))
                              .toList(),
                          Container(
                            height: MyConstants
                                .endingOfScreenOrSpaceBetweenElements,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: EndingOfScreen()),
              ],
      ),
    );
  }
}
