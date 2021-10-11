import 'package:flutter/widgets.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_spacers.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/section_divider.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_expandable_text_description.dart';

class AboutSection extends StatelessWidget {
  final String? _about;
  final bool areSpacerAndDividerNeeded;
  const AboutSection(this._about,
      {this.areSpacerAndDividerNeeded = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _about == null
        ? Container()
        : Column(
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
                _about!,
              ),
            ],
          );
  }
}
