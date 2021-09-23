import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../../../core/navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../search/state/cubit/search_cubit.dart';
import '../../../wiki/ui/screens/wiki_screen.dart';
import '../../../wiki/ui/widgets/button_with_icons.dart';
import '../../../wiki/ui/widgets/wiki_expandable_text_description.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/user/user_profile.dart';
import '../../../../core/presentation/widgets/details_horizontal_scrollable_list.dart';
import '../../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../../../../core/presentation/widgets/null_check_wrapper.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationCubit>(context).updateAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        late Widget screenToReturn;
        state.maybeWhen(
            initial: () => screenToReturn = LoadingScreen(),
            authenticated: (userProfile) =>
                screenToReturn = ProfileScreen(userProfile: userProfile),
            authenticatedWithoutAccount: () => screenToReturn =
                CreateUserProfileScreen(
                    isPoppable: false, userProfileRepository: serviceLocator()),
            unauthenticated: () => screenToReturn = SignInMethodsScreen(
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
  static late String _profileType;
  late ScrollController _scrollController;
  late MyCachedNetworkImage _image;
  late ImageDimensions? _imageDimensions;
  late _ProfileDetails _profileDetails;
  late Map<String, Widget> _userAccountDetails;

  @override
  void initState() {
    super.initState();
    _scrollController = TabItem.PROFILE.tabScrollController;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _image = MyCachedNetworkImage(widget.userProfile.imageLink);
    Future.delayed(
        Duration.zero,
        () async =>
            _imageDimensions = await ImageDimensions.getImageInfo(_image));
    _profileType = AppLocalizations.of(context)!.userEntityNameSingular;
    _userAccountDetails = {
      AppLocalizations.of(context)!.profileStatisticsFollowsCount:
          Text(0.toString(), style: MyTextStyles.body),
      AppLocalizations.of(context)!.profileStatisticsEventsAttended:
          Text(0.toString(), style: MyTextStyles.body),
      AppLocalizations.of(context)!.profileStatisticsLocationsOpened:
          Text(0.toString(), style: MyTextStyles.body),
      AppLocalizations.of(context)!.profileStatisticsDonations:
          Text('0₽', style: MyTextStyles.body)
    };
    _profileDetails = _ProfileDetails(
      userProfile: widget.userProfile,
      profileDetails: _userAccountDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WikiScreen(
      wikiType: _profileType,
      scrollController: _scrollController,
      wikiDetails: _profileDetails,
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
  final Map<String, Widget> profileDetails;
  const _ProfileDetails({
    Key? key,
    required this.userProfile,
    required this.profileDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        MyElevatedButton(
          //todo
          onTap: () {},
          leadingIcon: Icon(
            Ionicons.bookmark,
            size: 23,
            color: MyColors.mainOppositeColor,
          ),
          distanceBetweenLeadingAndText: 7,
          buttonColor: MyColors.accent,
          mainAxisAlignment: MainAxisAlignment.center,
          text: AppLocalizations.of(context)!.profileShowMyFollows,
          textStyle: MyTextStyles.buttonWithOppositeColor,
        ),
        SizedBox(height: 25),
        DetailsHorizontalScrollableList(titleBodyMap: profileDetails),
        SocialLinksList(
          instagramLink: userProfile.instagramLink,
          telegramLink: userProfile.telegramLink,
        ),
        SectionSpacer(),
        NullCheckWrapper(
          toBeChecked: userProfile.about,
          children: [
            WikiExpandableTextDescription(
              userProfile.about!,
            ),
            SectionSpacer(),
          ],
        ),
        SectionTitle(
            sectionTitle: AppLocalizations.of(context)!.profileCurrentCity),
        ButtonWithIcons(
          leadingIcon: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: MyColors.forVeryDarkStuff,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Text(
                userProfile.currentCity.country.emojiCode,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          buttonText: userProfile.currentCity.localizedName,
          trailingIcon: Icon(
            Ionicons.chevron_down,
            size: 26,
            color: MyColors.accent,
          ),
          //todo
          onButtonTap: () {},
          verticalPadding: 14,
        ),
        SectionDivider(needHorizontalMargin: true),
        SectionSpacer(),
        SectionSpacer(),
        MyElevatedButton(
          text: AppLocalizations.of(context)!.profileSignOut,
          buttonColor: MyColors.main,
          textStyle: MyTextStyles.buttonWithOppositeColor,
          onTap: () => BlocProvider.of<AuthenticationCubit>(context).singOut(),
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SectionSpacer(),
        MyElevatedButton(
          //todo
          text: 'Clear search history',
          buttonColor: MyColors.main,
          textStyle: MyTextStyles.buttonWithOppositeColor,
          onTap: () => BlocProvider.of<SearchCubit>(context).removeAllSearchRecords(),
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    );
  }
}
