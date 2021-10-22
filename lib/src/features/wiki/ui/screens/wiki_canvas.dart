import 'package:flutter/material.dart';
import '../widgets/wiki_title.dart';
import '../../../../models/dto/wiki_data_dto.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../core/service/dynamic_link_service.dart';
import '../../../../core/presentation/widgets/ending_of_screen.dart';
import '../../../../core/utils/my_colors.dart';
import '../widgets/wiki_sliver_app_bar.dart';

class WikiCanvas extends StatefulWidget {
  final WikiDataDto wikiDataDto;
  final bool isBackButtonOn;
  final Widget wikiContent;
  final ScrollController? scrollController;

  const WikiCanvas({
    Key? key,
    required this.wikiDataDto,
    required this.wikiContent,
    this.isBackButtonOn = true,
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

  Future<Uri> _setShareLinkToPage() async {
    final imageDimensions = widget.wikiDataDto.imageDimensions;
    String _pathToPage =
        '${widget.wikiDataDto.type.navigationRoute}?id=${widget.wikiDataDto.id}&name=${widget.wikiDataDto.name}';
    if (widget.wikiDataDto.imageLink != null) {
      _pathToPage += _pathToPage + '&imageLink=${widget.wikiDataDto.imageLink}';
    }
    if (widget.wikiDataDto.country != null) {
      _pathToPage +=
          '&countryName=${widget.wikiDataDto.country!.name}&countryLocalizedName=${widget.wikiDataDto.country!.localName}&countryEmojiCode=${widget.wikiDataDto.country!.emojiCode}';
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
          //TODO: check on android
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            FutureBuilder(
              future: _setShareLinkToPage(),
              builder: (context, AsyncSnapshot<Uri> snapshot) =>
                  WikiSliverAppBar(
                scrollController: _scrollController,
                isBackButtonOn: widget.isBackButtonOn,
                wikiData: widget.wikiDataDto,
                shareLink: snapshot.data,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  WikiTitle(title: widget.wikiDataDto.name),
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
