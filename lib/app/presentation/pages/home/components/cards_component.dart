import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_sizes.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';
import 'package:lucky_triangle/app/presentation/pages/home/widgets/text_field_card.dart';

class CardsComponent extends StatelessWidget {
  const CardsComponent(this.cubit, {Key? key, required this.missingColor}) : super(key: key);

  final HomeCubit cubit;
  final sizes = const AppSizes();
  final Color? missingColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFieldCard(
          title: 'Total de Cartelas',
          prefixIcon: Icons.view_headline_rounded,
          controller: cubit.totalCtrl,
          focus: cubit.totalFocus,
          maxLength: 5,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Venda',
          prefixIcon: Icons.add_chart_rounded,
          controller: cubit.soldCtrl,
          focus: cubit.saleFocus,
          maxLength: 5,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Devolução',
          prefixIcon: Icons.multiline_chart_rounded,
          controller: cubit.devCtrl,
          focus: cubit.devolutionFocus,
          maxLength: 5,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Faltas',
          prefixIcon: Icons.zoom_out_rounded,
          controller: cubit.missCtrl,
          focus: cubit.missingFocus,
          maxLength: 5,
          textColor: missingColor,
          readOnly: true,
        ),
      ],
    );
  }
}
