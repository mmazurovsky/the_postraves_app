import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/widgets/other/my_flushbar.dart';

class IconButtonTriggeringFlushbar extends StatelessWidget {
  const IconButtonTriggeringFlushbar({
    Key? key,
    required this.buttonIcon,
    required this.flushbarMessage,
    required this.flushbarIcon,
    required this.onTap,
  }) : super(key: key);

  final Icon buttonIcon;
  final Icon flushbarIcon;
  final String flushbarMessage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        MyFlushbar.showMyFlushbar(
          flushbarIcon: flushbarIcon,
          flushbarMessage: flushbarMessage,
          incomingContext: context,
        );
      },
      highlightColor: MyColors.forButtonHighlight,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(10),
        child: buttonIcon),
    );
  }
}
