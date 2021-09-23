import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.center,
        child: MyLoadingIndicator(),
      ),
    );
  }
}
