import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/presentation/widgets/app_bar_back_button.dart';
import '../../../../core/presentation/widgets/my_simple_app_bar.dart';
import '../../repository/user_profile_repository_impl.dart';
import '../../state/cubit/profile_cubit.dart';
import '../../../../models/geo/city.dart';
import '../../../../core/presentation/widgets/selection_list_view.dart';
import '../../../../core/provider/city_list_provider.dart';
import '../../../../core/provider/current_city_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/presentation/widgets/modal_bottom_sheet_content.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/buttons/my_outlined_button.dart';
import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../widgets/my_text_field.dart';
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
  late TextEditingController _nicknameEditingController;
  late City _userCity;
  File? _pickedImageAsFile;
  late GlobalKey<FormState> _formKey;
  late bool _isNicknameFree;
  late FocusNode _nicknameFieldFocusNode;
  late String _buttonText;
  String? _previouslyCheckedNickname;

  @override
  void initState() {
    super.initState();
    _nicknameEditingController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _isNicknameFree = true;
    _nicknameFieldFocusNode = FocusNode();
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

  String? _nicknameValidator(String nickname) {
    _resolveNickname(nickname);
    if (nickname.length < 3 || nickname.length > 15) {
      return AppLocalizations.of(context)!.profileCreationNicknameWarningLength;
    } else if (!RegExp(r"^[a-zA-Zа-яА-Я0-9]*$").hasMatch(nickname)) {
      // todo add german
      return AppLocalizations.of(context)!
          .profileCreationNicknameWarningSymbols;
    } else if (!_isNicknameFree) {
      return AppLocalizations.of(context)!.profileCreationNicknameWarningTaken;
    } else {
      return null;
    }
  }

  void _resolveNickname(String nickname) async {
    if (nickname.length > 2 &&
        nickname.length < 16 &&
        RegExp(r"^[a-zA-Zа-яА-Я0-9]*$").hasMatch(nickname) &&
        nickname != _previouslyCheckedNickname) {
      _previouslyCheckedNickname = nickname;
      final response =
          await widget.userProfileRepository.checkNicknameIsFree(nickname);

      response.when(
          success: (data) {
            final responseIsNicknameFree = data as bool;
            if (_isNicknameFree != responseIsNicknameFree) {
              setState(() {
                _isNicknameFree = responseIsNicknameFree;
              });
              _formKey.currentState!.validate();
            }
          },
          failure: (failure, failureMessage) {}); //todo transfer to bloc and failure processing
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: MySimpleAppBar(
          leading: widget.isPoppable ? AppBarBackButton() : null,
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
                        child: Container(
                          child: Text(
                            AppLocalizations.of(context)!.profileCreationTitle,
                            style: MyTextStyles.authTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileImageChooser(
                          pickImage: _pickImage,
                          nicknameFocusNode: _nicknameFieldFocusNode),
                      SizedBox(height: 20),
                      MyTextField(
                        focusNode: _nicknameFieldFocusNode,
                        title: AppLocalizations.of(context)!
                            .profileCreationNickname,
                        textInputType: TextInputType.text,
                        isSecret: false,
                        textEditingController: _nicknameEditingController,
                        validatorFunction: _nicknameValidator,
                        fillColor: Colors.transparent,
                        activeBorderColor: MyColors.accent,
                        inactiveBorderColor: MyColors.main,
                      ),
                      SizedBox(height: 20),
                      MyOutlinedButton(
                        onTap: () {
                          _nicknameFieldFocusNode.unfocus();
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => _CitySelector(
                                    activeCity: _userCity,
                                    onSelected: _selectActiveCity,
                                  ));
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
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        text: _userCity.localizedName,
                        textStyle: MyTextStyles.body,
                        mainAxisAlignment: MainAxisAlignment.start,
                        trailingIcon: Icon(
                          Ionicons.chevron_down_outline,
                          color: MyColors.accent,
                          size: 26,
                        ),
                      ),
                      SizedBox(height: 20),
                      MyElevatedButton(
                        mainAxisAlignment: MainAxisAlignment.center,
                        leadingIcon: Image.asset(MyEmoji.finish, width: 20),
                        text: _buttonText,
                        buttonColor: MyColors.accent,
                        textStyle: MyTextStyles.buttonWithOppositeColor,
                        onTap: () {
                          _nicknameFieldFocusNode.unfocus();
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

class _CitySelector extends StatefulWidget {
  final City activeCity;
  final Function onSelected;
  _CitySelector({
    Key? key,
    required this.activeCity,
    required this.onSelected,
  }) : super(key: key);

  @override
  __CitySelectorState createState() => __CitySelectorState();
}

class __CitySelectorState extends State<_CitySelector> {
  late City _localActiveCity;
  late List<City> _cities;

  @override
  void initState() {
    super.initState();
    _localActiveCity = widget.activeCity;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cities = context.read<CityListProvider>().cityList;
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetContent(
        height: 350,
        iconData: Ionicons.location_outline,
        title: AppLocalizations.of(context)!.profileCreationChooseCityTitle,
        content: SelectionListView<City>(
          locations: _cities,
          activeLocation: _localActiveCity,
          onLocationTap: (City cityTapped) {
            setState(() {
              _localActiveCity = cityTapped;
            });
            widget.onSelected(cityTapped);
            Navigator.of(context).pop();
          },
        ));
  }
}
