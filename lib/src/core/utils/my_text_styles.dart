import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyTextStyles {
  static const TextStyle cardEventTitle = const TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
    wordSpacing: -8,
  );

  static const TextStyle cardSceneTitle = const TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
    wordSpacing: -8,
  );

  static const TextStyle cardSceneSubtitle = const TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: MyColors.forInactiveStuff,
    wordSpacing: -8,
  );

  static const TextStyle wikiTitle = cardEventTitle;

  static const TextStyle cardEventDetails = const TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: MyColors.main,
  );

  static const TextStyle cardEventBadge=const TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: MyColors.main,
  );

  static TextStyle showsByDateDate = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: MyColors.forInactiveStuff,
  );

  static TextStyle modalBottomSheetTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
  );

  static const TextStyle showsViewSwitcherMode = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    wordSpacing: -4,
  );

  static const TextStyle ratingsTitle = const TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.main,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle ratingsWeeklyWinnerSubtitle = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.accent,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    wordSpacing: -4.5,
    letterSpacing: -0.6,
  );

  static const TextStyle ratingsWeeklyWinnerTitle = const TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.main,
    fontSize: 35,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle ratingsListTitle = const TextStyle(
    fontFamily: 'RobotoMono',
    color: MyColors.main,
    fontSize: 23,
    fontWeight: FontWeight.w600,
    wordSpacing: -4,
  );

    static const TextStyle ratingsListTitleAccent = const TextStyle(
    fontFamily: 'RobotoMono',
    color: MyColors.accent,
    fontSize: 23,
    fontWeight: FontWeight.w600,
    wordSpacing: -4,
  );

  static const TextStyle searchTextPlaceholder = const TextStyle(
    fontSize: 16,
    color: MyColors.forInactiveStuff,
  );

  static TextStyle ratingsPlaceNumber(Color color) => TextStyle(
        color: color,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        wordSpacing: -3.5,
      );

  static const TextStyle searchCancel = const TextStyle(
    fontFamily: 'Roboto',
    textBaseline: TextBaseline.alphabetic,
    color: MyColors.main,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static const TextStyle searchValue = TextStyle(
    textBaseline: TextBaseline.alphabetic,
    color: MyColors.main,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static const TextStyle body = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyWithInactiveColor = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle small = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle termsInactive = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle termsActive = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyWithAccentColor = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.accent,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sectionTitle = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    wordSpacing: -4,
  );

  static const TextStyle longTextThinSmallAccentColor = const TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.accent,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle longTextThinSmallInactiveColor = const TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.forInactiveStuff,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle bodyFat = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle shortEntityName = const TextStyle(
    fontFamily: 'RobotoMono',
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEntityRating = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEntityDetails = shortEntityRating;

  static const TextStyle authTitle = const TextStyle(
    color: MyColors.main,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle authSubtitle = const TextStyle(
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle buttonWithArrow = const TextStyle(
    color: MyColors.main,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonWithMainColor = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
  );

  static TextStyle buttonWithAccentColor = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.accent,
  );

  static TextStyle buttonWithMainColorThinner = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: MyColors.main,
  );

  static TextStyle buttonWithInactiveColor = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.forInactiveStuff
  );

  static TextStyle buttonWithOppositeColor = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: MyColors.mainOppositeColor,
  );

  static TextStyle buttonForSms = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.green,
  );

  static TextStyle buttonForGmail = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );

  static TextStyle buttonForFacebook = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );

  static TextStyle buttonForEmail = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );

  static TextStyle buttonForShowOnMap = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.accent,
  );

  static const TextStyle tab = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle appBarTitle = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle appTitle = const TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle appBarSubtitle = const TextStyle(
    color: MyColors.forInactiveStuff,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle timetableTime = const TextStyle(
    color: MyColors.main,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static const TextStyle placeAddress = const TextStyle(
    color: MyColors.main,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEventName = const TextStyle(
    fontFamily: 'RobotoMono',
    color: MyColors.main,
    fontSize: 21,
    fontWeight: FontWeight.w500,
    wordSpacing: -4.5,
  );

  static TextStyle wikiLoading(Color color) => TextStyle(
        color: color,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );
}
