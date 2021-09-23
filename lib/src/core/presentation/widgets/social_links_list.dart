import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../features/wiki/ui/widgets/button_with_icons.dart';

import '../../service/open_link_service.dart';
import '../../utils/my_assets.dart';
import 'section_divider.dart';
import 'section_spacer.dart';
import 'section_title.dart';

class SocialLinksList extends StatelessWidget {
  final String? instagramLink;
  final String? soundcloudLink;
  final String? telegramLink;
  final String? bandcampLink;

  const SocialLinksList({
    Key? key,
    this.instagramLink,
    this.bandcampLink,
    this.soundcloudLink,
    this.telegramLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return instagramLink != null ||
            bandcampLink != null ||
            soundcloudLink != null ||
            telegramLink != null
        ? Column(
            children: [
              SectionSpacer(),
              SectionTitle(sectionTitle: AppLocalizations.of(context)!.links),
              SizedBox(height: 8),
              soundcloudLink != null
                  ? ButtonWithIcons(
                      buttonText: 'Soundcloud',
                      onButtonTap: () =>
                          OpenLinkService.openUrl(soundcloudLink!),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.soundcloudLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: 8,
                    )
                  : Container(),
              bandcampLink != null
                  ? ButtonWithIcons(
                      buttonText: 'Bandcamp',
                      onButtonTap: () => OpenLinkService.openUrl(bandcampLink!),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.bandcampLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: 8,
                    )
                  : Container(),
              instagramLink != null
                  ? ButtonWithIcons(
                      buttonText: 'Instagram',
                      onButtonTap: () => OpenLinkService.openUrl(instagramLink!),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.instagramLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: 8,
                    )
                  : Container(),
              telegramLink != null
                  ? ButtonWithIcons(
                      buttonText: 'Telegram',
                      onButtonTap: () => OpenLinkService.openUrl(telegramLink!),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MyImages.telegramLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: 8,
                    )
                  : Container(),
              SizedBox(height: 15),
              SectionDivider(needHorizontalMargin: true),
            ],
          )
        : Container();
  }
}
