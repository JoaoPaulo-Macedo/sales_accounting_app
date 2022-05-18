import 'package:flutter/material.dart';
import 'package:sales_accounting/app/presentation/common/app_design.dart';
import 'package:sales_accounting/app/presentation/pages/home/utils/home_enums.dart';

class DebtCard extends StatelessWidget {
  const DebtCard({
    Key? key,
    required this.debt,
    required this.situation,
  }) : super(key: key);

  final double debt;
  final Situation situation;

  @override
  Widget build(BuildContext context) {
    var design = AppDesign();

    Color? color;
    String message;
    String debt;

    if (situation == Situation.none) {
      debt = '';
    } else {
      debt = 'R\$ ${this.debt.toStringAsFixed(2)}';
      debt = debt.replaceAll('-', '');
    }

    switch (situation) {
      case Situation.none:
        message = 'Preencha os campos';
        color = Colors.grey[300];
        break;
      case Situation.debt:
        message = 'Pagar';
        color = Colors.red;
        break;
      case Situation.credit:
        message = 'Receber';
        color = Colors.lightGreen[400];
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      decoration: design.boxDecoration,
      child: Row(
        mainAxisAlignment: situation == Situation.none ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold),
          ),
          Text(
            debt,
            style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
