import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../constants/my_constants.dart';
import 'my_horizontal_margin.dart';

class SectionDivider extends StatelessWidget {
  final bool needHorizontalMargin;
  const SectionDivider({
    Key? key,
    required this.needHorizontalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return needHorizontalMargin
        ? MyHorizontalMargin(child: _MyDivider())
        : _MyDivider();
  }
}

class _MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: MyColors.forDividers,
      thickness: MyConstants.dividerThickness,
      height: 0.5,
    );
  }
}
