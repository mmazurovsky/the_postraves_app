import 'dart:math';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';

class WikiExpandableTextDescription extends StatefulWidget {
  final String text;

  const WikiExpandableTextDescription(this.text);

  @override
  _WikiExpandableTextDescriptionState createState() =>
      _WikiExpandableTextDescriptionState();
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
                          text: ' ' +
                              (_isExpanded ? 'showLess'.tr() : 'showMore'.tr()),
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
