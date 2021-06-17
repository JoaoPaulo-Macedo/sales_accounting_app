import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/pages/design/app_designs.dart';

class AppInfoIcon extends StatelessWidget {
  AppInfoIcon({@required this.text});

  //Use Statelles as pattern for components/widgets

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 40,
        height: 45,
        child: Icon(
          Icons.info_outline,
          size: 18,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text(
              text,
              style: TextStyle(
                color: AppColors.of(context).textColor,
                fontSize: 17,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        );
      },
    );
  }
}
