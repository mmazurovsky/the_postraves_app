import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../widgets/my_text_field.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';

import '../../../../core/presentation/widgets/buttons/app_bar_button.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';

class SignInWithEmailAndPasswordScreen extends StatefulWidget {
  const SignInWithEmailAndPasswordScreen({Key? key}) : super(key: key);

  @override
  _SignInWithEmailAndPasswordScreenState createState() =>
      _SignInWithEmailAndPasswordScreenState();
}

// INFO NOT IN USE
class _SignInWithEmailAndPasswordScreenState
    extends State<SignInWithEmailAndPasswordScreen> {
  late GlobalKey<FormState> _formKey;
  late FocusNode _emailFocusNode;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailFocusNode = FocusNode()..requestFocus();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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

  String? _passwordValidator(String passwordValue) {
    if (passwordValue.length < 6 || passwordValue.length > 15) {
      return 'Нужно от 6 до 15 символов';
    } else if (!RegExp(r"^[a-zA-Z0-9]*$").hasMatch(passwordValue)) {
      return 'Должен содержать только латиницу и цифры';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyHorizontalMargin(
              child: Text(
                'Вход с Email',
                style: MyTextStyles.authTitle,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyTextField(
                  focusNode: _emailFocusNode,
                  title: 'Email',
                  textInputType: TextInputType.emailAddress,
                  isSecret: false,
                  textEditingController: _emailController,
                  validatorFunction: _emailValidator,
                  fillColor: Colors.transparent,
                  activeBorderColor: MyColors.accent,
                  inactiveBorderColor: MyColors.main,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  title: 'Пароль',
                  textInputType: TextInputType.visiblePassword,
                  isSecret: true,
                  textEditingController: _passwordController,
                  validatorFunction: _passwordValidator,
                  fillColor: Colors.transparent,
                  activeBorderColor: MyColors.accent,
                  inactiveBorderColor: MyColors.main,
                ),
                const SizedBox(height: 40),
                MyElevatedButton(
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: 'Войти',
                  buttonColor: Colors.white,
                  textStyle: MyTextStyles.buttonWithOppositeColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // BlocProvider.of<AuthenticationCubit>(context).signIn(
                      //     _emailController.text,
                      //     _passwordController.text,
                      //   ),
                      // );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
