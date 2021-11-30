import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import '../../../features/followable/ui/widgets/button_with_icons.dart';
import 'package:the_postraves_package/service/open_link_service.dart';
import 'package:the_postraves_package/service/social_links_helper.dart';
import '../../constants/my_assets.dart';
import '../../constants/my_constants.dart';
import '../spacers/my_spacers.dart';
import '../spacers/section_divider.dart';
import 'section_title.dart';


class SocialLinksList extends StatelessWidget {
  final String? instagramUsername;
  final String? soundcloudUsername;
  final String? telegramUsername;
  final String? bandcampUsername;
  static const double _verticalPadding = 10;

  const SocialLinksList({
    Key? key,
    this.instagramUsername,
    this.bandcampUsername,
    this.soundcloudUsername,
    this.telegramUsername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return instagramUsername != null ||
            bandcampUsername != null ||
            soundcloudUsername != null ||
            telegramUsername != null
        ? Column(
            children: [
              const MyBiggestSpacer(),
              const SectionDivider(needHorizontalMargin: true),
              const MyMediumPlusSpacer(),
              SectionTitle(sectionTitle: 'links'.tr()),
              const MyMediumSpacer(),
              soundcloudUsername != null
                  ? ButtonWithIcons(
                      buttonText: MyConstants.soundcloudName,
                      onButtonTap: () => OpenLinkService.openSoundcloud(
                        soundcloudUsername!,
                      ),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.soundcloudLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
              bandcampUsername != null
                  ? ButtonWithIcons(
                      buttonText: MyConstants.bandcampName,
                      onButtonTap: () => OpenLinkService.openUrl(
                        SocialLinksHelper.getBandcampLinkForNickname(
                            bandcampUsername!),
                      ),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.bandcampLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
              instagramUsername != null
                  ? ButtonWithIcons(
                      buttonText: MyConstants.instagramName,
                      onButtonTap: () =>
                          OpenLinkService.openInstagram(instagramUsername!),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.instagramLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
              telegramUsername != null
                  ? ButtonWithIcons(
                      buttonText: MyConstants.telegramName,
                      onButtonTap: () => OpenLinkService.openUrl(
                          SocialLinksHelper.getTelegramLinkForNickname(
                              telegramUsername!)),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.telegramLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
            ],
          )
        : Container();
  }
}
