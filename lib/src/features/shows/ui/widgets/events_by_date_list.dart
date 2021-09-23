import 'package:flutter/material.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/utils/my_constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/presentation/widgets/ending_of_screen.dart';
import '../../../../core/utils/formatting_utils.dart';
import '../../../../models/related_to_event/shows_by_date.dart';
import 'empty_shows_placeholder.dart';
import 'event_card.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class EventsByDateList extends StatelessWidget {
  final Function onRefresh;
  final RefreshController refreshController;
  final List<ShowsByDate> eventsByDate;

  EventsByDateList({
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
            // todo placeholder
            ? [SliverToBoxAdapter(child: EmptyShowsPlaceholder())]
            : [
                ...eventsByDate.map(
                  (dateElement) => SliverStickyHeader(
                    header: Container(
                      padding: EdgeInsets.only(
                        left: MyConstants.horizontalPaddingOrMargin,
                        right: MyConstants.horizontalPaddingOrMargin,
                        top: 10,
                        bottom: 15,
                      ),
                      decoration: BoxDecoration(
                        color: MyColors.screenBackground,
                        border: Border(
                          bottom: BorderSide(
                            color: MyColors.forDividers,
                            width: MyConstants.dividerThickness,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        FormattingUtils.getFormattedDateLong(
                          context: context,
                          dateTime: dateElement.date,
                        ),
                        style: MyTextStyles.showsByDateDate,
                      ),
                    ),
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
                              .toList()
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
