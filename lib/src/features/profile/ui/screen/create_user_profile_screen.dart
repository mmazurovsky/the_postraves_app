import 'dart:io';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/city_change_notifier.dart';
import '../../../../common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import '../../../../common/constants/my_assets.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/geo_provider/current_city_provider.dart';
import '../../../../common/widgets/app_bar/app_bar_back_button.dart';
import '../../../../common/widgets/app_bar/app_bar_button.dart';
import '../../../../common/widgets/app_bar/my_simple_app_bar.dart';
import '../../../../common/widgets/buttons/my_elevated_button.dart';
import '../../../../common/widgets/buttons/my_outlined_button.dart';
import '../../../../common/widgets/selectors/current_city_selector.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../repository/user_profile_repository.dart';
import '../../state/profile_cubit/profile_cubit.dart';
import '../widgets/nickname_text_field.dart';
import '../widgets/profile_image_chooser.dart';

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
    _buttonText = 'profileCreationCreate'.tr();
    _userCity = context.watch<CurrentCityChangeNotifier>().currentCity!;
  }

  @override
  void dispose() {
    _nicknameFieldFocusNode.dispose();
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
                          'profileCreationTitle'.tr(),
                          style: MyTextStyles.authTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyHorizontalPadding(
                        child: Text(
                          'profileCreationSubtitle'.tr(),
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
                      const SizedBox(height: 20),
                      MyOutlinedButton(
                        onTap: () {
                          _nicknameFieldFocusNode.unfocus();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => CurrentCitySelector(
                              currentCity: _userCity,
                              cities: context.read<CityListChangeNotifier>().cityList,
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
                            _userCity.country.emojiCode,
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
                              _buttonText = 'loading'.tr();
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
