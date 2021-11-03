import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../spacers/my_horizontal_margin.dart';

class SearchContainer extends StatelessWidget {
  final Color containerColor;
  final Widget leftContainerPart;
  final Widget rightContainerPart;

  const SearchContainer({
    Key? key,
    required this.rightContainerPart,
    required this.leftContainerPart,
    required this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalMargin(
      child: Container(
        margin: const EdgeInsets.symmetric(
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
              const Icon(Ionicons.search, size: 17, color: MyColors.forInactiveStuff),
              const SizedBox(
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
