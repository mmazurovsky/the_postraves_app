import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../widgets/my_text_field.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/buttons/app_bar_button.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../my_navigation.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button_without_padding.dart';

class SignInWithEmailAndLinkScreen extends StatefulWidget {
  SignInWithEmailAndLinkScreen({Key? key}) : super(key: key);

  @override
  _SignInWithEmailAndLinkScreenState createState() =>
      _SignInWithEmailAndLinkScreenState();
}

class _SignInWithEmailAndLinkScreenState
    extends State<SignInWithEmailAndLinkScreen> {
  late GlobalKey<FormState> _formKey;
  late FocusNode _emailFocusNode;
  late TextEditingController _emailController;
  late double _infoTextOpacity;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailFocusNode = FocusNode()..requestFocus();
    _emailController = TextEditingController();
    _infoTextOpacity = 0;
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
      return 'Email некорректный';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedState ||
            state is AuthenticatedWithoutAccountState) {
          Navigator.of(context).popUntil((route) {
            print(route.settings.name);
            final boolean =
                route.settings.name == MyNavigationRoutes.profileResolver;
            return boolean;
          });
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.screenBackground,
        appBar: AppBar(
          leading: AppBarButton(
            onTap: Navigator.of(context).pop,
            iconWidget: Icon(
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
                  'Вход с Email',
                  style: MyTextStyles.authTitle,
                ),
              ),
              SizedBox(
                height: 20,
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
                  SizedBox(height: 10),
                  Opacity(
                      opacity: _infoTextOpacity,
                      child: MyHorizontalPadding(
                          child: Text(
                        'На этот email была отправлена ссылка для входа',
                        style: MyTextStyles.body,
                      ))),
                  SizedBox(height: 10),
                  MyElevatedButtonWithoutPadding(
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Получить ссылку для входа',
                    buttonColor: MyColors.accent,
                    textStyle: MyTextStyles.buttonWithOppositeColor,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthenticationCubit>(context)
                            .startSigningWithEmailLink(_emailController.text);
                        setState(() {
                          _infoTextOpacity = 1;
                        });
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
