import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../constants/my_text_styles.dart';


class MyFlushbar {
  static Future<dynamic> showMyFlushbar(
      {required String flushbarMessage,
      required Icon flushbarIcon,
      required BuildContext incomingContext}) {
    return Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      borderRadius: BorderRadius.circular(5),
      backgroundColor: MyColors.bottomNavBar,
      icon: flushbarIcon,
      messageText: Text(
        flushbarMessage,
        style: MyTextStyles.body,
      ),
      duration: Duration(seconds: 1, milliseconds: 500),
    ).show(incomingContext);
  }
}
