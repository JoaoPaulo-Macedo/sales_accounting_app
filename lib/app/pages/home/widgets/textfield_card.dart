import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/design/app_designs.dart';
import 'app_info_icon.dart';

class TextFieldCard extends StatelessWidget {
  TextFieldCard({
    required this.title,
    required this.focus,
    required this.prefixIcon,
    required this.cardInfo,
    required this.controller,
    this.function,
    this.fieldFontSize,
    this.formatAsMoney = false,
  });

  final String title;
  final FocusNode focus;
  final IconData prefixIcon;
  final AppInfoIcon cardInfo;
  final TextEditingController controller;
  final Function? function;
  final double? fieldFontSize;
  final bool formatAsMoney;
  final AppSizes appSizes = AppSizes.instance;

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors.of(context);

    return GestureDetector(
      child: Container(
        height: appSizes.cardHeight,
        decoration: AppDecoration.of(context).appTextBoxDecoration,
        child: Padding(
          padding: appSizes.cardPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                prefixIcon,
                color: appColors.redColor,
                size: appSizes.iconSize,
              ),
              SizedBox(width: 5),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  focusNode: focus,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: title,
                    labelStyle: TextStyle(
                      fontSize: fieldFontSize ?? appSizes.fontSize,
                      color: appColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cursorColor: Colors.black,
                  // onChanged: (_) => calculate(function: function),
                  // onSubmitted: (_) => calculate(function: function),
                ),
              ),
              SizedBox(width: 10),
              cardInfo,
            ],
          ),
        ),
      ),
      onTap: () => focus.requestFocus(),
      onLongPress: () => print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"),
    );
  }
}
