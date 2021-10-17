import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/app_bar_back_button.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/app_bar_title.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_simple_app_bar.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';

class ExtendedChartScreen<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final String chartTitle;
  final List<T> entities;
  const ExtendedChartScreen(
      {required this.chartTitle, required this.entities, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(
        leading: const AppBarBackButton(),
        title: AppBarTitle(
          title: chartTitle,
        ),
      ),
      body: Container(),
    );
  }
}
