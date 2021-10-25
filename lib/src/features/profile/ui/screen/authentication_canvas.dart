import 'package:flutter/material.dart';
import '../../../../core/utils/screen_size.dart';

import '../../../../core/presentation/widgets/app_bar_back_button.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';

class AuthenticationCanvas extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? bottomWidget;
  final bool backButtonNeeded;
  final List<Widget?> buttons;
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
        leading: backButtonNeeded ? const AppBarBackButton() : Container(),
      ),
      body:
          // not sure about this screen for all device screen sizes...
          SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: ScreenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyHorizontalMargin(
                child: Text(
                  title,
                  style: MyTextStyles.authTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              subTitle == null
                  ? Container()
                  : Column(
                      children: [
                        const SizedBox(
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
              const SizedBox(
                height: 30,
              ),
              ...buttons.map(
                (button) {
                  return button != null
                      ? Column(
                          children: [
                            button,
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : Container();
                },
              ),
              const SizedBox(
                height: 120,
              ),
              bottomWidget == null
                  ? Container()
                  : MyHorizontalMargin(
                      child: bottomWidget!,
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
