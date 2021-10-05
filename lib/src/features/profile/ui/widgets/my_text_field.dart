import 'package:flutter/material.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final TextInputType textInputType;
  final bool isSecret;
  final TextEditingController textEditingController;
  final Function? validatorFunction;
  final FocusNode? focusNode;
  final Color fillColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final String? initialValue;
  final int? maxLines;
  final String? hintText;

  const MyTextField(
      {Key? key,
      required this.title,
      required this.textInputType,
      required this.isSecret,
      required this.textEditingController,
      this.validatorFunction,
      required this.fillColor,
      required this.activeBorderColor,
      required this.inactiveBorderColor,
      this.focusNode,
      this.initialValue,
      this.maxLines,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalMargin(
      child: TextFormField(
        initialValue: initialValue,
        focusNode: focusNode,
        controller: textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) =>
            validatorFunction != null ? validatorFunction!(value) : null,
        style: const TextStyle(
          color: MyColors.main,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MyTextStyles.hintText,
          labelText: title,
          labelStyle: MyTextStyles.body,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: activeBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: inactiveBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: textInputType,
        obscureText: isSecret,
        maxLines: maxLines,
      ),
    );
  }
}
