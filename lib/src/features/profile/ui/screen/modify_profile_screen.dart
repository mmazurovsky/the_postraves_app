import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/core/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/app_bar_back_button.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/buttons/my_elevated_button.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_cached_network_image.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_horizontal_padding.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_simple_app_bar.dart';
import 'package:the_postraves_app/src/core/utils/my_assets.dart';
import 'package:the_postraves_app/src/core/utils/my_colors.dart';
import 'package:the_postraves_app/src/core/utils/my_text_styles.dart';
import 'package:the_postraves_app/src/features/profile/state/cubit/profile_cubit.dart';
import 'package:the_postraves_app/src/features/profile/ui/widgets/my_text_field.dart';
import 'package:the_postraves_app/src/features/profile/ui/widgets/nickname_text_field.dart';
import 'package:the_postraves_app/src/features/profile/ui/widgets/profile_image_chooser.dart';
import 'package:the_postraves_app/src/models/user/user_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/models/user/user_profile_to_write.dart';

class ModifyProfileScreen extends StatefulWidget {
  // final Image? _profileImage;
  ModifyProfileScreen(
      // this._profileImage,
      {Key? key})
      : super(key: key);

  @override
  _ModifyProfileScreenState createState() => _ModifyProfileScreenState();
}

class _ModifyProfileScreenState extends State<ModifyProfileScreen> {
  File? _pickedImageAsFile;
  late GlobalKey<FormState> _formKey;
  late FocusNode _nicknameFieldFocusNode;
  late TextEditingController _nicknameEditingController;
  late TextEditingController _instagramEditingController;
  late TextEditingController _telegramEditingController;
  late TextEditingController _aboutEditingController;
  UserProfile? _userProfile;
  String? _buttonText;
  MyCachedNetworkImage? _profileInitialImage;

  @override
  void initState() {
    super.initState();
    _nicknameFieldFocusNode = FocusNode();
    _nicknameEditingController = TextEditingController();
    _instagramEditingController = TextEditingController();
    _telegramEditingController = TextEditingController();
    _aboutEditingController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    _userProfile =
        BlocProvider.of<AuthenticationCubit>(context).currentUserFromBackend;
    _nicknameEditingController.text = _userProfile!.name;
    if (_userProfile?.instagramUsername != null) {
      _instagramEditingController.text = _userProfile!.instagramUsername!;
    }
    if (_userProfile?.telegramUsername != null) {
      _telegramEditingController.text = _userProfile!.telegramUsername!;
    }
    if (_userProfile?.about != null) {
      _aboutEditingController.text = _userProfile!.about!;
    }

    _buttonText = 'Modify profile'; //todo
    //AppLocalizations.of(context)!.profileModificationModify;
    if (_userProfile?.imageLink != null) {
      _assignInitialProfileImage(_userProfile!.imageLink!);
    }
    super.didChangeDependencies();
  }

  void _assignInitialProfileImage(String imageLink) async {
    _profileInitialImage = MyCachedNetworkImage(imageLink);
  }

  @override
  void dispose() {
    _nicknameEditingController.dispose();
    super.dispose();
  }

  void _pickImage(File imageFile) {
    _pickedImageAsFile = imageFile;
  }

  void _unfocusTextFields() {
    _nicknameFieldFocusNode.unfocus();
  }

  void _triggerFormValidation() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      appBar: const MySimpleAppBar(
        leading: AppBarBackButton(),
        title: Text(
          'Profile modification', //todo
          style: MyTextStyles.appBarTitle,
          overflow: TextOverflow.fade,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ProfileImageChooser(
                      pickImage: _pickImage,
                      onTap: () => _unfocusTextFields(),
                      initialImage: _profileInitialImage,
                    ),
                    const SizedBox(height: 20),
                    NicknameTextField(
                      focusNode: _nicknameFieldFocusNode,
                      textEditingController: _nicknameEditingController,
                      triggerValidation: () => _triggerFormValidation(),
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      title: 'Instagram username',
                      textInputType: TextInputType.text,
                      isSecret: false,
                      textEditingController: _instagramEditingController,
                      fillColor: Colors.transparent,
                      activeBorderColor: MyColors.accent,
                      inactiveBorderColor: MyColors.main,
                      hintText: 'Optional', //todo
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      title: 'Telegram username',
                      textInputType: TextInputType.text,
                      isSecret: false,
                      textEditingController: _telegramEditingController,
                      fillColor: Colors.transparent,
                      activeBorderColor: MyColors.accent,
                      inactiveBorderColor: MyColors.main,
                      hintText: 'Optional', //todo
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      title: 'About you',
                      textInputType: TextInputType.multiline,
                      isSecret: false,
                      textEditingController: _aboutEditingController,
                      fillColor: Colors.transparent,
                      activeBorderColor: MyColors.accent,
                      inactiveBorderColor: MyColors.main,
                      maxLines: 3,
                      hintText: 'Optional', //todo
                      maxLength: 200,
                    ),
                    const SizedBox(height: 20),
                    MyElevatedButton(
                      mainAxisAlignment: MainAxisAlignment.center,
                      leadingIcon: Image.asset(MyEmoji.finish, width: 20),
                      text: _buttonText!,
                      buttonColor: MyColors.accent,
                      textStyle: MyTextStyles.buttonWithOppositeColor,
                      onTap: () {
                        _unfocusTextFields();
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _buttonText = AppLocalizations.of(context)!.loading;
                          });
                          final UserProfileToWrite userProfileToWrite =
                              UserProfileToWrite(
                            name: _nicknameEditingController.text,
                            currentCity: _userProfile!.currentCity.name,
                            about: _aboutEditingController.text.isEmpty
                                ? null
                                : _aboutEditingController.text,
                            imageLink: _userProfile!.imageLink,
                            instagramUsername:
                                _instagramEditingController.text.isEmpty
                                    ? null
                                    : _instagramEditingController.text,
                            telegramUsername:
                                _telegramEditingController.text.isEmpty
                                    ? null
                                    : _telegramEditingController.text,
                          );
                          BlocProvider.of<ProfileCubit>(context)
                              .updateWholeUserProfile(
                                  userProfileToWrite, _pickedImageAsFile);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
