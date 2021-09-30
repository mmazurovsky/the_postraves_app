import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/buttons/my_elevated_button.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/section_divider.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../widgets/my_text_field.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/buttons/app_bar_button.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../my_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button_without_padding.dart';

class SignInWithEmailAndLinkScreen extends StatefulWidget {
  const SignInWithEmailAndLinkScreen({Key? key}) : super(key: key);

  @override
  _SignInWithEmailAndLinkScreenState createState() =>
      _SignInWithEmailAndLinkScreenState();
}

class _SignInWithEmailAndLinkScreenState
    extends State<SignInWithEmailAndLinkScreen> {
  late GlobalKey<FormState> _formKey;
  late FocusNode _emailFocusNode;
  late TextEditingController _emailController;
  bool _isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailFocusNode = FocusNode()..requestFocus();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _emailValidator(String emailValue) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailValue)) {
      return null;
    } else {
      return AppLocalizations.of(context)!.emailIsNotCorrect;
    }
  }

  void _closeDialog() {
    Navigator.of(context, rootNavigator: true)
        .pop(); // in debug mode seems like it doesn't close the dialog but it somehow closes in the end
    _isDialogOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedState ||
            state is AuthenticatedWithoutAccountState) {
          if (_isDialogOpen) {
            _closeDialog();
          }
          Navigator.of(context).popUntil((route) {
            final isRouteProfileResolver =
                route.settings.name == MyNavigationRoutes.profileResolver;
            return isRouteProfileResolver;
          });
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.screenBackground,
        appBar: AppBar(
          leading: AppBarButton(
            onTap: Navigator.of(context).pop,
            iconWidget: const Icon(
              Ionicons.chevron_back_outline,
              color: Colors.white,
            ),
            containerOpacity: 0,
          ),
          backgroundColor: MyColors.screenBackground,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyHorizontalMargin(
                child: Text(
                  AppLocalizations.of(context)!.signInWithEmail,
                  style: MyTextStyles.authTitle,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    focusNode: _emailFocusNode,
                    activeBorderColor: MyColors.accent,
                    inactiveBorderColor: MyColors.main,
                    fillColor: Colors.transparent,
                    title: 'Email',
                    textInputType: TextInputType.emailAddress,
                    isSecret: false,
                    textEditingController: _emailController,
                    validatorFunction: _emailValidator,
                  ),
                  const SizedBox(height: 20),
                  // Opacity(
                  //     opacity: _infoTextOpacity,
                  //     child: MyHorizontalPadding(
                  //         child: Text(
                  //       AppLocalizations.of(context)!.linkHasBeenSent,
                  //       style: MyTextStyles.body,
                  //     ))),
                  MyElevatedButton(
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: AppLocalizations.of(context)!.getLinkToSignIn,
                    buttonColor: MyColors.accent,
                    textStyle: MyTextStyles.buttonWithOppositeColor,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _emailFocusNode.unfocus();
                        BlocProvider.of<AuthenticationCubit>(context)
                            .startSigningWithEmailLink(_emailController.text);
                        _isDialogOpen = true;
                        showDialog(
                          context: context,
                          builder: (_) => LinkSentDialog(
                            () => _closeDialog(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinkSentDialog extends StatelessWidget {
  final void Function() _closeDialogFunction;

  const LinkSentDialog(this._closeDialogFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          EdgeInsets.symmetric(horizontal: 15.0, vertical: 24.0), //todo 15
      backgroundColor: MyColors.bottomNavBar,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.linkHasBeenSent,
              style: MyTextStyles.bodyFat,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            SectionDivider(needHorizontalMargin: false),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () => _closeDialogFunction(),
              child: Container(
                width: 80,
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  'OK',
                  style: MyTextStyles.bodyWithAccentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
