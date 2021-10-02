import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyTextStyles {
  static const TextStyle cardEventTitle = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
    wordSpacing: -8,
  );

  static const TextStyle cardSceneTitle = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
    wordSpacing: -8,
  );

  static const TextStyle cardSceneSubtitle = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: MyColors.forInactiveStuff,
    wordSpacing: -8,
  );

  static const TextStyle wikiTitle = cardEventTitle;

  static const TextStyle cardEventDetails = TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: MyColors.main,
  );

  static const TextStyle cardEventBadge = TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: MyColors.main,
  );

  static TextStyle showsByDateDate = const TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: MyColors.forInactiveStuff,
  );

  static TextStyle modalBottomSheetTitle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
  );

  static const TextStyle showsViewSwitcherMode = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    wordSpacing: -4,
  );

  static const TextStyle ratingsTitle = TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.main,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle ratingsWeeklyWinnerSubtitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.accent,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    wordSpacing: -4.5,
    letterSpacing: -0.6,
  );

  static const TextStyle ratingsWeeklyWinnerTitle = TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.main,
    fontSize: 35,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle ratingsListTitle = TextStyle(
    fontFamily: 'RobotoMono',
    color: MyColors.main,
    fontSize: 23,
    fontWeight: FontWeight.w600,
    wordSpacing: -4,
  );

  static const TextStyle ratingsListTitleAccent = TextStyle(
    fontFamily: 'RobotoMono',
    color: MyColors.accent,
    fontSize: 23,
    fontWeight: FontWeight.w600,
    wordSpacing: -4,
  );

  static const TextStyle searchTextPlaceholder = TextStyle(
    fontSize: 16,
    color: MyColors.forInactiveStuff,
  );

  static TextStyle ratingsPlaceNumber(Color color) => TextStyle(
        color: color,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        wordSpacing: -3.5,
      );

  static const TextStyle searchCancel = TextStyle(
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

    static const TextStyle modalBottomSheetItem = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 19,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyWithInactiveColor = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle small = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle termsInactive = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle termsActive = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyWithAccentColor = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.accent,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    wordSpacing: -4,
  );

  static const TextStyle longTextThinSmallAccentColor = TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.accent,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle longTextThinSmallInactiveColor = TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.forInactiveStuff,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyFat = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle shortEntityName = TextStyle(
    fontFamily: 'RobotoMono',
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEntityRating = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEntityDetails = shortEntityRating;

  static const TextStyle authTitle = TextStyle(
    color: MyColors.main,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle authSubtitle = TextStyle(
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle buttonWithArrow = TextStyle(
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
      color: MyColors.forInactiveStuff);

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

  static const TextStyle tab = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle appTitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle appBarSubtitle = TextStyle(
    color: MyColors.forInactiveStuff,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle timetableTime = TextStyle(
    color: MyColors.main,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static const TextStyle placeAddress = TextStyle(
    color: MyColors.main,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEventName = TextStyle(
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
