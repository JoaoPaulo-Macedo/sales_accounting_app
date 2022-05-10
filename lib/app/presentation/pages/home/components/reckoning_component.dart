import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_sizes.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';
import 'package:lucky_triangle/app/presentation/widgets/text_field_card.dart';

class ReckoningComponent extends StatelessWidget {
  const ReckoningComponent(this.controller, {Key? key}) : super(key: key);

  final HomeCubit controller;
  final sizes = const AppSizes();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFieldCard(
          title: 'Adiantamento',
          prefixIcon: Icons.attach_money_rounded,
          controller: controller.paidCtrl,
          formatAsMoney: true,
          focus: controller.moneyFocus,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Depósitos',
          prefixIcon: Icons.request_quote_outlined,
          controller: controller.depositCtrl,
          formatAsMoney: true,
          focus: controller.depositFocus,
        ),
        SizedBox(height: sizes.smallSpacing),
        Row(
          children: [
            Expanded(
              child: TextFieldCard(
                title: 'Imposto',
                prefixIcon: Icons.price_check_rounded,
                controller: controller.taxCtrl,
                focus: controller.taxFocus,
              ),
            ),
            SizedBox(width: sizes.smallSpacing),
            Expanded(
              child: TextFieldCard(
                title: 'Ajuda de Custo',
                prefixIcon: Icons.health_and_safety_outlined,
                controller: controller.allowanceCtrl,
                focus: controller.allowanceFocus,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
