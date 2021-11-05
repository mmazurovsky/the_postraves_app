import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/common/widgets/animations/my_slide_animated_switcher.dart';
import 'package:the_postraves_app/src/common/widgets/other/column_of_custom_cards.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/app_bar/app_bar_back_button.dart';
import '../../../../common/widgets/app_bar/app_bar_title.dart';
import '../../../../common/widgets/entity_presentation/followable_item.dart';
import '../../../../common/widgets/other/event_tab.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/placeholder_container.dart';
import '../../../../common/widgets/other/short_event_card_item.dart';
import '../../../../common/widgets/spacers/ending_of_screen.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/navigation/my_navigation.dart';
import '../../state/following_cubit/following_cubit.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<String> _tabNames;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FollowingCubit>(context).loadFollowing();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabNames = [
      'eventEntityNamePlural'.tr(),
      'artistEntityNamePlural'.tr(),
      'placeEntityNamePlural'.tr(),
      'unityEntityNamePlural'.tr(),
    ];
    _tabController =
        TabController(length: _tabNames.length, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      appBar: AppBar(
        backgroundColor: MyColors.screenBackground,
        leading: const AppBarBackButton(),
        title: AppBarTitle(
          title: 'yourFollowing'.tr(),
        ),
        bottom: TabBar(
          isScrollable: true,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2,
              color: MyColors.accent,
            ),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          labelColor: MyColors.accent,
          unselectedLabelColor: MyColors.main,
          tabs: _tabNames.map((tabName) => EventTab(tabName: tabName)).toList(),
          controller: _tabController,
        ),
      ),
      body: BlocBuilder<FollowingCubit, FollowingState>(
          builder: (context, state) {
        return MySlideAnimatedSwitcher(
          child: state is FollowingLoadedState
              ? TabBarView(
                  controller: _tabController,
                  children: [
                    _FollowableTabBarView<EventShort>(
                      'eventEntityNamePlural'.tr(),
                      state.events,
                      (EventShort event) => ShortEventCardItem(event),
                    ),
                    _FollowableTabBarView<ArtistShort>(
                      'artistEntityNamePlural'.tr(),
                      state.artists,
                      (ArtistShort artist) => FollowableItem(
                        key: ValueKey(artist.id),
                        entity: artist,
                        onItemTap: (context, ArtistShort entity,
                                ImageDimensions? imageDimensions) =>
                            NavigatorFunctions.pushFollowable(
                          context: context,
                          followableData:
                              entity.convertToFollowableData(imageDimensions),
                        ),
                      ),
                    ),
                    _FollowableTabBarView<PlaceShort>(
                      'placeEntityNamePlural'.tr(),
                      state.places,
                      (PlaceShort place) => FollowableItem(
                        key: ValueKey(place.id),
                        entity: place,
                        onItemTap: (context, PlaceShort entity,
                                ImageDimensions? imageDimensions) =>
                            NavigatorFunctions.pushFollowable(
                          context: context,
                          followableData:
                              entity.convertToFollowableData(imageDimensions),
                        ),
                      ),
                    ),
                    _FollowableTabBarView<UnityShort>(
                      'unityEntityNamePlural'.tr(),
                      state.unities,
                      (UnityShort unity) => FollowableItem(
                        key: ValueKey(unity.id),
                        entity: unity,
                        onItemTap: (context, UnityShort entity,
                                ImageDimensions? imageDimensions) =>
                            NavigatorFunctions.pushFollowable(
                          context: context,
                          followableData:
                              entity.convertToFollowableData(imageDimensions),
                        ),
                      ),
                    ),
                  ],
                )
              : const LoadingContainer(),
        );
      }),
    );
  }
}

class _FollowableTabBarView<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final String _entityName;
  final List<T> _followables;
  final Widget Function(T followable) _widgetBuilder;
  const _FollowableTabBarView(
      this._entityName, this._followables, this._widgetBuilder,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _followables.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyMediumSpacer(),
                ColumnOfCustomCards<T>(
                  entities: _followables,
                  buildCard: (T followable) => _widgetBuilder(followable),
                ),
                const EndingOfScreen(),
              ],
            )
          : PlaceholderContainer(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'notFollowingEntity'.tr(args: [_entityName]),
                      style: MyTextStyles.body,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
