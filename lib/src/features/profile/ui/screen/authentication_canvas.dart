import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/common/widgets/spacers/my_spacers.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/app_bar/app_bar_back_button.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
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
            const SizedBox(height: 50),
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
            const SizedBox(height: 100),
            bottomWidget == null
                ? Container()
                : MyHorizontalMargin(
                    child: bottomWidget!,
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
