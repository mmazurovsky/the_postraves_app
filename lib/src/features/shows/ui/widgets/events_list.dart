import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../common/constants/my_constants.dart';

import 'empty_shows_placeholder.dart';
import 'event_card.dart';

class EventsList extends StatelessWidget {
  final List<EventShort> eventsByRating;
  final Function onRefresh;
  final RefreshController refreshController;

  const EventsList({
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
      child: eventsByRating.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.only(top: 15),
              itemCount: eventsByRating.length,
              itemBuilder: (context, i) => EventCard(
                key: ValueKey(eventsByRating[i].id),
                loadedEvent: eventsByRating[i],
              ),
              separatorBuilder: (context, i) => const SizedBox(
                height: MyConstants.endingOfScreenOrSpaceBetweenElements,
              ),
            )
          : const SingleChildScrollView(child: EmptyShowsPlaceholder()),
    );
  }
}
