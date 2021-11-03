import 'dart:io';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/service/open_link_service.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/buttons/my_elevated_button.dart';
import '../../../../common/widgets/other/my_flushbar.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../my_navigation.dart';
import 'authentication_canvas.dart';


class SignInMethodsScreen extends StatelessWidget {
  final bool isPoppable;

  const SignInMethodsScreen({Key? key, required this.isPoppable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listenWhen: (prevState, currentState) {
        return currentState is! InitialAuthState;
      },
      listener: (context, state) async {
        if (state is ErrorAuthState) {
          await MyFlushbar.showMyFlushbar(
              flushbarIcon: const Icon(
                Ionicons.information_circle_outline,
                color: Colors.white,
              ),
              flushbarMessage: 'errorSigningIn'.tr(),
              incomingContext: context);
        }
      },
      child: AuthenticationCanvas(
        title: 'authSignInTitle'.tr(),
        subTitle: 'authSignInSubtitle'.tr(),
        backButtonNeeded: isPoppable,
        buttons: [
          MyElevatedButton(
            mainAxisAlignment: MainAxisAlignment.center,
            leadingIcon: const Icon(
              Ionicons.logo_google,
              size: 18,
              color: Colors.red,
            ),
            text: 'authSignInWithGoogle'.tr(),
            buttonColor: MyColors.forEventCard,
            textStyle: MyTextStyles.buttonForGmail,
            onTap: () => BlocProvider.of<AuthenticationCubit>(context)
                .signInWithGoogle(),
          ),
          Platform.isIOS
              ? MyElevatedButton(
                  mainAxisAlignment: MainAxisAlignment.center,
                  leadingIcon: const Icon(
                    Ionicons.logo_apple,
                    size: 19,
                    color: Colors.white,
                  ),
                  text: 'authSignInWithApple'.tr(),
                  buttonColor: MyColors.forEventCard,
                  textStyle: MyTextStyles.buttonWithMainColor,
                  onTap: () => BlocProvider.of<AuthenticationCubit>(context)
                      .signInWithApple(),
                )
              : null,
          MyElevatedButton(
            mainAxisAlignment: MainAxisAlignment.center,
            leadingIcon: const Icon(
              Ionicons.mail_outline,
              size: 20,
              color: Colors.blue,
            ),
            text: 'authSignInWithEmail'.tr(),
            buttonColor: MyColors.forEventCard,
            textStyle: MyTextStyles.buttonForEmail,
            onTap: () => Navigator.of(context)
                .pushNamed(MyNavigationRoutes.signInWithEmailLink),
          ),
        ],
        bottomWidget: MyHorizontalPadding(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${'authDocsStart'.tr()}\n',
                  style: MyTextStyles.termsInactive,
                ),
                WidgetSpan(
                  baseline: TextBaseline.alphabetic,
                  alignment: PlaceholderAlignment.baseline,
                  child: InkWell(
                    onTap: () => OpenLinkService.openUrl(
                        MyConstants.termsAndConditionsLink),
                    child: RichText(
                      text: TextSpan(
                        text: 'authDocsTerms'.tr(),
                        style: MyTextStyles.termsActive,
                      ),
                    ),
                  ),
                ),
                TextSpan(
                  text: 'and'.tr(),
                  style: MyTextStyles.termsInactive,
                ),
                WidgetSpan(
                  baseline: TextBaseline.alphabetic,
                  alignment: PlaceholderAlignment.baseline,
                  child: InkWell(
                    onTap: () =>
                        OpenLinkService.openUrl(MyConstants.privacyPolicyLink),
                    child: RichText(
                      text: TextSpan(
                        text: 'authDocsPolicy'.tr(),
                        style: MyTextStyles.termsActive,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
