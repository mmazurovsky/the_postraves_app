import 'package:flutter/material.dart';

import '../../../core/utils/my_colors.dart';
import '../../../core/utils/my_constants.dart';
import 'details_item.dart';

class DetailsHorizontalScrollableList extends StatelessWidget {
  const DetailsHorizontalScrollableList({
    Key? key,
    required this.titleBodyMap,
  }) : super(key: key);

  final Map<String, Widget> titleBodyMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: MyConstants.horizontalPaddingOrMargin),
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: MyConstants.dividerThickness,
                  color: MyColors.forDividers,
                ),
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: titleBodyMap.length,
              separatorBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 12),
                  VerticalDivider(
                    thickness: MyConstants.dividerThickness,
                    // width: 0.5,
                    color: MyColors.forDividers,
                    // indent: 6,
                    // endIndent: 6,
                  ),
                  SizedBox(width: 12),
                ],
              ),
              itemBuilder: (context, index) => DetailsItem(
                title: titleBodyMap.entries.elementAt(index).key,
                body: titleBodyMap.entries.elementAt(index).value,
              ),
            ),
          ),
          SizedBox(width: MyConstants.horizontalPaddingOrMargin),
        ],
      ),
    );
  }
}
