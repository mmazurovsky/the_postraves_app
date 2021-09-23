import 'package:flutter/material.dart';

import '../../utils/my_text_styles.dart';

class FailureContainer extends StatelessWidget {
  final String failureMessage;
  // final IconData icon;
  // final Function function;
  const FailureContainer(
    this.failureMessage,
    // required this.icon,
    // required this.function,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          failureMessage,
          style: MyTextStyles.body,
        ),
      ),
    );
  }
}
