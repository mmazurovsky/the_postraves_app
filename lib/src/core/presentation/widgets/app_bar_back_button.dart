import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'buttons/app_bar_button.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarButton(
      onTap: Navigator.of(context).pop,
      iconWidget: const Icon(
        Ionicons.chevron_back_outline,
        color: Colors.white,
      ),
      containerOpacity: 0,
    );
  }
}
