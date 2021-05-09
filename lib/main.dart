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
  TextEditingController soldController = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController missingController = TextEditingController();
  TextEditingController moneyPaidController = TextEditingController();
  TextEditingController depositsController = TextEditingController();
  final FocusNode saleFocus = FocusNode();
  final FocusNode devoluctionFocus = FocusNode();
  final FocusNode missingFocus = FocusNode();
  final FocusNode moneyFocus = FocusNode();
  final FocusNode depositFocus = FocusNode();
  Size size;
  Selected selected = Selected.ten;
  double debt = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.blueGrey[35],
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'VarelaRound',
              ),
            ),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                priceCard('Preço da Cartela'),
                Row(
                  children: [
                    Expanded(
                      child: textCard(
                        title: 'Venda',
                        prefixIcon: Icons.add_chart,
                        controller: soldController,
                        topMargin: 10,
                        focus: saleFocus,
                        cardInfo: AppCardInfo(

                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: textCard(
                        title: 'Devolução',
                        prefixIcon: Icons.add_chart,
                        controller: soldController,
                        topMargin: 10,
                        focus: devoluctionFocus,
                      ),
                    ),
                  ],
                ),
                textCard(
                  title: 'Cartelas em Falta',
                  prefixIcon: Icons.zoom_out_rounded,
                  controller: missingController,
                  topMargin: 10,
                  focus: missingFocus,
                ),
                textCard(
                  title: 'Adiantamento',
                  prefixIcon: Icons.attach_money_rounded,
                  controller: moneyPaidController,
                  formatAsMoney: true,
                  topMargin: 10,
                  focus: moneyFocus,
                ),
                textCard(
                  title: 'Depósitos',
                  prefixIcon: Icons.post_add_rounded,
                  controller: depositsController,
                  formatAsMoney: true,
                  topMargin: 10,
                  focus: depositFocus,
                ),
                /*Row(
                  children: [
                    Expanded(
                      child: textCard(
                        title: 'Imposto',
                        prefixIcon: Icons.post_add_rounded,
                        controller: depositsController,
                        formatAsMoney: true,
                        topMargin: 10,
                        rightMargin: 10,
                        fontSize: 15,
                        suffixWidget: IconButton(
                          icon: Icon(Icons.add_circle_outline_rounded),
                          onPressed: () => print('===================='),
                        ),
                      ),
                    ),
                    Expanded(
                      child: textCard(
                        title: 'Ajuda de Custo',
                        prefixIcon: Icons.post_add_rounded,
                        controller: depositsController,
                        formatAsMoney: true,
                        topMargin: 10,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),*/
                debtField(debt),
              ],
            ),
          ),
        ),
        /*floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0 
          ? Container() 
          : AppButton('Calcular'),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      */
      ),
    );
  }

  Widget textCard({
    @required String title,
    @required TextEditingController controller,
    IconData prefixIcon,
    bool formatAsMoney = false,
    double topMargin = 0,
    double bottomMargin = 0,
    double leftMargin = 0,
    double rightMargin = 0,
    double fontSize = 20,
    double iconSize = 33,
    Widget prefixWidget,
    FocusNode focus,
    AppCardInfo cardInfo,
  }) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          leftMargin,
          topMargin,
          rightMargin,
          bottomMargin,
        ),
        decoration: AppDecoration.appTextBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
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
                ),
              ),
              cardInfo != null ? SizedBox(width: 10,) : Container(),
              cardInfo != null ? cardInfo : Container(),
            ],
          ),
        ),
      ),
      onTap: () => focus.requestFocus(),
    );
  }

  Widget priceCard(String title) {
    Widget price(
      int price,
      Selected selection, {
      double leftMargin = 0,
      double rightMargin = 0,
    }) {
      return Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        decoration: BoxDecoration(
          color: selection == selected
              ? Colors.white
              : Colors.blueGrey[50].withOpacity(0.35),
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
                color: selection == selected ? Colors.red[900] : Colors.grey[800],
              ),
            ),
            onPressed: () {
              if (selected == selection)
                FocusScope.of(context).requestFocus(FocusNode());
              selected = selection;
              calculate();
              setState(() {});
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
                  fontSize: 20,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                price(10, Selected.ten, leftMargin: 2.5),
                price(15, Selected.fifteen, leftMargin: 2.5),
                price(20, Selected.twenty, leftMargin: 2.5),
                price(25, Selected.twentyFive, leftMargin: 2.5),
                price(30, Selected.thirty),
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
      margin: EdgeInsets.fromLTRB(35, 30, 35, 0),
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
    String soldText = soldController.text.trim();

    if (soldText == '') {
      debt = 0;
      return;
    }

    double price;
    double taxRate = 0.11;
    double missing = 0;
    double paid = 0;
    double deposits = 0;
    double allowance = 200;
    double sold = double.parse(soldText);

    if ((missingController.text.trim()) != '')
      missing = double.parse(missingController.text.trim());

    if ((moneyPaidController.text.trim()) != '')
      paid = double.parse(moneyPaidController.text.trim());

    if ((depositsController.text.trim()) != '')
      deposits = double.parse(depositsController.text.trim());

    if (selected == Selected.ten) price = 10;
    if (selected == Selected.fifteen) price = 15;
    if (selected == Selected.twenty) price = 20;
    if (selected == Selected.twentyFive) price = 25;
    if (selected == Selected.thirty) price = 30;

    double grossDebt = sold * (price * 0.82);
    double earnRate = price * 0.08;
    double taxDebt = (sold * earnRate) * taxRate;
    double missingDebt = missing * price;

    debt = grossDebt + missingDebt + taxDebt - paid - deposits - allowance;

    setState(() {});
    //ToDo: if none is selected, ask to select.
  }
}
