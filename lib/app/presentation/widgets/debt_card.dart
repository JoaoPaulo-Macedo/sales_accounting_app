import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_design.dart';

class DebtCard extends StatelessWidget {
  const DebtCard({Key? key, required this.widgetDebt, required this.errorMessage}) : super(key: key);

  final double widgetDebt;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    String text = "";
    String finalDebt = "";
    double debt = widgetDebt;
    var design = AppDesign();

    if (errorMessage.isEmpty) {
      text = debt >= -0.01 ? 'Pagar:' : 'Receber:';
      if (debt < 0) debt = debt * -1;
      finalDebt = debt.toStringAsFixed(2);
    }

    return Container(
      // width: double.infinity,
      // height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 35),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      decoration: design.boxDecoration,
      child: errorMessage.isEmpty
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
            ),
    );
  }
}
