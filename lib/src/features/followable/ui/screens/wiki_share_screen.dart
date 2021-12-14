import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_postraves_app/src/common/configs/dynamic_link_configurer.dart';
import 'package:the_postraves_app/src/common/utils/followable_type_utils.dart';
import 'package:the_postraves_app/src/common/widgets/animations/wrappers.dart';
import 'package:the_postraves_app/src/common/widgets/other/loading_container.dart';
import 'package:the_postraves_app/src/common/widgets/other/my_loading_indicator.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/app_bar/app_bar_back_button.dart';
import '../../../../common/widgets/app_bar/app_bar_title.dart';
import '../../../../common/widgets/app_bar/my_simple_app_bar.dart';
import '../../../../common/widgets/buttons/my_elevated_button.dart';
import '../../../../common/widgets/entity_presentation/unified_followable_with_type_data.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/image/my_cached_network_image.dart';

class WikiShareScreen extends StatelessWidget {
  final FollowableData followableData;

  const WikiShareScreen({
    Key? key,
    required this.followableData,
  }) : super(key: key);

  Future<Uri> _setShareLinkToPage() async {
    final imageDimensions = followableData.imageDimensions;
    String _pathToPage =
        '${FollowableTypeUtils.getNavigationRouteForType(followableData.type)}?id=${followableData.id}&name=${followableData.name}';
    if (followableData.imageLink != null) {
      _pathToPage += _pathToPage + '&imageLink=${followableData.imageLink}';
    }
    if (followableData.country != null) {
      _pathToPage +=
          '&countryName=${followableData.country!.name}&countryLocalizedName=${followableData.country!.localName}&countryEmojiCode=${followableData.country!.emojiCode}';
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
      appBar: MySimpleAppBar(
        leading: const AppBarBackButton(),
        title: AppBarTitle(
          title: 'share'.tr(),
        ),
      ),
      backgroundColor: MyColors.screenBackground,
      body: FutureBuilder(
          future: _setShareLinkToPage(),
          builder: (context, AsyncSnapshot<Uri> snapshot) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MySmallSpacer(),
                  MyHorizontalPadding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: MyCachedNetworkImage(
                              followableData.imageLink,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: UnifiedFollowableWithTypeData(
                            followable: followableData,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const MyMediumPlusSpacer(),
                  MyHorizontalPadding(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.forEventCard,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(18),
                      child: Column(
                        children: [
                          snapshot.hasData
                              ? ScaleAnimationWrapper(
                                  lowerBound: 0,
                                  child: QrImage(
                                    data: snapshot.data.toString(),
                                    version: QrVersions.auto,
                                    foregroundColor: MyColors.main,
                                    padding: const EdgeInsets.all(0),
                                  ),
                                )
                              : LayoutBuilder(
                                  builder: (context, constraints) => Container(
                                    color: MyColors.forEventCard,
                                    width: constraints.biggest.shortestSide,
                                    height: constraints.biggest.shortestSide,
                                    child: const MyLoadingIndicator(),
                                  ),
                                ),
                          const SizedBox(height: 15),
                          const BrightnessSwitcher(),
                        ],
                      ),
                    ),
                  ),
                  const MyMediumPlusSpacer(),
                  MyElevatedButton(
                    mainAxisAlignment: MainAxisAlignment.center,
                    leadingIcon: Container(
                      width: 18,
                      height: 20,
                      alignment: Alignment.topCenter,
                      child: const Icon(
                        Ionicons.share_outline,
                        color: MyColors.main,
                        size: 18,
                      ),
                    ),
                    text: snapshot.hasData ? 'shareLink'.tr() : 'loading'.tr(),
                    buttonColor: MyColors.forEventCard,
                    textStyle: MyTextStyles.buttonWithMainColorThinner,
                    onTap: snapshot.hasData
                        ? () async {
                            await Share.share(snapshot.data.toString());
                          }
                        : () {},
                  ),
                  const MyMediumPlusSpacer(),
                ],
              ),
            );
          }),
    );
  }
}

class BrightnessSwitcher extends StatefulWidget {
  const BrightnessSwitcher({Key? key}) : super(key: key);

  @override
  _BrightnessSwitcherState createState() => _BrightnessSwitcherState();
}

class _BrightnessSwitcherState extends State<BrightnessSwitcher> {
  late double _initialBrightness;
  late bool _maxBrightness;

  @override
  void initState() {
    super.initState();
    _maxBrightness = false;
    _setCurrentBrightness();
  }

  Future<void> _setCurrentBrightness() async {
    _initialBrightness = await ScreenBrightness.current;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'maxBrightness'.tr(),
          style: MyTextStyles.buttonWithMainColor,
          overflow: TextOverflow.ellipsis,
        ),
        CupertinoSwitch(
          activeColor: MyColors.accent,
          value: _maxBrightness,
          onChanged: (value) {
            if (_maxBrightness != value) {
              setState(() {
                _maxBrightness = value;
              });
              _maxBrightness
                  ? ScreenBrightness.setScreenBrightness(1.0)
                  : ScreenBrightness.setScreenBrightness(_initialBrightness);
            }
          },
        ),
      ],
    );
  }
}
