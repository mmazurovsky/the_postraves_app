import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/utils/followable_type_utils.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/app_bar/app_bar_button.dart';
import '../../../../common/widgets/image/my_cached_network_image.dart';
import '../../../../common/navigation/my_navigation.dart';

class WikiSliverAppBar extends StatefulWidget {
  const WikiSliverAppBar({
    Key? key,
    required this.scrollController,
    required this.isBackButtonOn,
    required this.isShareButtonOn,
    required this.followableData,
    required this.shareLink,
  }) : super(key: key);

  final ScrollController scrollController;
  final bool isBackButtonOn;
  final bool isShareButtonOn;
  final FollowableData followableData;
  final Uri? shareLink;

  @override
  _WikiSliverAppBarState createState() => _WikiSliverAppBarState();
}

class _WikiSliverAppBarState extends State<WikiSliverAppBar> {
  double _backArrowOpacity = 0.5;
  late double _scrollOffsetFromWhichAppBarDarkeningStarts;
  late double _scrollOffsetFromWhichAppBarDarkeningEnds;
  late double flexibleSpaceHeight;
  late MyCachedNetworkImage _flexibleSpaceImage;
  late bool _showAppBarTitle;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
    _flexibleSpaceImage = MyCachedNetworkImage(widget.followableData.imageLink);
    _showAppBarTitle = false;
    flexibleSpaceHeight = widget.followableData.imageDimensions == null
        ? ScreenSize.width / 2.5
        : (widget.followableData.imageDimensions!.height *
            ScreenSize.width /
            widget.followableData.imageDimensions!.width);
    _scrollOffsetFromWhichAppBarDarkeningEnds = flexibleSpaceHeight - 55;
    _scrollOffsetFromWhichAppBarDarkeningStarts =
        _scrollOffsetFromWhichAppBarDarkeningEnds - 40;
  }

  void _scrollListener() {
    double _calculatedBackArrowOpacity = 0.5;
    bool _calculatedShowAppBarTitle = false;

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
              iconWidget: const Icon(
                Ionicons.chevron_back_outline,
                color: MyColors.main,
              ),
              onTap: Navigator.of(context).pop,
            )
          : null,
      actions: widget.isShareButtonOn
          ? [
              AppBarButton(
                containerOpacity: _backArrowOpacity,
                iconWidget: const Icon(
                  Ionicons.share_outline,
                  color: MyColors.main,
                ),
                onTap: () => widget.shareLink != null
                    ? NavigatorFunctions.pushShareWiki(
                        context: context,
                        shareLink: widget.shareLink!,
                        followableData: widget.followableData,
                      )
                    : {},
              )
            ]
          : null,

      centerTitle: true,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _showAppBarTitle ? 1.0 : 0.0,
        child: SizedBox(
          width: MyConstants.appBarTitleWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.followableData.name,
                style: MyTextStyles.appBarTitle,
                overflow: TextOverflow.fade,
              ),
              Text(
                FollowableTypeUtils.getTranslationSingularForType(
                    widget.followableData.type),
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
