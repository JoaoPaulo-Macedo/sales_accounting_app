import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_design.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';

class DebtCard extends StatelessWidget {
  const DebtCard({
    Key? key,
    required this.value,
    required this.reckoning,
  }) : super(key: key);

  final double? value;
  final Reckoning reckoning;

  @override
  Widget build(BuildContext context) {
    var design = AppDesign();

    Color? color;
    String message;
    String value;

    if (this.value == null) {
      value = '';
    } else {
      value = 'R\$ this.value';
    }

    switch (reckoning) {
      case Reckoning.none:
        message = 'Preencha os campos';
        color = Colors.grey[300];
        break;
      case Reckoning.debt:
        message = 'Pagar';
        color = Colors.red;
        break;
      case Reckoning.credit:
        message = 'Receber';
        color = Colors.lightGreen[400];
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      decoration: design.boxDecoration,
      child: Row(
        mainAxisAlignment: reckoning == Reckoning.none ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 20,
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: 'VarelaRound',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      /* child: errorMessage.isEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'VarelaRound',
                  ),
                ),
                Text(
                  'R\$ $finalDebt',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'VarelaRound',
                ),
                textScaleFactor: 1,
              ),
            ), */
    );
  }
}
