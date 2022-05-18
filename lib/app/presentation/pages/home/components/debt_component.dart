import 'package:flutter/material.dart';
import 'package:sales_accounting/app/presentation/common/app_sizes.dart';
import 'package:sales_accounting/app/presentation/pages/home/utils/home_enums.dart';
import 'package:sales_accounting/app/presentation/pages/home/widgets/debt_card.dart';
import 'package:sales_accounting/app/presentation/pages/home/widgets/price_card.dart';

class DebtComponent extends StatelessWidget {
  const DebtComponent({
    Key? key,
    required this.price,
    required this.situation,
    required this.debt,
    required this.onPressed,
  }) : super(key: key);

  final Price price;
  final Situation situation;
  final double debt;
  final Function(Price price) onPressed;
  final sizes = const AppSizes();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PriceCard(price: price, onPressed: onPressed),
        SizedBox(height: sizes.smallSpacing),
        DebtCard(debt: debt, situation: situation),
      ],
    );
  }
}
