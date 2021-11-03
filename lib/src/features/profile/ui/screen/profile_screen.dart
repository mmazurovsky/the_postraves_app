import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/user/user_profile.dart';
import 'package:the_postraves_package/service/open_link_service.dart';
import '../../../../common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/geo_provider/city_list_provider.dart';
import '../../../../common/geo_provider/current_city_provider.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/animations/my_slide_animated_switcher.dart';
import '../../../../common/widgets/buttons/button_content.dart';
import '../../../../common/widgets/buttons/my_outlined_button_without_padding.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../common/widgets/other/social_links_list.dart';
import '../../../../common/widgets/selectors/current_city_selector.dart';
import '../../../../common/widgets/selectors/modal_bottom_sheet_content.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import '../../../../dependency_injection.dart';
import '../../../../common/navigation/my_navigation.dart';
import '../../../wiki/ui/screens/wiki_canvas.dart';
import '../../../wiki/ui/widgets/about_section.dart';
import '../../../wiki/ui/widgets/button_with_icons.dart';
import '../../../wiki/ui/widgets/wiki_subtitle.dart';
import 'create_user_profile_screen.dart';
import 'sign_in_methods_screen.dart';

class ProfileScreenResolver extends StatefulWidget {
  const ProfileScreenResolver({Key? key}) : super(key: key);

  @override
  _ProfileScreenResolverState createState() => _ProfileScreenResolverState();
}

class _ProfileScreenResolverState extends State<ProfileScreenResolver> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        Widget screenToReturn = const LoadingContainer();
        state.maybeWhen(
            loading: () => screenToReturn = const LoadingContainer(),
            authenticated: (_) => screenToReturn = const ProfileScreen(),
            authenticatedWithoutAccount: () => screenToReturn =
                CreateUserProfileScreen(
                    isPoppable: false, userProfileRepository: serviceLocator()),
            unauthenticated: () => screenToReturn = const SignInMethodsScreen(
                  isPoppable: false,
                ),
            orElse: () {});
        return MySlideAnimatedSwitcher(child: screenToReturn);
      },
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController =
      TabItem.profile.tabScrollController;
  _ProfileDetails? _profileDetails;
  // late MyCachedNetworkImage _myCachedNetworkImage;
  // ImageDimensions? _imageDimensions;
  late UserProfile _userProfile;
  late FollowableData _followableData;
  // late ImageDimensions? _imageDimensions;

  @override
  void initState() {
    super.initState();
    _userProfile = context.read<AuthenticationCubit>().currentUserFromBackend!;
    _followableData = FollowableData(
      id: _userProfile.id,

      ///* default value is used because getting dimensions for profile
      ///* image link doesn't work for some reason here
      imageDimensions: _userProfile.imageLink != null
          ? ImageDimensions(height: ScreenSize.width, width: ScreenSize.width)
          : null,
      imageLink: _userProfile.imageLink,
      name: _userProfile.name,
      type: FollowableType.USER,
    );
    _profileDetails = _ProfileDetails(
      userProfile: _userProfile,
    );

    // final _myCachedNetworkImage = MyCachedNetworkImage(_userProfile.imageLink);
    // ImageDimensions? _imageDimensions;

    // * I DON'T FUCKING KNOW WHY THIS FUTURE NEVER GETS RESOLVED
    // Future.delayed(
    //   Duration.zero,
    //   () async =>
    //       _imageDimensions = await _myCachedNetworkImage.getImageDimensions(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return WikiCanvas(
      followableData: _followableData,
      wikiContent: _profileDetails!,
      scrollController: _scrollController,
      isBackButtonOn: false,
    );
  }
}

