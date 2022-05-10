import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/design/app_designs.dart';
import 'app_info_icon.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    required this.title,
    required this.prefixIcon,
    required this.controller,
    this.cardInfo,
    this.fieldFontSize,
    this.function,
  });

  final String title;
  final IconData prefixIcon;
  final TextEditingController controller;
  final AppInfoIcon? cardInfo;
  final double? fieldFontSize;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    AppSizes appSizes = AppSizes.singleton;
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
                  readOnly: true,
                  controller: controller,
                  keyboardType: TextInputType.number,
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
                  // onChanged: (_) => calculate(),
                  // onSubmitted: (_) => calculate(),
                ),
              ),
              // SizedBox(width: 10),
              // cardInfo,
            ],
          ),
        ),
      ),
    );
  }
}
