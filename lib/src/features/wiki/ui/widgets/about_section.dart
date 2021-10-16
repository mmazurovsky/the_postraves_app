import 'package:flutter/widgets.dart';
import '../../../../core/presentation/widgets/my_spacers.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import 'wiki_expandable_text_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          _about != null
              ? _about!
              : AppLocalizations.of(context)!.wikiDescriptionEmpty,
        ),
      ],
    );
  }
}
