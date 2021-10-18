import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/core/utils/my_constants.dart';
import '../../utils/social_links_helper.dart';
import '../../../features/wiki/ui/widgets/button_with_icons.dart';

import '../../service/open_link_service.dart';
import '../../utils/my_assets.dart';
import 'section_divider.dart';
import 'my_spacers.dart';
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
              SectionTitle(sectionTitle: AppLocalizations.of(context)!.links),
              const MyMediumSpacer(),
              soundcloudUsername != null
                  ? ButtonWithIcons(
                      buttonText: MyConstants.soundcloudName,
                      onButtonTap: () => OpenLinkService.openUrl(
                        SocialLinksHelper.getSoundcloudLinkForNickname(
                            soundcloudUsername!),
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
                          OpenLinkService.openUrl(SocialLinksHelper.getInstagramLinkForNickname(
                            instagramUsername!)),
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
                      onButtonTap: () =>
                          OpenLinkService.openUrl(SocialLinksHelper.getTelegramLinkForNickname(
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
