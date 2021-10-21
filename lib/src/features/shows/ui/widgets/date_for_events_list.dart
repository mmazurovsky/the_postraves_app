import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/utils/formatting_utils.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';

class DateForEventsList extends StatelessWidget {
  final DateTime _dateTime;
  const DateForEventsList(this._dateTime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: MyConstants.horizontalPaddingOrMargin,
        right: MyConstants.horizontalPaddingOrMargin,
        top: 15,
        bottom: 15,
      ),
      decoration: const BoxDecoration(
        color: MyColors.screenBackground,
        border: Border(
          bottom: BorderSide(
            color: MyColors.forDividers,
            width: MyConstants.dividerThickness,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        FormattingUtils.getFormattedDateLong(
          context: context,
          dateTime: _dateTime,
        ),
        style: MyTextStyles.showsByDateDate,
      ),
    );
  }
}
