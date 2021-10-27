import '../utils/social_links_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenLinkService {
  static void openUrl(String urlString) async {
    await canLaunch(urlString)
        ? await launch(urlString)
        : await canLaunch('https://$urlString')
            ? await launch('https://$urlString')
            : throw 'Could not launch $urlString';
  }

  static void openInstagram(String instagramUsername) async {
    final instagramAppLink = "instagram://user?username=$instagramUsername";
    final isLaunched = await launch(instagramAppLink);
    if (!isLaunched) {
      openUrl(
        SocialLinksHelper.getInstagramLinkForNickname(instagramUsername),
      );
    }
  }

  static void openSoundcloud(String soundcloudUsername) async {
    openUrl(
      SocialLinksHelper.getSoundcloudLinkForNickname(soundcloudUsername),
    );
  }

  static void openTelegram(String telegramUsername) async {
    final telegramAppLink = "tg://msg?text=&to=@$telegramUsername";
    final isLaunched = await launch(telegramAppLink);
    if (!isLaunched) {
      openUrl(
        SocialLinksHelper.getTelegramLinkForNickname(telegramUsername),
      );
    }
  }
}
