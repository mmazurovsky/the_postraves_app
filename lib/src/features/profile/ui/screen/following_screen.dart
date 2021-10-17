import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/app_bar_back_button.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/app_bar_title.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/ending_of_screen.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/entity_presentation/followable_item.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/event_tab.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/loading_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_horizontal_padding.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_spacers.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/placeholder_container.dart';
import 'package:the_postraves_app/src/core/utils/my_colors.dart';
import 'package:the_postraves_app/src/core/utils/my_text_styles.dart';
import 'package:the_postraves_app/src/features/profile/state/following_cubit/following_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/column_of_custom_cards.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/short_event_card_item.dart';
import 'package:the_postraves_app/src/models/dto/image_dimensions.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_app/src/models/shorts/artist_short.dart';
import 'package:the_postraves_app/src/models/shorts/event_short.dart';
import 'package:the_postraves_app/src/models/shorts/place_short.dart';
import 'package:the_postraves_app/src/models/shorts/unity_short.dart';

import '../../../../my_navigation.dart';

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
      AppLocalizations.of(context)!.eventEntityNamePlural,
      AppLocalizations.of(context)!.artistEntityNamePlural,
      AppLocalizations.of(context)!.placeEntityNamePlural,
      AppLocalizations.of(context)!.unityEntityNamePlural,
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
          title: AppLocalizations.of(context)!.yourFollowing,
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
          if (state is FollowingLoadedState) {
            return TabBarView(
              controller: _tabController,
              children: [
                _FollowableTabBarView<EventShort>(
                  AppLocalizations.of(context)!.eventEntityNamePlural,
                  state.events,
                  (EventShort event) => ShortEventCardItem(event),
                ),
                _FollowableTabBarView<ArtistShort>(
                  AppLocalizations.of(context)!.artistEntityNamePlural,
                  state.artists,
                  (ArtistShort artist) => FollowableItem(
                    entity: artist,
                    onItemTap: (context, ArtistShort entity,
                            ImageDimensions? imageDimensions) =>
                        NavigatorFunctions.pushFollowable(
                      context: context,
                      wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
                    ),
                  ),
                ),
                _FollowableTabBarView<PlaceShort>(
                  AppLocalizations.of(context)!.placeEntityNamePlural,
                  state.places,
                  (PlaceShort place) => FollowableItem(
                    entity: place,
                    onItemTap: (context, PlaceShort entity,
                            ImageDimensions? imageDimensions) =>
                        NavigatorFunctions.pushFollowable(
                      context: context,
                      wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
                    ),
                  ),
                ),
                _FollowableTabBarView<UnityShort>(
                  AppLocalizations.of(context)!.unityEntityNamePlural,
                  state.unities,
                  (UnityShort unity) => FollowableItem(
                    entity: unity,
                    onItemTap: (context, UnityShort entity,
                            ImageDimensions? imageDimensions) =>
                        NavigatorFunctions.pushFollowable(
                      context: context,
                      wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const LoadingContainer();
          }
        },
      ),
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
                          "You don't follow ${_entityName.toLowerCase()} yet.\nStart following ${_entityName.toLowerCase()} and they will appear here.",
                      style: MyTextStyles.body,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
