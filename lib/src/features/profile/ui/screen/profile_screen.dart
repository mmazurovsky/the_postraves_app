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
import 'package:the_postraves_app/src/core/utils/screen_size.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/current_city_selector.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_subtitle.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_title.dart';
import 'package:the_postraves_app/src/models/dto/wiki_data_dto.dart';
import 'package:the_postraves_app/src/models/geo/city.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../../../core/navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../../../my_navigation.dart';
import '../../../wiki/ui/screens/wiki_canvas.dart';
import '../../../wiki/ui/widgets/button_with_icons.dart';
import '../../../wiki/ui/widgets/wiki_expandable_text_description.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/user/user_profile.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'create_user_profile_screen.dart';
import 'sign_in_methods_screen.dart';
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
  late WikiDataDto _wikiDataDto;

  @override
  void initState() {
    super.initState();
    _userProfile = context.read<AuthenticationCubit>().currentUserFromBackend!;
    _wikiDataDto = WikiDataDto(
      id: _userProfile.id,

      ///* default value is used because getting dimensions for profile
      ///* image link doesn't work for some reason here
      imageDimensions: ImageDimensions(height: ScreenSize.width, width: ScreenSize.width),
      imageLink: _userProfile.imageLink,
      name: _userProfile.name,
      type: WikiFollowableType.USER,
    );
    _profileDetails = _ProfileDetails(
      userProfile: _userProfile,
    );
    // _myCachedNetworkImage = MyCachedNetworkImage(widget.userProfile.imageLink);
    // _assignImageDimensions();

    // Future.delayed(
    // Duration.zero,
    // () async =>
    //     _imageDimensions = await ImageDimensions.getImageDimensions(_myCachedNetworkImage));
  }

  // void _assignImageDimensions() async {
  //   final imageDimensions =
  //       //* I DON'T FUCKING KNOW WHY THIS FUTURE NEVER GETS RESOLVED
  //       // await ImageDimensions.getImageDimensions(_myCachedNetworkImage);
  //       widget.userProfile.imageLink != null
  //           ? ImageDimensions(ScreenSize.width, ScreenSize.width)
  //           : null;
  //   setState(() {
  //     _imageDimensions = imageDimensions;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return WikiCanvas(
      wikiDataDto: _wikiDataDto,
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
  void _closeModalBottomSheetAndPushModifyProfile() {
    Navigator.of(context).pop();
    Future.delayed(
      const Duration(milliseconds: 300),
      () => NavigatorFunctions.pushModifyUser(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WikiSubtitle(
          entityType: WikiFollowableType.USER,
        ),
        SizedBox(height: 20),
        WikiTitle(title: widget.userProfile.name),
        SizedBox(height: 8),
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
        const SectionDivider(
          needHorizontalMargin: true,
        ),
        SocialLinksList(
          instagramUsername: widget.userProfile.instagramUsername,
          telegramUsername: widget.userProfile.telegramUsername,
        ),
        const SectionSpacer(),
        widget.userProfile.about == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WikiExpandableTextDescription(
                    widget.userProfile.about!,
                  ),
                  const SectionSpacer(),
                  SectionDivider(needHorizontalMargin: true),
                  SectionSpacer(),
                ],
              ),
        SectionTitle(
            sectionTitle: AppLocalizations.of(context)!.profileCurrentCity),
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
        const SectionDivider(needHorizontalMargin: true),
        const SectionSpacer(),
        const SectionSpacer(),
        MyOutlinedButton(
          leadingIcon: const Icon(
            Ionicons.cog_outline,
            size: 20,
            color: MyColors.main,
          ),
          text: AppLocalizations.of(context)!.openSettings,
          borderColor: MyColors.main,
          // buttonColor: MyColors.forEventCard,
          textStyle: MyTextStyles.buttonWithMainColor,
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) =>
                SettingsSelector(_closeModalBottomSheetAndPushModifyProfile),
          ),
          mainAxisAlignment: MainAxisAlignment.center,
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
  final void Function() _functionToCloseModalBottomSheetAndNavigateToNewScreen;
  const SettingsSelector(
      this._functionToCloseModalBottomSheetAndNavigateToNewScreen,
      {Key? key})
      : super(key: key);

  List<_SettingsButtonData> _getSettingsList(BuildContext context) {
    return [
      _SettingsButtonData(
        text: AppLocalizations.of(context)!.modifyProfile,
        leadingIcon: const Icon(Ionicons.clipboard_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndNavigateToNewScreen(),
      ),
      _SettingsButtonData(
        text: AppLocalizations.of(context)!.writeToUs,
        leadingIcon: const Icon(Ionicons.chatbox_outline,
            color: MyColors.main, size: 18),
        onTap: (_) =>
            OpenLinkService.openUrl("https://t.me/mmazurovsky"), //todo
      ),
      _SettingsButtonData(
        text: AppLocalizations.of(context)!.signOut,
        leadingIcon: const Icon(Ionicons.log_out_outline,
            color: MyColors.main, size: 18),
        onTap: (BuildContext context) =>
            BlocProvider.of<AuthenticationCubit>(context).signOut(),
      ),
      _SettingsButtonData(
        text: AppLocalizations.of(context)!.deleteProfile,
        leadingIcon: const Icon(Ionicons.close_circle_outline,
            color: MyColors.main, size: 18),
        onTap: (BuildContext context) =>
            BlocProvider.of<AuthenticationCubit>(context)
                .deleteMyProfile(), //todo check working
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsList = _getSettingsList(context);
    return ModalBottomSheetContent(
      height: ScreenSize.height * 0.4,
      iconData: Ionicons.cog_outline,
      title: AppLocalizations.of(context)!.settings, //todo
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
