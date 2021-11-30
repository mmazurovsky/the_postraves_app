import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/app_bar/app_bar_button.dart';
import '../../../../common/widgets/buttons/my_elevated_button.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import '../../../../common/widgets/inputs/my_text_field.dart';
import '../../../../common/navigation/my_navigation.dart';

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
    _emailFocusNode.dispose();
    super.dispose();
  }

  String? _emailValidator(String emailValue) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailValue)) {
      return null;
    } else {
      return 'emailIsNotCorrect'.tr();
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
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              MyHorizontalMargin(
                child: Text(
                  'signInWithEmail'.tr(),
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
                    autofillHints: const [AutofillHints.email],
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  const SizedBox(height: 20),
                  MyElevatedButton(
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'getLinkToSignIn'.tr(),
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
      insetPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 24.0),
      backgroundColor: MyColors.bottomNavBar,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'linkHasBeenSent'.tr(),
              style: MyTextStyles.bodyFat,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const SectionDivider(needHorizontalMargin: false),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () => _closeDialogFunction(),
              child: Container(
                width: 80,
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  'ok'.tr(),
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
