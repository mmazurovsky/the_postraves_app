import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';

class MyTextStyles {

  static const TextStyle appTitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.accent,
    fontSize: 23,
    fontWeight: FontWeight.w700,
  );

    static const TextStyle filtered = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle fullEventCardTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
    wordSpacing: 1.2,
    letterSpacing: 1.2,
  );

  static const TextStyle countryFlag = TextStyle(fontSize: 19.1);

  static const TextStyle cardSceneTitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
    wordSpacing: -6,
  );

  static const TextStyle cardSceneSubtitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: MyColors.forInactiveStuff,
    wordSpacing: -6,
  );

  static const TextStyle wikiTitle = fullEventCardTitle;

  static const TextStyle cardEventDetailsInActive = TextStyle(
    fontFamily: 'IBMPlexMono',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: MyColors.forInactiveStuff
  );

  static TextStyle cardEventDetailsAccent =
      cardEventDetailsInActive.copyWith(color: MyColors.accent);

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

  static const TextStyle ratingsTitle = TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.main,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle ratingsWeeklyWinnerSubtitle = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    wordSpacing: -4,
    letterSpacing: -0.5,
  );

  static const TextStyle ratingsWeeklyWinnerTitle = TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.main,
    fontSize: 35,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle chartTitle = TextStyle(
    fontFamily: 'Roboto',
    color: MyColors.main,
    fontSize: 23,
    fontWeight: FontWeight.w600,
    wordSpacing: 1.2,
    letterSpacing: 1.2,
  );

  static const TextStyle searchTextPlaceholder = TextStyle(
    fontSize: 16,
    color: MyColors.forInactiveStuff,
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

  static const TextStyle modalBottomSheetTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: MyColors.main,
    wordSpacing: 3,
  );

  static const TextStyle modalBottomSheetItem = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle modalBottomSheetItemAccent = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.accent,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle hintText = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 17,
    fontWeight: FontWeight.w400,
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

  static const TextStyle closeModalBottomSheet = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle closeModalBottomSheetInactive = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 15,
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

  static const TextStyle smallerBodyWithMainColor = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle smallerBodyWithAccentColor = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.accent,
    fontSize: 15,
    fontWeight: FontWeight.w500,
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

  static TextStyle sectionTitleAccent =
      sectionTitle.copyWith(color: MyColors.accent);

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
    fontFamily: 'IBMPlexMono',
    color: MyColors.main,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEntityOverallRating = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forInactiveStuff,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle shortEntityRatingAccent =
      shortEntityOverallRating.copyWith(color: MyColors.accent);

  static const TextStyle shortEntityPositiveWeeklyRating = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forPositiveWeeklyRating,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEntityNegativeWeeklyRating = TextStyle(
    fontFamily: 'IBMPlexMono',
    color: MyColors.forNegativeWeeklyRating,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle shortEntityDetails = shortEntityOverallRating;

  static const TextStyle authTitle = TextStyle(
    color: MyColors.main,
    fontSize: 42,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle authSubtitle = TextStyle(
    color: MyColors.forInactiveStuff,
    fontSize: 15,
    fontWeight: FontWeight.w400,
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

  static TextStyle buttonWithOppositeColor = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.mainOppositeColor,
  );

  static TextStyle buttonWithInactiveStuffColor = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.forInactiveStuff,
  );

  static TextStyle buttonWithInactiveStuffDarkerColor = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.forInactiveStuffDarker,
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
    fontFamily: 'IBMPlexMono',
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
