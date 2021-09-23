import 'package:flutter/material.dart';

import '../../../../core/utils/my_colors.dart';

class SquaredBoxWithContent extends StatelessWidget {
  final Widget child;
  const SquaredBoxWithContent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: MyColors.screenBackground,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
