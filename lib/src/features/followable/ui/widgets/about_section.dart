import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import 'wiki_expandable_text_description.dart';

class AboutSection extends StatelessWidget {
  final String? _about;
  final bool areSpacerAndDividerNeeded;
  const AboutSection(this._about,
      {this.areSpacerAndDividerNeeded = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        areSpacerAndDividerNeeded
            ? Column(
                children: const [
                  MyBigSpacer(),
                  SectionDivider(needHorizontalMargin: true),
                  MyBigSpacer(),
                ],
              )
            : Container(),
        WikiExpandableTextDescription(
          _about != null ? _about! : 'wikiDescriptionEmpty'.tr(),
        ),
      ],
    );
  }
}
