import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const CircularProgressIndicator(color: MyColors.main)
        : const CupertinoActivityIndicator(radius: 12);
  }
}
