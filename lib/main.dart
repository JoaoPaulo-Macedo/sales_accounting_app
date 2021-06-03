import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucky_triangle/app_designs.dart';
import 'package:lucky_triangle/widgets/app_card_info.dart';

import 'enum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MyHomePage(title: 'ACERTO DE VENDAS'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double smallSpacing = 6;
  final double bigSpacing = 17;
  final double fontSize = 18;
  final double iconSize = 25;
  final double cardHeight = 68;

  final FocusNode totalFocus = FocusNode();
  final FocusNode saleFocus = FocusNode();
  final FocusNode devolutionFocus = FocusNode();
  final FocusNode missingFocus = FocusNode();
  final FocusNode moneyFocus = FocusNode();
  final FocusNode depositFocus = FocusNode();

  final EdgeInsets cardPadding = const EdgeInsets.fromLTRB(5, 5, 0, 5);

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
    // print('${MediaQuery.of(context).padding.top}!!!!!!!!');

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
                    _textFieldCard(
                      title: 'Total de Cartelas',
                      prefixIcon: Icons.zoom_out_rounded,
                      controller: totalCtrl,
                      focus: totalFocus,
                      cardInfo: AppInfoIcon(
                        text:
                            'Informe o total de cartelas pegas para a distribuição.',
                      ),
                    ),
                    SizedBox(height: smallSpacing),
                    _textFieldCard(
                      title: 'Venda',
                      prefixIcon: Icons.add_chart,
                      controller: soldCtrl,
                      focus: saleFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe o total de cartelas vendidas.',
                      ),
                    ),
                    SizedBox(height: smallSpacing),
                    Row(
                      children: [
                        Expanded(
                          child: _textFieldCard(
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
                        SizedBox(width: smallSpacing),
                        Expanded(
                          child: _textFieldCard(
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
                    SizedBox(height: bigSpacing),
                    _textFieldCard(
                      title: 'Adiantamento',
                      prefixIcon: Icons.attach_money_rounded,
                      controller: paidCtrl,
                      formatAsMoney: true,
                      focus: moneyFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe os adiantamentos em dinheiro.',
                      ),
                    ),
                    SizedBox(height: smallSpacing),
                    _textFieldCard(
                      title: 'Depósitos',
                      prefixIcon: Icons.post_add_rounded,
                      controller: depositCtrl,
                      formatAsMoney: true,
                      focus: depositFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe os depósitos.',
                      ),
                    ),
                    SizedBox(height: smallSpacing),
                    Row(
                      children: [
                        Expanded(
                          child: _appCard(
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
                        SizedBox(width: smallSpacing),
                        Expanded(
                          child: _appCard(
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
                    SizedBox(height: bigSpacing),
                    _priceCard('Preço da Cartela'),
                    _debtCard(debt),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldCard({
    @required String title,
    @required FocusNode focus,
    @required IconData prefixIcon,
    @required AppInfoIcon cardInfo,
    @required TextEditingController controller,
    Function function,
    double fieldFontSize,
    bool formatAsMoney = false,
  }) {
    return GestureDetector(
      child: Container(
        height: cardHeight,
        decoration: AppDecoration.of(context).appTextBoxDecoration,
        child: Padding(
          padding: cardPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                prefixIcon,
                color: appColors.redColor,
                size: iconSize,
              ),
              SizedBox(width: 5),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  focusNode: focus,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: title,
                    labelStyle: TextStyle(
                      fontSize: fieldFontSize ?? fontSize,
                      color: appColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cursorColor: Colors.black,
                  onChanged: (_) => calculate(function: function),
                  onSubmitted: (_) => calculate(function: function),
                ),
              ),
              SizedBox(width: 10),
              cardInfo,
            ],
          ),
        ),
      ),
      onTap: () => focus.requestFocus(),
      onLongPress: () => print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"),
    );
  }

  Widget _priceCard(String title) {
    Widget _price(int price, Selected selection) {
      return Container(
        decoration: BoxDecoration(
          color: selection == selected
              ? appColors.priceCardColor
              : appColors.disabledColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: selection == selected ? appDecorations.priceShadow : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(Size(55, 55)),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Text(
              '${price.toString()},00',
              style: TextStyle(
                fontSize: selection == selected ? 19 : 16,
                color: selection == selected
                    ? appColors.redColor
                    : appColors.textColor,
              ),
            ),
            onPressed: () {
              setState(() {
                if (selected == selection)
                  FocusScope.of(context).requestFocus(FocusNode());
                selected = selection;
                calculate();
              });
            },
          ),
        ),
      );
    }

    return Container(
      decoration: appDecorations.appPriceBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                color: appColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: smallSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _price(10, Selected.ten),
                _price(15, Selected.fifteen),
                _price(20, Selected.twenty),
                _price(25, Selected.twentyFive),
                _price(30, Selected.thirty),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _debtCard(double debt) {
    String text = "";
    String finalDebt = "";

    if (errorMessage.isEmpty) {
      text = debt >= -0.01 ? 'Pagar:' : 'Receber:';
      if (debt < 0) debt = debt * -1;
      finalDebt = debt.toStringAsFixed(2);
    }

    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(35, 20, 35, 0),
      padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
      decoration: appDecorations.appDebtBoxDecoration,
      child: errorMessage.isEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: appColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'VarelaRound',
                  ),
                ),
                Text(
                  'R\$ $finalDebt',
                  style: TextStyle(
                    fontSize: 20,
                    color: appColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: appColors.redColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'VarelaRound',
                ),
                textScaleFactor: 1,
              ),
            ),
    );
  }

  Widget _appCard({
    @required String title,
    @required TextEditingController controller,
    @required IconData prefixIcon,
    AppInfoIcon cardInfo,
    double fieldFontSize,
    var function,
  }) {
    return GestureDetector(
      child: Container(
        height: cardHeight,
        decoration: AppDecoration.of(context).appTextBoxDecoration,
        child: Padding(
          padding: cardPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                prefixIcon,
                color: appColors.redColor,
                size: iconSize,
              ),
              SizedBox(width: 5),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: title,
                    labelStyle: TextStyle(
                      fontSize: fieldFontSize ?? fontSize,
                      color: appColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cursorColor: Colors.black,
                  onChanged: (_) => calculate(),
                  onSubmitted: (_) => calculate(),
                ),
              ),
              // SizedBox(width: 10),
              // cardInfo,
            ],
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
      if (depositCtrl.text.trim() != '')
        deposits = double.parse(depositCtrl.text.trim());
      //Tax
      if (taxCtrl.text.trim() != '')
        taxRate = double.parse(taxCtrl.text.trim()) / 100;
      //Allowance
      if (allowanceCtrl.text.trim() != '')
        allowance = double.parse(allowanceCtrl.text.trim());
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
