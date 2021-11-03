import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../constants/my_constants.dart';
import 'details_item.dart';


class DetailsHorizontalScrollableList extends StatelessWidget {
  final Map<String, Widget> titleBodyMap;
  final double verticalPadding;

  const DetailsHorizontalScrollableList({
    Key? key,
    required this.titleBodyMap,
    required this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: SizedBox(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: MyConstants.horizontalPaddingOrMargin),
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: MyConstants.dividerThickness,
                    color: MyColors.forDividers,
                  ),
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: titleBodyMap.length,
                separatorBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
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
            const SizedBox(width: MyConstants.horizontalPaddingOrMargin),
          ],
        ),
      ),
    );
  }
}
