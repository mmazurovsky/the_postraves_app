import 'package:flutter/material.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';

class WikiSquaredOutlinedBookmarkButton extends StatelessWidget {
  const WikiSquaredOutlinedBookmarkButton(this._iconWidget, {Key? key}) : super(key: key);
  final Widget _iconWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('outlined tapped'),
      child: Container(
        height: MyConstants.heightOfContainers,
        width: MyConstants.heightOfContainers,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.accent, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _iconWidget,
      ),
    );
  }
}