class _ProfileDetails extends StatefulWidget {
  final UserProfile userProfile;
  const _ProfileDetails({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  State<_ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<_ProfileDetails> {
  void _closeModalBottomSheetAndPushModifyProfile(
      void Function(BuildContext) function) {
    Navigator.of(context).pop();
    Future.delayed(
      const Duration(milliseconds: 300),
      () => function(context),
      // NavigatorFunctions.pushModifyUser(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        WikiSubtitle(
          entityType: FollowableType.USER,
          overallFollowers: widget.userProfile.overallFollowers,
        ),
        const MyBigSpacer(),
        MyHorizontalPadding(
          child: Row(
            children: [
              Expanded(
                child: MyOutlinedButtonWithoutPadding(
                  text: 'openSettings'.tr(),
                  borderColor: MyColors.main,
                  // buttonColor: MyColors.forEventCard,
                  textStyle: MyTextStyles.buttonWithMainColor,
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => SettingsSelector(
                        _closeModalBottomSheetAndPushModifyProfile),
                  ),
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => NavigatorFunctions.pushBookmarks(context),
                child: Container(
                  height: MyConstants.heightOfContainers,
                  width: MyConstants.heightOfContainers,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.accent, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Ionicons.heart,
                    size: 24,
                    color: MyColors.accent,
                  ),
                ),
              ),
            ],
          ),
        ),
        SocialLinksList(
          instagramUsername: widget.userProfile.instagramUsername,
          telegramUsername: widget.userProfile.telegramUsername,
        ),
        AboutSection(widget.userProfile.about),
        const MyBigSpacer(),
        const SectionDivider(needHorizontalMargin: true),
        const MyMediumPlusSpacer(),
        SectionTitle(
          sectionTitle: 'profileCurrentCity'.tr(),
        ),
        const MySmallestSpacer(),
        ButtonWithIcons(
          leadingIcon: Text(
            widget.userProfile.currentCity.country.emojiCode,
            style: const TextStyle(fontSize: 20),
          ),
          buttonText: widget.userProfile.currentCity.localName,
          trailingIcon: const Icon(
            Ionicons.chevron_down,
            size: 26,
            color: MyColors.accent,
          ),
          onButtonTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => CurrentCitySelector(
              currentCity: context.watch<CurrentCityProvider>().currentCity!,
              cities: context.watch<CityListProvider>().cityList,
              onSelected: (City newCurrentCity) => context
                  .read<CurrentCityProvider>()
                  .changeCurrentCity(newCurrentCity),
            ),
          ),
          verticalPadding: 14,
        ),
      ],
    );
  }
}

class _SettingsButtonData {
  final String text;
  final Widget leadingIcon;
  final void Function(BuildContext) onTap;

  _SettingsButtonData({
    required this.text,
    required this.leadingIcon,
    required this.onTap,
  });
}

class SettingsSelector extends StatelessWidget {
  final void Function(void Function(BuildContext) argFunction)
      _functionToCloseModalBottomSheetAndDoSomething;
  const SettingsSelector(this._functionToCloseModalBottomSheetAndDoSomething,
      {Key? key})
      : super(key: key);

  List<_SettingsButtonData> _getSettingsList(BuildContext context) {
    return [
      _SettingsButtonData(
        text: 'modifyProfile'.tr(),
        leadingIcon: const Icon(Ionicons.clipboard_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
            (BuildContext ctx) => NavigatorFunctions.pushModifyUser(ctx)),
      ),
      _SettingsButtonData(
        text: 'writeToUs'.tr(),
        leadingIcon: const Icon(Ionicons.chatbox_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
            (BuildContext _) => OpenLinkService.openTelegram(
                MyConstants.telegramSupportAccount)),
      ),
      _SettingsButtonData(
        text: 'signOut'.tr(),
        leadingIcon: const Icon(Ionicons.log_out_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext ctx) =>
              BlocProvider.of<AuthenticationCubit>(ctx).signOut(),
        ),
      ),
      _SettingsButtonData(
        text: 'deleteProfile'.tr(),
        leadingIcon: const Icon(Ionicons.close_circle_outline,
            color: MyColors.main, size: 18),
        onTap: (BuildContext _) =>
            _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext ctx) =>
              BlocProvider.of<AuthenticationCubit>(ctx).deleteMyProfile(),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsList = _getSettingsList(context);
    return ModalBottomSheetContent(
      height: ScreenSize.height * 0.4,
      iconData: Ionicons.settings_outline,
      title: 'settings'.tr(),
      content: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: settingsList.length,
        separatorBuilder: (_, i) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return SettingsButton(settingsList[index]);
        },
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final _SettingsButtonData data;
  const SettingsButton(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => data.onTap(context),
      child: MyHorizontalPadding(
        child: ButtonContent(
          leading: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: data.leadingIcon,
          ),
          distanceBetweenLeadingAndText: 13,
          text: data.text,
          textStyle: MyTextStyles.modalBottomSheetItem,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
