import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_design.dart';

class TextFieldCard extends StatelessWidget {
  const TextFieldCard({
    Key? key,
    required this.title,
    required this.focus,
    required this.prefixIcon,
    required this.controller,
    this.fieldFontSize = 18,
    this.formatAsMoney = false,
  }) : super(key: key);

  final String title;
  final FocusNode focus;
  final IconData prefixIcon;
  final TextEditingController controller;
  final double fieldFontSize;
  final bool formatAsMoney;

  @override
  Widget build(BuildContext context) {
    var design = AppDesign();
    
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
                  keyboardType: TextInputType.number,
                  focusNode: focus,
                  decoration: InputDecoration(
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
