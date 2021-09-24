import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../../../my_navigation.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/my_flushbar.dart';
import 'authentication_canvas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              flushbarMessage: AppLocalizations.of(context)!.errorSigningIn,
              incomingContext: context);
        }
      },
      child: AuthenticationCanvas(
        title: AppLocalizations.of(context)!.authSignInTitle,
        subTitle: AppLocalizations.of(context)!.authSignInSubtitle,
        backButtonNeeded: isPoppable,
        buttons: [
          MyElevatedButton(
            mainAxisAlignment: MainAxisAlignment.center,
            leadingIcon: const Icon(
              Ionicons.chatbox_ellipses_outline,
              size: 20,
              color: Colors.green,
            ),
            text: AppLocalizations.of(context)!.authSignInWithSms,
            buttonColor: MyColors.forEventCard,
            textStyle: MyTextStyles.buttonForSms,
            // todo
            onTap: () => Navigator.of(context)
                .pushNamed(MyNavigationRoutes.signInWithSms),
          ),
          MyElevatedButton(
            mainAxisAlignment: MainAxisAlignment.center,
            leadingIcon: const Icon(
              Ionicons.logo_google,
              size: 18,
              color: Colors.red,
            ),
            text: AppLocalizations.of(context)!.authSignInWithGoogle,
            buttonColor: MyColors.forEventCard,
            textStyle: MyTextStyles.buttonForGmail,
            onTap: () => BlocProvider.of<AuthenticationCubit>(context)
                .signInWithGoogle(),
          ),
          MyElevatedButton(
            mainAxisAlignment: MainAxisAlignment.center,
            leadingIcon: const Icon(
              Ionicons.mail_outline,
              size: 20,
              color: Colors.blue,
            ),
            text: AppLocalizations.of(context)!.authSignInWithEmail,
            buttonColor: MyColors.forEventCard,
            textStyle: MyTextStyles.buttonForEmail,
            onTap: () => Navigator.of(context)
                .pushNamed(MyNavigationRoutes.signInWithEmailLink),
          ),
          Platform.isIOS
              ? MyElevatedButton(
                  mainAxisAlignment: MainAxisAlignment.center,
                  leadingIcon: const Icon(
                    Ionicons.logo_apple,
                    size: 19,
                    color: Colors.white,
                  ),
                  text: AppLocalizations.of(context)!.authSignInWithApple,
                  buttonColor: MyColors.forEventCard,
                  textStyle: MyTextStyles.buttonWithMainColor,
                  // todo

                  onTap: () {},
                )
              : Container(),
        ],
        bottomWidget: MyHorizontalPadding(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${AppLocalizations.of(context)!.authDocsOur} ',
                  style: MyTextStyles.termsInactive,
                ),
                WidgetSpan(
                  baseline: TextBaseline.alphabetic,
                  alignment: PlaceholderAlignment.baseline,
                  child: InkWell(
                    //todo
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        text: AppLocalizations.of(context)!.authDocsTerms,
                        style: MyTextStyles.termsActive,
                      ),
                    ),
                  ),
                ),
                TextSpan(
                  text: ' ${AppLocalizations.of(context)!.authDocsAnd} ',
                  style: MyTextStyles.termsInactive,
                ),
                WidgetSpan(
                  baseline: TextBaseline.alphabetic,
                  alignment: PlaceholderAlignment.baseline,
                  child: InkWell(
                    //todo
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        text: AppLocalizations.of(context)!.authDocsPolicy,
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
