import 'package:flutter/widgets.dart';
import '../../../../core/presentation/widgets/my_spacers.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/short_event_card_item.dart';
import '../../../../models/shorts/event_short.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'column_of_custom_cards.dart';

class UpcomingEventsSection extends StatelessWidget {
  final List<EventShort> _events;
  const UpcomingEventsSection(this._events, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _events.isEmpty
        ? Container()
        : Column(
            children: [
              const MyBigSpacer(),
              const SectionDivider(needHorizontalMargin: true),
              const MyBigSpacer(),
              SectionTitle(
                  sectionTitle:
                      AppLocalizations.of(context)!.wikiUpcomingEvents),
              const MySmallSpacer(),
              ColumnOfCustomCards<EventShort>(
                entities: _events,
                buildCard: (EventShort event) => ShortEventCardItem(event),
              ),
            ],
          );
  }
}
