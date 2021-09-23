import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? CircularProgressIndicator()
        : CupertinoActivityIndicator(radius: 12);
  }
}
