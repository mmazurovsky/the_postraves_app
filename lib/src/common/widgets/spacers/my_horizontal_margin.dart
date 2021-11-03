import 'package:flutter/material.dart';
import '../../constants/my_constants.dart';


class MyHorizontalMargin extends StatelessWidget {
  final Widget child;

  const MyHorizontalMargin({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: MyConstants.horizontalPaddingOrMargin,
      ),
      child: child,
    );
  }
}
