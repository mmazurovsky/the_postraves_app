import 'package:flutter/material.dart';

import '../../utils/my_text_styles.dart';

class FailureContainer extends StatelessWidget {
  final String failureMessage;
  const FailureContainer(
    this.failureMessage,
    [Key? key]
  ) : super(key:key);

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
