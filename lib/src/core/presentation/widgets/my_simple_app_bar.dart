import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MySimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final double elevation;

  const MySimpleAppBar({Key? key, this.leading, this.title, this.elevation = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: MyColors.screenBackground,
      leading: leading ?? Container(),
      title: title ?? Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
