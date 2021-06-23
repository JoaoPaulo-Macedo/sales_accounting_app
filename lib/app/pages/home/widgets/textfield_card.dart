import 'package:flutter/material.dart';
import 'app_info_icon.dart';

class TextFieldCard extends StatelessWidget {
  TextFieldCard({
    @required this.title,
    @required this.focus,
    @required this.prefixIcon,
    @required this.cardInfo,
    @required this.controller,
    this.function,
    this.fieldFontSize,
    this.formatAsMoney = false,
  });

  final String title;
  final FocusNode focus;
  final IconData prefixIcon;
  final AppInfoIcon cardInfo;
  final TextEditingController controller;
  final Function function;
  final double fieldFontSize;
  final bool formatAsMoney;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
