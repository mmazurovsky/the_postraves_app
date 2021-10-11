import 'package:url_launcher/url_launcher.dart';

class OpenLinkService {
  static void openUrl(String urlString) async {
    await canLaunch(urlString)
        ? await launch(urlString)
        : await canLaunch('https://$urlString')
            ? await launch('https://$urlString')
            : throw 'Could not launch $urlString';
  }
}
