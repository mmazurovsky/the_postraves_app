import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class WikiExpandableTextDescription extends StatefulWidget {
  final String text;

  WikiExpandableTextDescription(this.text);

  @override
  _WikiExpandableTextDescriptionState createState() =>
      new _WikiExpandableTextDescriptionState();
}

class _WikiExpandableTextDescriptionState
    extends State<WikiExpandableTextDescription>
    with TickerProviderStateMixin<WikiExpandableTextDescription> {
  static const int _minPreviewLength = 130;
  late int _previewLength;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _previewLength = widget.text.length < _minPreviewLength
        ? 0
        : min(widget.text.indexOf('.', _minPreviewLength),
            widget.text.indexOf(',', _minPreviewLength));
  }

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.text.length > _minPreviewLength && !_isExpanded
                  ? widget.text.substring(0, _previewLength) + '...'
                  : widget.text,
              style: MyTextStyles.longTextThinSmallInactiveColor,
            ),
            widget.text.length > _minPreviewLength
                ? WidgetSpan(
                    child: GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: RichText(
                        text: TextSpan(
                          text: ' ' + (_isExpanded
                              ? AppLocalizations.of(context)!.showLess
                              : AppLocalizations.of(context)!.showMore),
                          style: MyTextStyles.longTextThinSmallAccentColor,
                        ),
                      ),
                    ),
                  )
                : TextSpan(),
          ],
        ),
      ),
    );
  }
}
