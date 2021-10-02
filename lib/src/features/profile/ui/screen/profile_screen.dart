import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/buttons/button_content.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/buttons/my_outlined_button.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/modal_bottom_sheet_content.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_horizontal_padding.dart';
import 'package:the_postraves_app/src/core/provider/city_list_provider.dart';
import 'package:the_postraves_app/src/core/provider/current_city_provider.dart';
import 'package:the_postraves_app/src/core/service/open_link_service.dart';
import 'package:the_postraves_app/src/features/shows/ui/widgets/current_city_switcher.dart';
import 'package:the_postraves_app/src/models/geo/city.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../../../core/navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../../my_navigation.dart';
import '../../../wiki/ui/screens/wiki_canvas.dart';
import '../../../wiki/ui/widgets/button_with_icons.dart';
import '../../../wiki/ui/widgets/wiki_expandable_text_description.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/user/user_profile.dart';
import '../../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'create_user_profile_screen.dart';
import 'sign_in_methods_screen.dart';
import '../../../wiki/dto/wiki_data_dto.dart';
import '../../../../core/presentation/widgets/animations/my_slide_animated_switcher.dart';
import '../../../../dependency_injection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        Widget screenToReturn = const LoadingScreen();
        state.maybeWhen(
            loading: () => screenToReturn = const LoadingScreen(),
            authenticated: (userProfile) =>
                screenToReturn = ProfileScreen(userProfile: userProfile),
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
  final UserProfile userProfile;
  const ProfileScreen({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _profileType;
  final ScrollController _scrollController =
      TabItem.profile.tabScrollController;
  MyCachedNetworkImage? _image;
  ImageDimensions? _imageDimensions;
  _ProfileDetails? _profileDetails;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _image = MyCachedNetworkImage(widget.userProfile.imageLink);

    Future.delayed(
        Duration.zero,
        () async =>
            _imageDimensions = await ImageDimensions.getImageInfo(_image!));

    _profileType = AppLocalizations.of(context)!.userEntityNameSingular;

    _profileDetails = _ProfileDetails(
      userProfile: widget.userProfile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WikiCanvas(
      wikiType: _profileType!, //todo ! ok?
      scrollController: _scrollController,
      wikiDetails: _profileDetails!,
      imageDimensions: _imageDimensions,
      isBackButtonOn: false,
      wikiData: WikiDataDto(
        id: widget.userProfile.id,
        name: widget.userProfile.name,
        imageLink: widget.userProfile.imageLink,
        overallFollowers: widget.userProfile.overallFollowers,
        type: WikiFollowableType.USER,
      ),
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  final UserProfile userProfile;
  const _ProfileDetails({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        MyElevatedButton(
          //todo
          onTap: () {},
          leadingIcon: const Icon(
            Ionicons.bookmark,
            size: 18,
            color: MyColors.mainOppositeColor,
          ),
          distanceBetweenLeadingAndText: 7,
          buttonColor: MyColors.accent,
          mainAxisAlignment: MainAxisAlignment.center,
          text: AppLocalizations.of(context)!.profileShowMyFollows,
          textStyle: MyTextStyles.buttonWithOppositeColor,
        ),
        const SizedBox(height: 25),
        SocialLinksList(
          instagramLink: userProfile.instagramLink,
          telegramLink: userProfile.telegramLink,
        ),
        const SectionSpacer(),
        userProfile.about == null
            ? Container()
            : Column(
                children: [
                  WikiExpandableTextDescription(
                    userProfile.about!,
                  ),
                  const SectionSpacer(),
                ],
              ),
        SectionTitle(
            sectionTitle: AppLocalizations.of(context)!.profileCurrentCity),
        ButtonWithIcons(
          leadingIcon: Text(
            userProfile.currentCity.country.emojiCode,
            style: const TextStyle(fontSize: 20),
          ),
          buttonText: userProfile.currentCity.localName,
          trailingIcon: const Icon(
            Ionicons.chevron_down,
            size: 26,
            color: MyColors.accent,
          ),
          //todo
          onButtonTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => CurrentCitySwitcher(
              currentCity: context.watch<CurrentCityProvider>().currentCity!,
              cities: context.watch<CityListProvider>().cityList,
              onSelected: (City newCurrentCity) => context
                  .read<CurrentCityProvider>()
                  .changeCurrentCity(newCurrentCity),
            ),
          ),
          verticalPadding: 14,
        ),
        const SectionDivider(needHorizontalMargin: true),
        const SectionSpacer(),
        const SectionSpacer(),
        MyOutlinedButton(
          leadingIcon: const Icon(
            Ionicons.cog_outline,
            size: 20,
            color: MyColors.main,
          ),
          text: AppLocalizations.of(context)!.settings,
          borderColor: MyColors.main,
          // buttonColor: MyColors.forEventCard,
          textStyle: MyTextStyles.buttonWithMainColor,
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => SettingsList(),
          ),
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        // MyElevatedButton(
        //   text: AppLocalizations.of(context)!.profileSignOut,
        //   buttonColor: MyColors.main,
        //   textStyle: MyTextStyles.buttonWithOppositeColor,
        //   onTap: () => BlocProvider.of<AuthenticationCubit>(context).singOut(),
        //   mainAxisAlignment: MainAxisAlignment.center,
        // ),
        // const SectionSpacer(),
        // MyElevatedButton(
        //   //todo
        //   text: 'Clear search history',
        //   buttonColor: MyColors.main,
        //   textStyle: MyTextStyles.buttonWithOppositeColor,
        //   onTap: () =>
        //       BlocProvider.of<SearchCubit>(context).removeAllSearchRecords(),
        //   mainAxisAlignment: MainAxisAlignment.center,
        // )
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

class SettingsList extends StatelessWidget {
  final List<_SettingsButtonData> settingsList = [
    _SettingsButtonData(
      text: 'Modify profile',
      leadingIcon:
          Icon(Ionicons.clipboard_outline, color: MyColors.main, size: 18),
      onTap: (BuildContext context) =>
          NavigatorFunctions.pushUpdateUser(context),
    ),
    _SettingsButtonData(
      text: 'Write to us',
      leadingIcon:
          Icon(Ionicons.chatbox_outline, color: MyColors.main, size: 18),
      onTap: (_) => OpenLinkService.openUrl("https://t.me/mmazurovsky"),
    ),
    _SettingsButtonData(
      text: 'Sign out',
      leadingIcon:
          Icon(Ionicons.log_out_outline, color: MyColors.main, size: 18),
      onTap: (BuildContext context) =>
          BlocProvider.of<AuthenticationCubit>(context).deleteMyProfile(),
    ),
    _SettingsButtonData(
      text: 'Delete profile',
      leadingIcon: Icon(Ionicons.close_circle_outline, color: MyColors.main, size: 18),
      onTap: (BuildContext context) =>
          BlocProvider.of<AuthenticationCubit>(context).deleteMyProfile(),
    ),
  ];

  SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetContent(
      height: MediaQuery.of(context).size.height * 0.5,
      iconData: Ionicons.cog_outline,
      title: 'Settings', //todo
      content: ListView.separated(
        padding: EdgeInsets.only(top: 10),
        physics: NeverScrollableScrollPhysics(),
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
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 7),
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
      ),
    );
  }
}
