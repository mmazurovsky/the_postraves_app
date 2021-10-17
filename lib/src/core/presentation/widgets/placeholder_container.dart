import 'package:flutter/widgets.dart';
import 'package:the_postraves_app/src/core/utils/my_colors.dart';
import 'package:the_postraves_app/src/core/utils/my_constants.dart';

import 'my_horizontal_padding.dart';

class PlaceholderContainer extends StatelessWidget {
  final Widget child;
  const PlaceholderContainer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: Container(
        margin: const EdgeInsets.only(top: MyConstants.spaceFromTop),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.forEventCard,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
