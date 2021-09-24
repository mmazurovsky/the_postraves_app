import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MySimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;

  const MySimpleAppBar({Key? key, this.leading, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.screenBackground,
      leading: leading ?? Container(),
      title: title ?? Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
