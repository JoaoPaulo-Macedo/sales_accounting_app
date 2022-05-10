import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucky_triangle/app/design/app_designs.dart';
import 'package:lucky_triangle/app/models/app_config.dart';
import 'package:lucky_triangle/app/pages/home/widgets/app_info_icon.dart';
import 'package:lucky_triangle/app/pages/home/widgets/debt_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/info_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/price_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/textfield_card.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppSizes get appSizes => AppSizes.instance;
  AppColors get appColors => AppColors.of(context);
  AppDecoration get appDecorations => AppDecoration.of(context);

  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.totalCtrl.text = '8000';
    controller.taxCtrl.text = '11';
    controller.allowanceCtrl.text = '200';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldCard(
                          title: 'Total de Cartelas',
                          prefixIcon: Icons.view_headline_rounded,
                          controller: controller.totalCtrl,
                          focus: controller.totalFocus,
                        ),
                        SizedBox(height: appSizes.smallSpacing),
                        TextFieldCard(
                          title: 'Venda',
                          prefixIcon: Icons.add_chart_rounded,
                          controller: controller.soldCtrl,
                          focus: controller.saleFocus,
                        ),
                        SizedBox(height: appSizes.smallSpacing),
                        TextFieldCard(
                          title: 'Devolução',
                          prefixIcon: Icons.multiline_chart_rounded,
                          controller: controller.devCtrl,
                          focus: controller.devolutionFocus,
                        ),
                        SizedBox(height: appSizes.smallSpacing),
                        TextFieldCard(
                          title: 'Faltas',
                          prefixIcon: Icons.zoom_out_rounded,
                          controller: controller.missCtrl,
                          focus: controller.missingFocus,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldCard(
                          title: 'Adiantamento',
                          prefixIcon: Icons.attach_money_rounded,
                          controller: controller.paidCtrl,
                          formatAsMoney: true,
                          focus: controller.moneyFocus,
                        ),
                        SizedBox(height: appSizes.smallSpacing),
                        TextFieldCard(
                          title: 'Depósitos',
                          prefixIcon: Icons.request_quote_outlined,
                          controller: controller.depositCtrl,
                          formatAsMoney: true,
                          focus: controller.depositFocus,
                        ),
                        SizedBox(height: appSizes.smallSpacing),
                        Row(
                          children: [
                            Expanded(
                              child: InfoCard(
                                title: 'Imposto',
                                prefixIcon: Icons.price_check_rounded,
                                controller: controller.taxCtrl,
                                function: () {
                                  setState(() {});
                                  showDialog(
                                    context: context,
                                    builder: (_) => const AlertDialog(
                                      content: Text('SOOOOOU'),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: appSizes.smallSpacing),
                            Expanded(
                              child: InfoCard(
                                title: 'Ajuda de Custo',
                                prefixIcon: Icons.health_and_safety_outlined,
                                controller: controller.allowanceCtrl,
                                function: () {
                                  setState(() {});
                                  showDialog(
                                    context: context,
                                    builder: (_) => const AlertDialog(
                                      content: Text('SOOOOOU'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PriceCard(title: 'Preço da Cartela', selected: controller.selected),
                        SizedBox(height: appSizes.smallSpacing),
                        DebtCard(widgetDebt: controller.debt, errorMessage: controller.errorMessage),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
