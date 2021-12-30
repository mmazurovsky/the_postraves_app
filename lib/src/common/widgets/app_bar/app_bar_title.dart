import 'package:flutter/widgets.dart';

import '../../constants/my_constants.dart';
import '../../constants/my_text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const AppBarTitle({required this.title, this.subtitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyConstants.appBarTitleWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: MyTextStyles.appBarTitle,
            overflow: TextOverflow.fade,
          ),
          subtitle != null
              ? Text(
                  subtitle!,
                  style: MyTextStyles.appBarSubtitle,
                  overflow: TextOverflow.fade,
                )
              : Container(),
        ],
      ),
    );
  }
}
