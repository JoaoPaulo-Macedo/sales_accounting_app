import 'package:flutter/cupertino.dart';

class AppDesign {
  AppDesign();

  BorderRadius get borderRadius => BorderRadius.circular(7);

  BoxDecoration get boxDecoration => BoxDecoration(
    //TODO: from material
    color: const Color.fromARGB(255, 43, 40, 46),
    borderRadius: borderRadius,
  );
}
