import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_sizes.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_controller.dart';
import 'package:lucky_triangle/app/presentation/widgets/debt_card.dart';
import 'package:lucky_triangle/app/presentation/widgets/price_card.dart';

class DebtComponent extends StatelessWidget {
  const DebtComponent(this.controller, {Key? key}) : super(key: key);

  final HomeController controller;
  final sizes = const AppSizes();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PriceCard(title: 'Preço da Cartela', selected: controller.selected),
        SizedBox(height: sizes.smallSpacing),
        DebtCard(widgetDebt: controller.debt, errorMessage: controller.errorMessage),
      ],
    );
  }
}
