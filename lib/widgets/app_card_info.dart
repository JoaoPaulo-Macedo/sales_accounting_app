import 'package:flutter/material.dart';

class AppCardInfo extends StatelessWidget {
  AppCardInfo({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.info_outline,
        size: 17,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text(
              text,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 17,
              ),
            ),
            actions: [
              /*GestureDetector(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.of(context).pop(),
              )*/
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
