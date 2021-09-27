import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/my_colors.dart';

class EmptyImagePlaceholder extends StatelessWidget {
  const EmptyImagePlaceholder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.forVeryDarkStuff,
      child: const Icon(
        Ionicons.image_outline,
        color: MyColors.main,
        size: 25,
      ),
    );
  }
}
