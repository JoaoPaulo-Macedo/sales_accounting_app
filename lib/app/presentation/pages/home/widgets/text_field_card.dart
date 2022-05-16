import 'package:flutter/material.dart';
import 'package:reckoning/app/presentation/common/app_design.dart';

class TextFieldCard extends StatelessWidget {
  const TextFieldCard({
    Key? key,
    required this.title,
    required this.focus,
    required this.prefixIcon,
    required this.controller,
    this.fieldFontSize = 18,
    this.formatAsMoney = false,
    this.readOnly = false,
    this.maxLength,
    this.textColor,
  }) : super(key: key);

  final String title;
  final FocusNode focus;
  final IconData prefixIcon;
  final TextEditingController controller;
  final double fieldFontSize;
  final bool formatAsMoney;
  final int? maxLength;
  final Color? textColor;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    var design = AppDesign();
    Color? textColor;

    if (this.textColor == null) {
      textColor = Colors.grey[300];
    } else {
      textColor = this.textColor;
    }

    return GestureDetector(
      child: Container(
        height: 63,
        decoration: design.boxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(prefixIcon, color: Colors.red, size: 25),
              const SizedBox(width: 5),
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLength: maxLength,
                  keyboardType: TextInputType.number,
                  focusNode: focus,
                  style: TextStyle(color: textColor),
                  readOnly: readOnly,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    labelText: title,
                    labelStyle: TextStyle(
                      fontSize: fieldFontSize,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              // cardInfo,
            ],
          ),
        ),
      ),
      onTap: () => focus.requestFocus(),
    );
  }
}
