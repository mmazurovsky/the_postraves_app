import 'package:flutter/material.dart';
import '../../../../models/related_to_event/timetable_performance.dart';
import 'artist_performance_item.dart';

class ArtistPerformancesList extends StatelessWidget {
  const ArtistPerformancesList(
    this._artistPerformances, {
    Key? key,
  }) : super(key: key);

  final List<TimetablePerformance> _artistPerformances;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _artistPerformances
          .map((performance) => ArtistPerformanceItem(
                artists: performance.artists,
                startingDateTime: performance.startingDateTime,
                endingDateTime: performance.endingDateTime,
              ))
          .toList(),
    );
  }
}
