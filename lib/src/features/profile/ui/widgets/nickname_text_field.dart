import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../state/profile_cubit/profile_cubit.dart';

import '../../../../common/widgets/inputs/my_text_field.dart';

class NicknameTextField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function() triggerValidation;
  const NicknameTextField({
    required this.focusNode,
    required this.textEditingController,
    required this.triggerValidation,
    Key? key,
  }) : super(key: key);

  @override
  _NicknameTextFieldState createState() => _NicknameTextFieldState();
}

class _NicknameTextFieldState extends State<NicknameTextField> {
  bool _isNicknameFree = true;
  String? _previouslyCheckedNickname;
  String? _initialValue;

  @override
  void initState() {
    super.initState();
    if (widget.textEditingController.text.isNotEmpty) {
      _initialValue = widget.textEditingController.text;
    }
  }

  ///* this function can't be async, so it can't use
  ///* async function inside that check is nickname free
  ///* that is why _isNicknameFree field and void
  ///* function _checkNicknameIsFree are used
  String? _nicknameValidator(
    String nickname,
  ) {
    if (_initialValue == nickname) return null;
    final nicknameErrorMessage = _basicCheckNickname(nickname);
    if (nicknameErrorMessage != null) return nicknameErrorMessage;
    _checkNicknameIsFreeThenWaitForResponseThenTriggerValidationAgain(nickname);
    if (!_isNicknameFree) {
      return 'profileCreationNicknameWarningTaken'.tr();
    } else {
      return null;
    }
  }

  String? _basicCheckNickname(String nickname) {
    if (_previouslyCheckedNickname != nickname) {
      if (nickname.length < 3 || nickname.length > 15) {
        return 'profileCreationNicknameWarningLength'.tr();
      }
      if (!RegExp(r"^[a-zA-Z0-9]*$").hasMatch(nickname)) {
        return 'profileCreationNicknameWarningSymbols'.tr();
      }
    }
    return null;
  }

  void _checkNicknameIsFreeThenWaitForResponseThenTriggerValidationAgain(
      String nickname) async {
    if (_previouslyCheckedNickname != nickname) {
      _previouslyCheckedNickname = nickname;

      final isNicknameFreeResponse =
          await BlocProvider.of<ProfileCubit>(context)
              .checkNicknameIsFree(nickname);
      if (_isNicknameFree != isNicknameFreeResponse) {
        setState(() {
          // set state really needed here? Dunno
          _isNicknameFree = isNicknameFreeResponse!;
        });
        //* this will trigget nickname validator to run again
        widget.triggerValidation();
        // _formKey.currentState!.validate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      focusNode: widget.focusNode,
      title: 'profileCreationNickname'.tr(),
      textInputType: TextInputType.text,
      isSecret: false,
      textEditingController: widget.textEditingController,
      validatorFunction: _nicknameValidator,
      fillColor: Colors.transparent,
      activeBorderColor: MyColors.accent,
      inactiveBorderColor: MyColors.main,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
