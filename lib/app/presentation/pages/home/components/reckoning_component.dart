import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_sizes.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';
import 'package:lucky_triangle/app/presentation/pages/home/widgets/text_field_card.dart';

class ReckoningComponent extends StatelessWidget {
  const ReckoningComponent(this.cubit, {Key? key}) : super(key: key);

  final HomeCubit cubit;
  final sizes = const AppSizes();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFieldCard(
          title: 'Adiantamento',
          prefixIcon: Icons.attach_money_rounded,
          controller: cubit.paidCtrl,
          formatAsMoney: true,
          focus: cubit.moneyFocus,
          maxLength: 6,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Depósitos',
          prefixIcon: Icons.request_quote_outlined,
          controller: cubit.depositCtrl,
          formatAsMoney: true,
          focus: cubit.depositFocus,
          maxLength: 6,
        ),
        SizedBox(height: sizes.smallSpacing),
        Row(
          children: [
            Expanded(
              child: TextFieldCard(
                title: 'Imposto',
                prefixIcon: Icons.price_check_rounded,
                controller: cubit.taxCtrl,
                focus: cubit.taxFocus,
              ),
            ),
            SizedBox(width: sizes.smallSpacing),
            Expanded(
              child: TextFieldCard(
                title: 'Ajuda de Custo',
                prefixIcon: Icons.health_and_safety_outlined,
                controller: cubit.allowanceCtrl,
                focus: cubit.allowanceFocus,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
