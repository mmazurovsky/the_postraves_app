import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';

import 'package:the_postraves_package/models/shorts/event_short.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../common/widgets/other/short_event_card_item.dart';
import '../../../../common/widgets/other/column_of_custom_cards.dart';

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
              SectionTitle(sectionTitle: 'wikiUpcomingEvents'.tr()),
              const MySmallSpacer(),
              ColumnOfCustomCards<EventShort>(
                entities: _events,
                buildCard: (EventShort event) => ShortEventCardItem(event),
              ),
            ],
          );
  }
}
