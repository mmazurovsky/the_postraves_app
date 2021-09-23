import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/presentation/widgets/my_flushbar.dart';

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
      child: Container(child: buttonIcon),
    );
  }
}
