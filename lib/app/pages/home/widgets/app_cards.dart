import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/design/app_designs.dart';
import '../enum.dart';

class PriceCard extends StatefulWidget {
  PriceCard({
    @required this.title,
    @required this.context,
  });

  final String title;
  final BuildContext context;

  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  Selected selected = Selected.ten;

  @override
  Widget build(BuildContext context) {
    final decoration = AppDecoration.of(context);

    return Container(
      decoration: decoration.appPriceBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.title,
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

  Widget price(
    int price,
    Selected selection, {
    double leftMargin = 0,
    double rightMargin = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      decoration: BoxDecoration(
          color: selection == selected ? Colors.red[900] : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red[900], width: 0.5)),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size(55, 55)),
        ),
        child: Text(
          '${price.toString()},00',
          style: TextStyle(fontSize: 17, color: selection == selected ? Colors.white : Colors.grey[800]),
        ),
        onPressed: () {
          if (selected == selection) FocusScope.of(context).requestFocus(FocusNode());
          selected = selection;
          //calculate();
          setState(() {});
        },
      ),
    );
  }
}
