import 'package:flutter/material.dart';
import 'screen_size.dart';

class MyConstants {
  static const double endingOfScreenOrSpaceBetweenElements = 20;
  static const double spaceFromTop = 20;
  static const double horizontalPaddingOrMargin = 15;
  static const double ratingEntityVerticalPadding = 8;
  static const double diamondWidth = 17;
  static const String host = 'postraves.com';
  // static const String host = 'mikhail.local:8443';
  // static const String host = '10.0.2.2:8443';
  static const double heightOfContainers = 57;
  static const double dividerThickness = 0.1;
  //TODO: how to calculate properly???
  static double appBarTitleWidth(BuildContext context) =>
      ScreenSize.width * 0.6;
  static const String googleApiKey = "AIzaSyA4px3CRR7ntosKlBA8RitMcoU6nUdMgGk";
  static const String googleMapId = '40e862bd8e6365a7';
  // static const String artistsEndpoint = 'artist';
  // static const String eventsEndpoint = 'event';
  // static const String unitiesEndpoint = 'unity';
  // static const String placesEndpoint = 'place';
  // static const String usersEndpoint = 'user';
  static const String iosBundleId = 'com.mmazurovsky.thePostravesApp';
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
}
