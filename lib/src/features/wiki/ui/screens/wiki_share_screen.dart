import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:screen_brightness/screen_brightness.dart';
import '../../../../core/presentation/widgets/app_bar_title.dart';
import '../../../../core/presentation/widgets/entity_presentation/unified_followable_with_type_data.dart';
import '../../../../core/presentation/widgets/my_spacers.dart';
import '../../../../core/utils/screen_size.dart';
import '../../../../models/dto/wiki_data_dto.dart';
import '../../../../core/presentation/widgets/app_bar_back_button.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button.dart';
import '../../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/my_simple_app_bar.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WikiShareScreen extends StatelessWidget {
  final Uri shareLink;
  final WikiDataDto wikiData;

  const WikiShareScreen({
    Key? key,
    required this.shareLink,
    required this.wikiData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(
        leading: const AppBarBackButton(),
        title: AppBarTitle(
          title: AppLocalizations.of(context)!.share,
        ),
      ),
      backgroundColor: MyColors.screenBackground,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                        wikiData.imageLink,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: UnifiedFollowableWithTypeData(
                      followable: wikiData,
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
                    QrImage(
                      data: shareLink.toString(),
                      version: QrVersions.auto,
                      foregroundColor: MyColors.main,
                      size: ScreenSize.width - 95,
                      padding: EdgeInsets.all(0),
                    ),
                    SizedBox(height: 15),
                    BrightnessSwitcher(),
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
                child: Icon(
                  Ionicons.share_outline,
                  color: MyColors.main,
                  size: 18,
                ),
              ),
              text: AppLocalizations.of(context)!.shareLink,
              buttonColor: MyColors.forEventCard,
              textStyle: MyTextStyles.buttonWithMainColorThinner,
              onTap: () async => await Share.share(shareLink.toString()),
            ),
            const MyMediumPlusSpacer(),
          ],
        ),
      ),
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
          AppLocalizations.of(context)!.maxBrightness,
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
