import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/design/app_designs.dart';

class DebtCard extends StatelessWidget {
  DebtCard({@required this.widgetDebt, @required this.errorMessage});

  final double widgetDebt;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    String text = "";
    String finalDebt = "";
    double debt = widgetDebt;
    AppDecoration appDecorations = AppDecoration.of(context);
    AppColors appColors = AppColors.of(context);

    if (errorMessage.isEmpty) {
      text = debt >= -0.01 ? 'Pagar:' : 'Receber:';
      if (debt < 0) debt = debt * -1;
      finalDebt = debt.toStringAsFixed(2);
    }

    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(35, 20, 35, 0),
      padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
      decoration: appDecorations.appDebtBoxDecoration,
      child: errorMessage.isEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: appColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'VarelaRound',
                  ),
                ),
                Text(
                  'R\$ $finalDebt',
                  style: TextStyle(
                    fontSize: 20,
                    color: appColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: appColors.redColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'VarelaRound',
                ),
                textScaleFactor: 1,
              ),
            ),
    );
  }
}
