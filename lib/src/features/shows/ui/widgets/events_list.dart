import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../models/shorts/event_short.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/utils/my_constants.dart';

import 'empty_shows_placeholder.dart';
import 'event_card.dart';

class EventsList extends StatelessWidget {
  final List<EventShort> eventsByRating;
  final Function onRefresh;
  final RefreshController refreshController;

  EventsList({
    Key? key,
    required this.eventsByRating,
    required this.onRefresh,
    required this.refreshController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      controller: refreshController,
      onRefresh: () => onRefresh(),
      child: eventsByRating != null && eventsByRating.isNotEmpty
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                  top: 10,
                  bottom: MyConstants.endingOfScreenOrSpaceBetweenElements),
              itemBuilder: (context, i) => EventCard(
                  key: ValueKey(eventsByRating[i].id),
                  loadedEvent: eventsByRating[i]),
              itemCount: eventsByRating.length,
            )
          : EmptyShowsPlaceholder(),
    );
  }
}
