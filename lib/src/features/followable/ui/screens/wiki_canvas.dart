import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/common/utils/followable_type_utils.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_data.dart';

import '../../../../common/configs/dynamic_link_configurer.dart';
import '../../../../common/widgets/spacers/ending_of_screen.dart';
import '../widgets/wiki_sliver_app_bar.dart';
import '../widgets/wiki_title.dart';

class WikiCanvas extends StatefulWidget {
  final FollowableData followableData;
  final bool isBackButtonOn;
  final bool isShareButtonOn;
  final Widget wikiContent;
  final ScrollController? scrollController;

  const WikiCanvas({
    Key? key,
    required this.followableData,
    required this.wikiContent,
    this.isBackButtonOn = true,
    this.isShareButtonOn = true,
    this.scrollController,
  }) : super(key: key);

  @override
  _WikiCanvasState createState() => _WikiCanvasState();
}

class _WikiCanvasState extends State<WikiCanvas> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Uri> _setShareLinkToPage() async {
    final imageDimensions = widget.followableData.imageDimensions;
    String _pathToPage =
        '${FollowableTypeUtils.getNavigationRouteForType(widget.followableData.type)}?id=${widget.followableData.id}&name=${widget.followableData.name}';
    if (widget.followableData.imageLink != null) {
      _pathToPage +=
          _pathToPage + '&imageLink=${widget.followableData.imageLink}';
    }
    if (widget.followableData.country != null) {
      _pathToPage +=
          '&countryName=${widget.followableData.country!.name}&countryLocalizedName=${widget.followableData.country!.localName}&countryEmojiCode=${widget.followableData.country!.emojiCode}';
    }
    if (imageDimensions != null) {
      _pathToPage +=
          '&imageHeight=${imageDimensions.height}&imageWidth=${imageDimensions.width}';
    }
    return await DynamicLinkService.createDynamicLink(_pathToPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          //TODO! Android: check on android scrollable physics everywhere
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            FutureBuilder(
              future: _setShareLinkToPage(),
              builder: (context, AsyncSnapshot<Uri> snapshot) =>
                  WikiSliverAppBar(
                scrollController: _scrollController,
                isBackButtonOn: widget.isBackButtonOn,
                isShareButtonOn: widget.isShareButtonOn,
                followableData: widget.followableData,
                shareLink: snapshot.data,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  WikiTitle(title: widget.followableData.name),
                  widget.wikiContent,
                  const EndingOfScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
