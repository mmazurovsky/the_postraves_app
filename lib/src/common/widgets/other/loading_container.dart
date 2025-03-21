import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_loading_indicator.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.center,
        child: const MyLoadingIndicator(),
      ),
    );
  }
}
