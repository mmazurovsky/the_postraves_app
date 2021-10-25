import 'package:flutter/material.dart';
import 'screen_size.dart';

class MyConstants {
  static const double endingOfScreenOrSpaceBetweenElements = 20;
  static const double spaceFromTop = 20;
  static const double horizontalPaddingOrMargin = 15;
  static const double ratingEntityVerticalPadding = 8;
  static const double diamondWidth = 17;
  static const String apiHost = 'postraves.com';
  static const String apiPath = 'api/';
  static const double heightOfContainers = 57;
  static const double dividerThickness = 0.1;
  static double appBarTitleWidth(BuildContext context) =>
      ScreenSize.width - 2 * horizontalPaddingOrMargin - 2 * heightOfContainers;
  static const String googleApiKey = "AIzaSyA4px3CRR7ntosKlBA8RitMcoU6nUdMgGk";
  static const String googleMapId = '40e862bd8e6365a7';
  static const String iosBundleId = 'com.mmazurovsky.thePostravesApp';
  //TODO! Android: change
  static const String androidPackageName = 'com.mmazurovsky.postraves_android';
  static const String dynamicLinkUrlPrefix =
      'https://thepostravesapp.page.link';
  static const String instagramName = 'Instagram';
  static const String soundcloudName = 'Soundcloud';
  static const String bandcampName = 'Bandcamp';
  static const String telegramName = 'Telegram';
  static const String termsAndConditionsLink =
      'https://postraves.flycricket.io/terms.html';
  static const String privacyPolicyLink =
      'https://postraves.flycricket.io/privacy.html';
  static const double heightOfCitySelectorModalBottomSheet = 270;
  static const double heightOfSortModeSelectorModalBottomSheet = 310;
  static const String telegramSupportAccount = "mmazurovsky";
}
