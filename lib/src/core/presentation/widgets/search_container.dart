import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../utils/my_colors.dart';
import 'my_horizontal_margin.dart';

class SearchContainer extends StatelessWidget {
  final Color containerColor;
  final Widget leftContainerPart;
  final Widget rightContainerPart;

  const SearchContainer({
    required this.rightContainerPart,
    required this.leftContainerPart,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return MyHorizontalMargin(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(7),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Ionicons.search, size: 17, color: MyColors.forInactiveStuff),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: rightContainerPart,
              ),
              leftContainerPart,
            ],
          ),
        ),
      ),
    );
  }
}
