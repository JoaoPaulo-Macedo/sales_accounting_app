import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_sizes.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';
import 'package:lucky_triangle/app/presentation/widgets/debt_card.dart';
import 'package:lucky_triangle/app/presentation/widgets/price_card.dart';

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
  final double? debt;
  final Function(Price price) onPressed;
  final sizes = const AppSizes();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PriceCard(price: price, onPressed: onPressed),
        SizedBox(height: sizes.smallSpacing),
        DebtCard(value: debt, situation: situation),
      ],
    );
  }
}
