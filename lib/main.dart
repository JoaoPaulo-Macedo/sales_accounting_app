import 'package:flutter/material.dart';
import 'package:lucky_triangle/app_decoration.dart';
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
      theme: ThemeData(primaryColor: Colors.grey),
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
  final FocusNode saleFocus = FocusNode();
  final FocusNode devolutionFocus = FocusNode();
  final FocusNode missingFocus = FocusNode();
  final FocusNode moneyFocus = FocusNode();
  final FocusNode depositFocus = FocusNode();
  final double fontSize = 18;

  double debt = 0;
  Selected selected = Selected.ten;
  TextEditingController holdCardsController = TextEditingController();
  TextEditingController soldController = TextEditingController();
  TextEditingController devolutionController = TextEditingController();
  TextEditingController price = TextEditingController();
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
    final topMargin = 8.0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.blueGrey[35],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  _priceCard('Preço da Cartela'),
                  _textCard(
                    title: 'Total de Cartelas',
                    prefixIcon: Icons.zoom_out_rounded,
                    controller: holdCardsController,
                    topMargin: topMargin,
                    focus: missingFocus,
                    cardInfo: AppCardInfo(
                      text:
                          'Informe o total de cartelas pegas para a distribuição.',
                    ),
                  ),
                  _textCard(
                    title: 'Venda',
                    prefixIcon: Icons.add_chart,
                    controller: soldController,
                    topMargin: topMargin,
                    focus: saleFocus,
                    cardInfo: AppCardInfo(
                      text: 'Informe o total de cartelas vendidas.',
                    ),
                  ),
                  _textCard(
                    title: 'Devolução',
                    prefixIcon: Icons.add_chart,
                    controller: devolutionController,
                    topMargin: topMargin,
                    focus: devolutionFocus,
                    cardInfo: AppCardInfo(
                      text: 'Informe o total de cartelas devolvidas.',
                    ),
                  ),
                  _textCard(
                    title: 'Adiantamento',
                    prefixIcon: Icons.attach_money_rounded,
                    controller: moneyPaidController,
                    formatAsMoney: true,
                    topMargin: topMargin,
                    focus: moneyFocus,
                    cardInfo: AppCardInfo(
                      text: 'Informe os adiantamentos em dinheiro.',
                    ),
                  ),
                  _textCard(
                    title: 'Depósitos',
                    prefixIcon: Icons.post_add_rounded,
                    controller: depositsController,
                    formatAsMoney: true,
                    topMargin: topMargin,
                    focus: depositFocus,
                    cardInfo: AppCardInfo(
                      text: 'Informe os depósitos.',
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _textCard(
                          title: 'Imposto',
                          prefixIcon: Icons.post_add_rounded,
                          controller: taxController,
                          formatAsMoney: true,
                          topMargin: topMargin,
                          rightMargin: 10,
                          readOnly: true,
                          function: () {
                            print('SOOOOU');
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
                      Expanded(
                        child: _textCard(
                          title: 'Ajuda de Custo',
                          prefixIcon: Icons.post_add_rounded,
                          controller: allowanceController,
                          formatAsMoney: true,
                          topMargin: topMargin,
                          readOnly: true,
                          function: () {
                            print('SOOOOU');
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
                  debtField(debt),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textCard({
    @required String title,
    @required TextEditingController controller,
    bool readOnly = false,
    bool formatAsMoney = false,
    double topMargin = 0,
    double bottomMargin = 0,
    double leftMargin = 0,
    double rightMargin = 0,
    double fontSize = 20,
    double iconSize = 33,
    Widget prefixWidget,
    IconData prefixIcon,
    FocusNode focus,
    AppCardInfo cardInfo,
    var function,
  }) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          leftMargin,
          topMargin,
          rightMargin,
          bottomMargin,
        ),
        decoration: AppDecoration.of(context).appTextBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  readOnly: readOnly,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  focusNode: focus,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: title,
                    labelStyle: TextStyle(
                      fontSize: fontSize,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: Icon(
                      prefixIcon,
                      color: Colors.red[800],
                      size: iconSize,
                    ),
                  ),
                  cursorColor: Colors.black,
                  onChanged: (_) => calculate(),
                  onSubmitted: (_) => calculate(),
                  onTap: function == null
                      ? () {
                          print('FUDEEEU');
                        }
                      : function,
                ),
              ),
              cardInfo != null ? SizedBox(width: 10) : Container(),
              cardInfo != null ? cardInfo : Container(),
            ],
          ),
        ),
      ),
      onTap: function ?? () => focus.requestFocus(),
    );
  }

  Widget _priceCard(String title) {
    Widget _price(int price, Selected selection, {bool hasMargin = true}) {
      return Container(
        margin: EdgeInsets.only(left: hasMargin ? 2.5 : 0),
        decoration: BoxDecoration(
          color: selection == selected ? Colors.white : Colors.grey[100],
          borderRadius: BorderRadius.circular(100),
          boxShadow: selection == selected ? AppDecoration.priceShadow : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(Size(55, 55)),
            ),
            child: Text(
              '${price.toString()},00',
              style: TextStyle(
                fontSize: selection == selected ? 19 : 17,
                color:
                    selection == selected ? Colors.red[900] : Colors.grey[800],
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
      decoration: AppDecoration.appPriceBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _price(10, Selected.ten),
                _price(15, Selected.fifteen),
                _price(20, Selected.twenty),
                _price(25, Selected.twentyFive),
                _price(30, Selected.thirty, hasMargin: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget debtField(double debt) {
    String text = debt >= 0 ? 'Pagar:' : 'Receber:';
    //if (debt < 0) debt = debt.abs();

    return Container(
      margin: EdgeInsets.fromLTRB(35, 20, 35, 0),
      padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
      decoration: AppDecoration.appDebtBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontFamily: 'VarelaRound',
            ),
          ),
          Text(
            'R\$ ${debt.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget AppButton(String title) {
    return ElevatedButton(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.red[900],
        minimumSize: Size(MediaQuery.of(context).size.width - 40, 50),
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: calculate,
    );
  }

  void calculate() {
    String holdText = holdCardsController.text.trim();
    String soldText = soldController.text.trim();

    if (holdText == '' || soldText == '') {
      debt = 0;
      return;
    }

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

    setState(() {});
  }
}
