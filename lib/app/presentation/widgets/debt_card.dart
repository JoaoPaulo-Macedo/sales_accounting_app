import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_design.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';

class DebtCard extends StatelessWidget {
  const DebtCard({
    Key? key,
    required this.value,
    required this.situation,
  }) : super(key: key);

  final double? value;
  final Situation situation;

  @override
  Widget build(BuildContext context) {
    var design = AppDesign();

    Color? color;
    String message;
    String value;

    if (this.value == null) {
      value = '';
    } else {
      value = 'R\$ ${this.value!.toStringAsFixed(2)}';
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
            value,
            style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
