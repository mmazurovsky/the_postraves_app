import 'dart:io';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/user/user_profile.dart';
import 'package:the_postraves_package/models/user/user_profile_to_write.dart';
import '../../../../common/constants/my_assets.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/app_bar/app_bar_back_button.dart';
import '../../../../common/widgets/app_bar/app_bar_title.dart';
import '../../../../common/widgets/app_bar/my_simple_app_bar.dart';
import '../../../../common/widgets/buttons/my_elevated_button.dart';
import '../../../../common/widgets/image/my_cached_network_image.dart';
import '../../../../common/widgets/inputs/my_text_field.dart';
import '../../state/profile_cubit/profile_cubit.dart';
import '../widgets/nickname_text_field.dart';
import '../widgets/profile_image_chooser.dart';

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

    _buttonText = 'done'.tr();
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
    _instagramEditingController.dispose();
    _telegramEditingController.dispose();
    _aboutEditingController.dispose();
    _nicknameFieldFocusNode.dispose();
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
      appBar: MySimpleAppBar(
        leading: const AppBarBackButton(),
        title: AppBarTitle(
          title: 'profileEdit'.tr(),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
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
                      hintText: 'optional'.tr(),
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
                      hintText: 'optional'.tr(),
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      title: 'aboutYou'.tr(),
                      isSecret: false,
                      textEditingController: _aboutEditingController,
                      fillColor: Colors.transparent,
                      activeBorderColor: MyColors.accent,
                      inactiveBorderColor: MyColors.main,
                      hintText: 'optional'.tr(),
                      textInputType: TextInputType.multiline,
                      maxLines: 3,
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
                            _buttonText = 'loading'.tr();
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
