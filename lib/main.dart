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
      theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.grey),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
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
  final double spacing = 8;
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
  String errorMessage = 'Selecione o Preço da Cartela';
  TextEditingController totalCardsController = TextEditingController();
  TextEditingController soldController = TextEditingController();
  TextEditingController devolutionController = TextEditingController();
  TextEditingController missingController = TextEditingController();
  TextEditingController moneyPaidController = TextEditingController();
  TextEditingController depositsController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController allowanceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    taxController.text = '11%';
    allowanceController.text = '200';
  }

  @override
  Widget build(BuildContext context) {
    print('${MediaQuery.of(context).padding.top}!!!!!!!!');

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
                      controller: totalCardsController,
                      focus: totalFocus,
                      cardInfo: AppInfoIcon(
                        text:
                            'Informe o total de cartelas pegas para a distribuição.',
                      ),
                    ),
                    SizedBox(height: spacing),
                    _textFieldCard(
                      title: 'Venda',
                      prefixIcon: Icons.add_chart,
                      controller: soldController,
                      focus: saleFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe o total de cartelas vendidas.',
                      ),
                    ),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        Expanded(
                          child: _textFieldCard(
                            title: 'Devolução',
                            fieldFontSize: 15,
                            prefixIcon: Icons.add_chart,
                            controller: devolutionController,
                            focus: devolutionFocus,
                            cardInfo: AppInfoIcon(
                              text: 'Informe o total de cartelas devolvidas.',
                            ),
                          ),
                        ),
                        SizedBox(width: spacing),
                        Expanded(
                          child: _textFieldCard(
                            title: 'Faltas',
                            fieldFontSize: 15,
                            prefixIcon: Icons.zoom_out_rounded,
                            controller: missingController,
                            focus: missingFocus,
                            cardInfo: AppInfoIcon(
                              text: 'Informe o total de cartelas em falta.',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing),
                    _textFieldCard(
                      title: 'Adiantamento',
                      prefixIcon: Icons.attach_money_rounded,
                      controller: moneyPaidController,
                      formatAsMoney: true,
                      focus: moneyFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe os adiantamentos em dinheiro.',
                      ),
                    ),
                    SizedBox(height: spacing),
                    _textFieldCard(
                      title: 'Depósitos',
                      prefixIcon: Icons.post_add_rounded,
                      controller: depositsController,
                      formatAsMoney: true,
                      focus: depositFocus,
                      cardInfo: AppInfoIcon(
                        text: 'Informe os depósitos.',
                      ),
                    ),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        Expanded(
                          child: _appCard(
                            title: 'Imposto',
                            prefixIcon: Icons.post_add_rounded,
                            controller: taxController,
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
                        SizedBox(width: spacing),
                        Expanded(
                          child: _appCard(
                            title: 'Ajuda de Custo',
                            prefixIcon: Icons.post_add_rounded,
                            controller: allowanceController,
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
                    SizedBox(height: spacing),
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
                      color: appColors.greyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cursorColor: Colors.black,
                  onChanged: (_) => calculate(),
                  onSubmitted: (_) => calculate(),
                ),
              ),
              SizedBox(width: 10),
              cardInfo,
            ],
          ),
        ),
      ),
      onTap: () => focus.requestFocus(),
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
                    : appColors.greyColor,
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
                color: appColors.greyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing),
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
      text = debt >= 0 ? 'Pagar:' : 'Receber:';
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
                    color: appColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'VarelaRound',
                  ),
                ),
                Text(
                  'R\$ $finalDebt',
                  style: TextStyle(
                    fontSize: 20,
                    color: appColors.greyColor,
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
                      color: appColors.greyColor,
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

  void calculate() {
    setState(() {
      String holdText = totalCardsController.text.trim();
      String soldText = soldController.text.trim();

      if (selected == Selected.none) {
        errorMessage = 'Selecione o Preço da Cartela';
        return;
      }
      if (holdText == '' || soldText == '') {
        errorMessage = 'Informe Total de Cartelas e a Venda';
        return;
      }
      if (double.parse(holdText) < double.parse(soldText)) {
        errorMessage = 'Venda não pode ser maior que Total de Cartelas';
        return;
      }

      errorMessage = '';

      double price;
      double taxRate = 0.11;
      double devolution = 0;
      double paid = 0;
      double deposits = 0;
      double allowance = 200;
      double holdCards = double.parse(holdText);
      double soldCards = double.parse(soldText);

      if ((devolutionController.text.trim()) != '')
        devolution = double.parse(devolutionController.text.trim());
      else
        devolution = holdCards - soldCards;

      if ((moneyPaidController.text.trim()) != '')
        paid = double.parse(moneyPaidController.text.trim());

      if ((depositsController.text.trim()) != '')
        deposits = double.parse(depositsController.text.trim());

      if (selected == Selected.ten) price = 10;
      if (selected == Selected.fifteen) price = 15;
      if (selected == Selected.twenty) price = 20;
      if (selected == Selected.twentyFive) price = 25;
      if (selected == Selected.thirty) price = 30;

      double grossDebt = soldCards * (price * 0.82);
      double earnRate = price * 0.08;
      double taxDebt = (soldCards * earnRate) * taxRate;
      double missing = holdCards - soldCards - devolution;
      double missingDebt = missing >= 0 ? missing * price : 0;

      debt = grossDebt + missingDebt + taxDebt - paid - deposits - allowance;
      if (debt < 0) debt = debt * -1;
    });
  }
}
