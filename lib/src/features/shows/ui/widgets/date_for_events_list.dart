import 'package:flutter/widgets.dart';
import 'package:the_postraves_app/src/core/utils/formatting_utils.dart';
import 'package:the_postraves_app/src/core/utils/my_colors.dart';
import 'package:the_postraves_app/src/core/utils/my_constants.dart';
import 'package:the_postraves_app/src/core/utils/my_text_styles.dart';

class DateForEventsList extends StatelessWidget {
  final DateTime _dateTime;
  const DateForEventsList(this._dateTime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MyConstants.horizontalPaddingOrMargin,
        right: MyConstants.horizontalPaddingOrMargin,
        top: 10,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: MyColors.screenBackground,
        // border: Border(
        //   bottom: BorderSide(
        //     color: MyColors.forDividers,
        //     width: MyConstants.dividerThickness,
        //   ),
        // ),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: MyColors.forInactiveStuff,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _dateTime.day.toString(),
                    style: MyTextStyles.showsByDateDate,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "SAT", //todo
                    style: MyTextStyles.showsByDateDay,
                  )
                ],
              ),
            ),
          ),
          //todo
          // SizedBox(width: 8),
          // Text(
          //   "SEMPTEMBER",
          //   style: MyTextStyles.showsByDateMonth,
          // ),
        ],
      ),
      // Text(
      //   FormattingUtils.getFormattedDateLong(
      //     context: context,
      //     dateTime: _dateTime,
      //   ),
      //   style: MyTextStyles.showsByDateDate,
      // ),
    );
  }
}
