import 'package:flutter/material.dart';

enum Selected { none, ten, fifteen, twenty, twentyFive, thirty }

class HomeController {
  HomeController();

  double debt = 0;
  double devolution = 0;
  double missing = 0;
  Selected selected = Selected.none;
  String errorMessage = 'Informe o \"Total de Cartelas\" e a \"Venda\"';
  final FocusNode totalFocus = FocusNode();
  final FocusNode saleFocus = FocusNode();
  final FocusNode devolutionFocus = FocusNode();
  final FocusNode missingFocus = FocusNode();
  final FocusNode moneyFocus = FocusNode();
  final FocusNode depositFocus = FocusNode();
  final TextEditingController totalCtrl = TextEditingController();
  final TextEditingController soldCtrl = TextEditingController();
  final TextEditingController devCtrl = TextEditingController();
  final TextEditingController missCtrl = TextEditingController();
  final TextEditingController paidCtrl = TextEditingController();
  final TextEditingController depositCtrl = TextEditingController();
  final TextEditingController taxCtrl = TextEditingController();
  final TextEditingController allowanceCtrl = TextEditingController();

  void calculate({Function? function}) {
    // setState(() {
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
      double price = 0;
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
    // });
  }
}
