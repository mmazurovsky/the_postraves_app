import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/features/profile/state/profile_cubit/profile_cubit.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../../../core/presentation/widgets/buttons/app_bar_button.dart';
import '../widgets/nickname_text_field.dart';
import '../../../../core/presentation/widgets/current_city_selector.dart';
import '../../../../core/presentation/widgets/app_bar_back_button.dart';
import '../../../../core/presentation/widgets/my_simple_app_bar.dart';
import '../../repository/user_profile_repository.dart';
import '../../../../models/geo/city.dart';
import '../../../../core/provider/city_list_provider.dart';
import '../../../../core/provider/current_city_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/buttons/my_outlined_button.dart';
import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../widgets/profile_image_chooser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateUserProfileScreen extends StatefulWidget {
  final bool isPoppable;
  final UserProfileRepository userProfileRepository;
  const CreateUserProfileScreen({
    Key? key,
    required this.isPoppable,
    required this.userProfileRepository,
  }) : super(key: key);

  @override
  _CreateUserProfileScreenState createState() =>
      _CreateUserProfileScreenState();
}

class _CreateUserProfileScreenState extends State<CreateUserProfileScreen> {
  late City _userCity;
  File? _pickedImageAsFile;
  late GlobalKey<FormState> _formKey;
  late FocusNode _nicknameFieldFocusNode;
  late TextEditingController _nicknameEditingController;
  String? _buttonText;

  @override
  void initState() {
    super.initState();
    _nicknameFieldFocusNode = FocusNode();
    _nicknameEditingController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buttonText = AppLocalizations.of(context)!.profileCreationCreate;
    _userCity =
        context.read<CurrentCityProvider>().currentCity!; //todo ! is risky
  }

  @override
  void dispose() {
    _nicknameEditingController.dispose();
    super.dispose();
  }

  void _selectActiveCity(City city) {
    setState(() {
      _userCity = city;
    });
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: MySimpleAppBar(
          leading: widget.isPoppable
              ? const AppBarBackButton()
              : AppBarButton(
                  onTap: () {
                    _unfocusTextFields();
                    context.read<AuthenticationCubit>().signOut();
                  },
                  iconWidget: const Icon(
                    Ionicons.close_outline,
                    color: Colors.white,
                  ),
                  containerOpacity: 0,
                ),
        ),
        body: SafeArea(
          child: Container(
            color: MyColors.screenBackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyHorizontalPadding(
                        child: Text(
                          AppLocalizations.of(context)!.profileCreationTitle,
                          style: MyTextStyles.authTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyHorizontalPadding(
                        child: Text(
                          AppLocalizations.of(context)!.profileCreationSubtitle,
                          style: MyTextStyles.authSubtitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfileImageChooser(
                        pickImage: _pickImage,
                        onTap: () => _unfocusTextFields(),
                      ),
                      const SizedBox(height: 20),
                      NicknameTextField(
                        focusNode: _nicknameFieldFocusNode,
                        textEditingController: _nicknameEditingController,
                        triggerValidation: () => _triggerFormValidation(),
                      ),

                      // MyTextField(
                      //   focusNode: _nicknameFieldFocusNode,
                      //   title: AppLocalizations.of(context)!
                      //       .profileCreationNickname,
                      //   textInputType: TextInputType.text,
                      //   isSecret: false,
                      //   textEditingController: _nicknameEditingController,
                      //   validatorFunction: _nicknameValidator,
                      //   fillColor: Colors.transparent,
                      //   activeBorderColor: MyColors.accent,
                      //   inactiveBorderColor: MyColors.main,
                      // ),
                      const SizedBox(height: 20),
                      MyOutlinedButton(
                        onTap: () {
                          _nicknameFieldFocusNode.unfocus();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => CurrentCitySelector(
                              currentCity: _userCity,
                              cities: context.read<CityListProvider>().cityList,
                              onSelected: _selectActiveCity,
                            ),
                          );
                        },
                        contentHorizontalPadding:
                            MyConstants.horizontalPaddingOrMargin,
                        borderColor: MyColors.main,
                        leadingIcon: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: Text(
                            _userCity.country.countryEmoji,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        text: _userCity.localName,
                        textStyle: MyTextStyles.body,
                        mainAxisAlignment: MainAxisAlignment.start,
                        trailingIcon: const Icon(
                          Ionicons.chevron_down_outline,
                          color: MyColors.accent,
                          size: 26,
                        ),
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
                              _buttonText =
                                  AppLocalizations.of(context)!.loading;
                            });
                            BlocProvider.of<ProfileCubit>(context)
                                .createUserProfile(_pickedImageAsFile,
                                    _nicknameEditingController.text, _userCity);
                          }
                        },
                      ),
                    ],
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
