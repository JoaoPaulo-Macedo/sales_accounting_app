import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucky_triangle/app/design/app_designs.dart';
import 'package:lucky_triangle/app/pages/home/widgets/app_info_icon.dart';
import 'package:lucky_triangle/app/pages/home/widgets/debt_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/info_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/price_card.dart';
import 'package:lucky_triangle/app/pages/home/widgets/textfield_card.dart';
import 'package:lucky_triangle/app/root_controller.dart';
import 'enum.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode totalFocus = FocusNode();
  final FocusNode saleFocus = FocusNode();
  final FocusNode devolutionFocus = FocusNode();
  final FocusNode missingFocus = FocusNode();
  final FocusNode moneyFocus = FocusNode();
  final FocusNode depositFocus = FocusNode();

  AppSizes get appSizes => AppSizes.singleton;
  AppColors get appColors => AppColors.of(context);
  AppDecoration get appDecorations => AppDecoration.of(context);

  double debt = 0;
  Selected selected = Selected.none;
  String errorMessage = 'Informe o \"Total de Cartelas\" e a \"Venda\"';
  TextEditingController totalCtrl = TextEditingController();
  TextEditingController soldCtrl = TextEditingController();
  TextEditingController devCtrl = TextEditingController();
  TextEditingController missCtrl = TextEditingController();
  TextEditingController paidCtrl = TextEditingController();
  TextEditingController depositCtrl = TextEditingController();
  TextEditingController taxCtrl = TextEditingController();
  TextEditingController allowanceCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    taxCtrl.text = '11';
    allowanceCtrl.text = '200';
  }

  @override
  Widget build(BuildContext context) {
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
                        RootController.instance.changeTheme.changeTheme();
                      },
                    ),
                    TextFieldCard(
                      title: 'Total de Cartelas',
                      prefixIcon: Icons.zoom_out_rounded,
                      controller: totalCtrl,
                      focus: totalFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe o total de cartelas pegas para a distribuição.',
                      ),
                    ),
                    SizedBox(height: appSizes.smallSpacing),
                    TextFieldCard(
                      title: 'Venda',
                      prefixIcon: Icons.add_chart,
                      controller: soldCtrl,
                      focus: saleFocus,
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
                            controller: devCtrl,
                            focus: devolutionFocus,
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
                            controller: missCtrl,
                            focus: missingFocus,
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
                      controller: paidCtrl,
                      formatAsMoney: true,
                      focus: moneyFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe os adiantamentos em dinheiro.',
                      ),
                    ),
                    SizedBox(height: appSizes.smallSpacing),
                    TextFieldCard(
                      title: 'Depósitos',
                      prefixIcon: Icons.post_add_rounded,
                      controller: depositCtrl,
                      formatAsMoney: true,
                      focus: depositFocus,
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
                            controller: taxCtrl,
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
                            controller: allowanceCtrl,
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
                    PriceCard(title: 'Preço da Cartela', selected: selected),
                    DebtCard(widgetDebt: debt, errorMessage: errorMessage),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double devolution;
  double missing;

  void calculate({Function function}) {
    setState(() {
      if (function != null) function();

      String holdText = totalCtrl.text.trim();
      String soldText = soldCtrl.text.trim();

      if (holdText == '' || soldText == '') {
        errorMessage = 'Informe o \"Total de Cartelas\" e a \"Venda\"';
        return;
      }
      if (double.parse(holdText) < double.parse(soldText)) {
        errorMessage = '\"Venda\" não pode ser maior que \"Total de Cartelas\"';
        return;
      }

      if (double.parse(taxCtrl.text.trim()) < 0) {
        errorMessage = '\"Imposto\" não pode ser negativo';
        return;
      }

      //TODO: Pass all verifications to another file.
      //TODO: If Missing pass of 10 ask if he is sure.

      errorMessage = '';

      double hold = double.parse(holdText);
      double sold = double.parse(soldText);
      double price;
      double paid = 0;
      double taxRate = 0;
      double deposits = 0;
      double allowance = 0;
      //Devolution
      if (devCtrl.text.trim() != '' && devolutionFocus.hasFocus) {
        devolution = double.parse(devCtrl.text.trim());

        missing = hold - sold - devolution;
        missCtrl.text = (hold - sold - devolution).toStringAsFixed(0);
      } //
      else if (missCtrl.text.trim() != '' && missingFocus.hasFocus) {
        missing = double.parse(missCtrl.text.trim());

        devolution = hold - sold - missing;
        devCtrl.text = (hold - sold - missing).toStringAsFixed(0);
      } //
      else if (devCtrl.text.trim() == '' || missCtrl.text.trim() == '') {
        devolution = hold - sold;
        missing = hold - sold - devolution;

        missCtrl.text = '';
        devCtrl.text = '';
      }
      //Select Card Price
      if (selected == Selected.none) {
        errorMessage = 'Selecione o Preço da Cartela';
        return;
      }

      //Money
      if (paidCtrl.text.trim() != '') paid = double.parse(paidCtrl.text.trim());
      //Deposits
      if (depositCtrl.text.trim() != '') deposits = double.parse(depositCtrl.text.trim());
      //Tax
      if (taxCtrl.text.trim() != '') taxRate = double.parse(taxCtrl.text.trim()) / 100;
      //Allowance
      if (allowanceCtrl.text.trim() != '') allowance = double.parse(allowanceCtrl.text.trim());
      //Selected
      if (selected == Selected.ten)
        price = 10;
      else if (selected == Selected.fifteen)
        price = 15;
      else if (selected == Selected.twenty)
        price = 20;
      else if (selected == Selected.twentyFive)
        price = 25;
      else if (selected == Selected.thirty) price = 30;

      double grossDebt = sold * (price * 0.82);
      double earnRate = price * 0.08;
      double taxDebt = (sold * earnRate) * taxRate;
      double missingDebt = missing > 0 ? missing * price : 0;

      debt = grossDebt + missingDebt + taxDebt - paid - deposits - allowance;
    });
  }
}
