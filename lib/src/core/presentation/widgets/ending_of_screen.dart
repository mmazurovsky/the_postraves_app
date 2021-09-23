import 'package:flutter/material.dart';
import '../../utils/my_constants.dart';

class EndingOfScreen extends StatelessWidget {
  const EndingOfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyConstants.endingOfScreenOrSpaceBetweenElements,
    );
  }
}
