import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../dto/wiki_data_dto.dart';
import '../../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/buttons/app_bar_button.dart';
import '../../../../my_navigation.dart';

class WikiSliverAppBar extends StatefulWidget {
  const WikiSliverAppBar({
    Key? key,
    required this.scrollController,
    required this.imageDimensions,
    required this.isBackButtonOn,
    required this.wikiData,
    required this.shareLink,
  }) : super(key: key);

  final ScrollController scrollController;
  final ImageDimensions? imageDimensions;
  final bool isBackButtonOn;
  final WikiDataDto wikiData;
  final Uri? shareLink;

  @override
  _WikiSliverAppBarState createState() => _WikiSliverAppBarState();
}

class _WikiSliverAppBarState extends State<WikiSliverAppBar> {
  double _backArrowOpacity = 0.5;
  static double _scrollOffsetFromWhichAppBarDarkeningStarts = 100.0;
  static late double _scrollOffsetFromWhichAppBarDarkeningEnds;
  late double flexibleSpaceHeight;
  late MyCachedNetworkImage _flexibleSpaceImage;
  late bool _showAppBarTitle;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
    _flexibleSpaceImage = MyCachedNetworkImage(widget.wikiData.imageLink);
    _showAppBarTitle = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    flexibleSpaceHeight = widget.imageDimensions == null
        ? MediaQuery.of(context).size.width / 2.5
        : (widget.imageDimensions!.imageHeight *
            MediaQuery.of(context).size.width /
            widget.imageDimensions!.imageWidth);
    _scrollOffsetFromWhichAppBarDarkeningEnds = flexibleSpaceHeight - 55;
    _scrollOffsetFromWhichAppBarDarkeningStarts =
        _scrollOffsetFromWhichAppBarDarkeningEnds - 40;
  }

  void _scrollListener() {
    var _calculatedBackArrowOpacity;
    var _calculatedShowAppBarTitle;
    if (widget.scrollController.offset <=
        _scrollOffsetFromWhichAppBarDarkeningStarts) {
      _calculatedBackArrowOpacity = 0.5;
      _calculatedShowAppBarTitle = false;
    } else if (widget.scrollController.offset >
            _scrollOffsetFromWhichAppBarDarkeningStarts &&
        widget.scrollController.offset <
            _scrollOffsetFromWhichAppBarDarkeningEnds) {
      _calculatedBackArrowOpacity = (_scrollOffsetFromWhichAppBarDarkeningEnds -
              widget.scrollController.offset) /
          (_scrollOffsetFromWhichAppBarDarkeningEnds -
              _scrollOffsetFromWhichAppBarDarkeningStarts) *
          0.5;
      _calculatedShowAppBarTitle = false;
    } else if (widget.scrollController.offset >=
        _scrollOffsetFromWhichAppBarDarkeningEnds) {
      _calculatedBackArrowOpacity = 0.0;
      _calculatedShowAppBarTitle = true;
    }

    if (_backArrowOpacity != _calculatedBackArrowOpacity) {
      if (mounted) {
        setState(() {
          _backArrowOpacity = _calculatedBackArrowOpacity;
        });
      }
    }

    if (_showAppBarTitle != _calculatedShowAppBarTitle) {
      if (mounted) {
        setState(() {
          _showAppBarTitle = _calculatedShowAppBarTitle;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: MyColors.screenBackground,
      leading: widget.isBackButtonOn
          ? AppBarButton(
              containerOpacity: _backArrowOpacity,
              iconWidget: Icon(
                Ionicons.chevron_back_outline,
                color: MyColors.main,
              ),
              onTap: Navigator.of(context).pop,
            )
          : null,
      actions: [
        widget.wikiData.type != WikiFollowableType.USER
            ? AppBarButton(
                containerOpacity: _backArrowOpacity,
                iconWidget: Icon(
                  Ionicons.share_outline,
                  color: MyColors.main,
                ),
                onTap: () => NavigatorFunctions.pushShareWiki(
                  context: context,
                  shareLink: widget.shareLink!, //todo risky
                  wikiData: widget.wikiData,
                  imageDimensions: widget.imageDimensions,
                ),
              )
            : Container()
      ],

      centerTitle: true,
      title: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: _showAppBarTitle ? 1.0 : 0.0,
        child: SizedBox(
          //todo dont know how to calculate for different devices
          width: MyConstants.appBarTitleWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.wikiData.name,
                style: MyTextStyles.appBarTitle,
                overflow: TextOverflow.fade,
              ),
              Text(
                widget.wikiData.type.getNameSingular(context),
                style: MyTextStyles.appBarSubtitle,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      expandedHeight: flexibleSpaceHeight,
      //* Can't stretch inside nested scroll view with custom scroll view inside. The bug is opened on Github
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: _flexibleSpaceImage,
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
      ),
    );
  }
}
