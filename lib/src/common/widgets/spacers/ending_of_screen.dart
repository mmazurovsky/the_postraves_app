import 'package:flutter/material.dart';
import '../../constants/my_constants.dart';

class EndingOfScreen extends StatelessWidget {
  const EndingOfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: MyConstants.endingOfScreenOrSpaceBetweenElements,
    );
  }
}
