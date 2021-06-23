import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucky_triangle/app/design/app_designs.dart';
import 'package:lucky_triangle/app/models/app_config.dart';
import 'package:lucky_triangle/app/pages/home/widgets/app_info_icon.dart';
import 'package:lucky_triangle/app/pages/home/widgets/debt_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/info_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/price_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/textfield_card.dart';
import 'package:lucky_triangle/app/root_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppSizes get appSizes => AppSizes.singleton;
  AppColors get appColors => AppColors.of(context);
  AppDecoration get appDecorations => AppDecoration.of(context);

  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.taxCtrl.text = '11';
    controller.allowanceCtrl.text = '200';
  }

  @override
  Widget build(BuildContext context) {
    if (AppConfig.singleton.checkedStorage == false) return Container(color: appColors.loadingScreen);
    // This one was necessary because Flutter was rendering screen with old brightness, eventhough it was already
    // changed by listenable builder.
    if (Theme.of(context).brightness != AppConfig.singleton.themeModeToBrightness(context))
      return Container(color: appColors.loadingScreen);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.black),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 25,
                        width: 25,
                        color: Colors.red,
                      ),
                      onTap: () {
                        RootController.instance.themeController.changeTheme();
                      },
                    ),
                    TextFieldCard(
                      title: 'Total de Cartelas',
                      prefixIcon: Icons.zoom_out_rounded,
                      controller: controller.totalCtrl,
                      focus: controller.totalFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe o total de cartelas pegas para a distribuição.',
                      ),
                    ),
                    SizedBox(height: appSizes.smallSpacing),
                    TextFieldCard(
                      title: 'Venda',
                      prefixIcon: Icons.add_chart,
                      controller: controller.soldCtrl,
                      focus: controller.saleFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe o total de cartelas vendidas.',
                      ),
                    ),
                    SizedBox(height: appSizes.smallSpacing),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldCard(
                            title: 'Devolução',
                            fieldFontSize: 15,
                            prefixIcon: Icons.add_chart,
                            controller: controller.devCtrl,
                            focus: controller.devolutionFocus,
                            cardInfo: AppInfoIcon(
                              text: 'Informe o total de cartelas devolvidas.',
                            ),
                          ),
                        ),
                        SizedBox(width: appSizes.smallSpacing),
                        Expanded(
                          child: TextFieldCard(
                            title: 'Faltas',
                            fieldFontSize: 15,
                            prefixIcon: Icons.zoom_out_rounded,
                            controller: controller.missCtrl,
                            focus: controller.missingFocus,
                            cardInfo: AppInfoIcon(
                              text: 'Informe o total de cartelas em falta.',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: appSizes.bigSpacing),
                    TextFieldCard(
                      title: 'Adiantamento',
                      prefixIcon: Icons.attach_money_rounded,
                      controller: controller.paidCtrl,
                      formatAsMoney: true,
                      focus: controller.moneyFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe os adiantamentos em dinheiro.',
                      ),
                    ),
                    SizedBox(height: appSizes.smallSpacing),
                    TextFieldCard(
                      title: 'Depósitos',
                      prefixIcon: Icons.post_add_rounded,
                      controller: controller.depositCtrl,
                      formatAsMoney: true,
                      focus: controller.depositFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe os depósitos.',
                      ),
                    ),
                    SizedBox(height: appSizes.smallSpacing),
                    Row(
                      children: [
                        Expanded(
                          child: InfoCard(
                            title: 'Imposto',
                            prefixIcon: Icons.post_add_rounded,
                            controller: controller.taxCtrl,
                            function: () {
                              setState(() {});
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
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
                            prefixIcon: Icons.post_add_rounded,
                            controller: controller.allowanceCtrl,
                            function: () {
                              setState(() {});
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: Text('SOOOOOU'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: appSizes.bigSpacing),
                    PriceCard(title: 'Preço da Cartela', selected: controller.selected),
                    DebtCard(widgetDebt: controller.debt, errorMessage: controller.errorMessage),
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
