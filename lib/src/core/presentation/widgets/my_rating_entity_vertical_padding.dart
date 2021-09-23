import 'package:flutter/material.dart';

import '../../utils/my_constants.dart';

class MyRatingEntityVerticalPadding extends StatelessWidget {
  final Widget child;

  const MyRatingEntityVerticalPadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MyConstants.ratingEntityVerticalPadding,
      ),
      child: child,
    );
  }
}
