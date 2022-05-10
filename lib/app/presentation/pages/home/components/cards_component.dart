import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_sizes.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';
import 'package:lucky_triangle/app/presentation/widgets/text_field_card.dart';

class CardsComponent extends StatelessWidget {
  const CardsComponent(this.controller, {Key? key}) : super(key: key);

  final HomeCubit controller;
  final sizes = const AppSizes();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFieldCard(
          title: 'Total de Cartelas',
          prefixIcon: Icons.view_headline_rounded,
          controller: controller.totalCtrl,
          focus: controller.totalFocus,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Venda',
          prefixIcon: Icons.add_chart_rounded,
          controller: controller.soldCtrl,
          focus: controller.saleFocus,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Devolução',
          prefixIcon: Icons.multiline_chart_rounded,
          controller: controller.devCtrl,
          focus: controller.devolutionFocus,
        ),
        SizedBox(height: sizes.smallSpacing),
        TextFieldCard(
          title: 'Faltas',
          prefixIcon: Icons.zoom_out_rounded,
          controller: controller.missCtrl,
          focus: controller.missingFocus,
        ),
      ],
    );
  }
}
