import 'package:flutter/material.dart';

class AppCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.info_outline,
        size: 17,
      ),
      onTap: () {
        print('sou');
      },
    );
  }
}
