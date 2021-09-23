import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/app_bar_back_button.dart';

import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';

class AuthenticationCanvas extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? bottomWidget;
  final bool backButtonNeeded;
  final List<Widget> buttons;
  const AuthenticationCanvas({
    Key? key,
    required this.backButtonNeeded,
    required this.title,
    this.subTitle,
    required this.buttons,
    this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.screenBackground,
        leading: backButtonNeeded ? AppBarBackButton() : Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyHorizontalMargin(
                child: Text(
                  title,
                  style: MyTextStyles.authTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          subTitle == null
              ? Container()
              : Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    MyHorizontalMargin(
                      child: Text(
                        subTitle!,
                        style: MyTextStyles.authSubtitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...buttons.map(
                (button) {
                  return Column(
                    children: [
                      button,
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              bottomWidget == null
                  ? Container()
                  : MyHorizontalMargin(
                      child: bottomWidget!,
                    ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
