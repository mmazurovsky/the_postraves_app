import 'package:flutter/material.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../core/service/dynamic_link_service.dart';
import '../../../../core/presentation/widgets/ending_of_screen.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../dto/wiki_data_dto.dart';
import '../../../../core/utils/my_colors.dart';
import '../widgets/wiki_subtitle.dart';
import '../widgets/wiki_sliver_app_bar.dart';
import '../widgets/wiki_title.dart';

class WikiCanvas extends StatefulWidget {
  final WikiDataDto wikiData;
  final ScrollController scrollController;
  final Widget wikiDetails;
  final ImageDimensions? imageDimensions;
  final bool isBackButtonOn;

  const WikiCanvas({
    Key? key,
    required this.wikiData,
    required this.scrollController,
    required this.wikiDetails,
    required this.imageDimensions,
    required this.isBackButtonOn,
  }) : super(key: key);

  @override
  _WikiCanvasState createState() => _WikiCanvasState();
}

class _WikiCanvasState extends State<WikiCanvas> {
  @override
  void initState() {
    super.initState();
  }

  Future<Uri> _setShareLinkToPage() async {
    String _pathToPage =
        '${widget.wikiData.type.navigationRoute}?id=${widget.wikiData.id}&name=${widget.wikiData.name}';
    if (widget.wikiData.imageLink != null) {
      _pathToPage += _pathToPage + '&imageLink=${widget.wikiData.imageLink}';
    }
    if (widget.wikiData.country != null) {
      _pathToPage +=
          '&countryName=${widget.wikiData.country!.name}&countryLocalizedName=${widget.wikiData.country!.localName}&countryEmojiCode=${widget.wikiData.country!.emojiCode}';
    }
    if (widget.imageDimensions != null) {
      _pathToPage +=
          '&imageHeight=${widget.imageDimensions!.imageHeight}&imageWidth=${widget.imageDimensions!.imageWidth}';
    }
    return await DynamicLinkService.createDynamicLink(_pathToPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      body: SafeArea(
        child: CustomScrollView(
          controller: widget.scrollController,
          //todo check on android
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            FutureBuilder(
              future: _setShareLinkToPage(),
              builder: (context, AsyncSnapshot<Uri> snapshot) =>
                  WikiSliverAppBar(
                scrollController: widget.scrollController,
                imageDimensions: widget.imageDimensions,
                isBackButtonOn: widget.isBackButtonOn,
                wikiData: widget.wikiData,
                shareLink: snapshot.data,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  WikiTitle(title: widget.wikiData.name),
                  SizedBox(height: 8),
                  WikiSubtitle(
                    entityType: widget.wikiData.type.getNameSingular(context),
                    overallFollowers: widget.wikiData.overallFollowers,
                    country: widget.wikiData.country,
                  ),
                  widget.wikiDetails,
                  EndingOfScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
