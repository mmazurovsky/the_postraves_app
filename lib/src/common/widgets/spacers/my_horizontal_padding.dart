import 'package:flutter/material.dart';
import '../../constants/my_constants.dart';

class MyHorizontalPadding extends StatelessWidget {
  final Widget child;

  const MyHorizontalPadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MyConstants.horizontalPaddingOrMargin,
      ),
      child: child,
    );
  }
}
