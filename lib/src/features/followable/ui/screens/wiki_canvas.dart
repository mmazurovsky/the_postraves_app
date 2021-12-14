import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../common/utils/followable_type_utils.dart';
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

  //* disposing this scroll controller causes crash when city is changed in user profile
  @override
  void dispose() {
    if (_scrollController != TabItem.profile.tabScrollController) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            WikiSliverAppBar(
              scrollController: _scrollController,
              isBackButtonOn: widget.isBackButtonOn,
              isShareButtonOn: widget.isShareButtonOn,
              followableData: widget.followableData,
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
