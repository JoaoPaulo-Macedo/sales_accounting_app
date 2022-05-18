import 'package:flutter/material.dart';
import 'package:sales_accounting/app/presentation/common/app_design.dart';
import 'package:sales_accounting/app/presentation/common/app_sizes.dart';
import 'package:sales_accounting/app/presentation/pages/home/utils/home_enums.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({Key? key, required this.price, required this.onPressed}) : super(key: key);

  final Price price;
  final Function(Price price) onPressed;
  final sizes = const AppSizes();

  @override
  Widget build(BuildContext context) {
    var design = AppDesign();

    return Container(
      decoration: design.boxDecoration,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Preço da Cartela',
            //TODO: from material
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[300],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: sizes.smallSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _price(10, Price.ten, context),
              _price(15, Price.fifteen, context),
              _price(20, Price.twenty, context),
              _price(25, Price.twentyFive, context),
              _price(30, Price.thirty, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _price(int cardPrice, Price price, BuildContext context) {
    bool isSelected = price == this.price;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color.fromARGB(255, 51, 48, 54) : const Color.fromARGB(255, 48, 45, 51),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(const Size(55, 55)),
            overlayColor: MaterialStateProperty.all(Colors.red.withOpacity(0.2)),
          ),
          child: Text(
            '${cardPrice.toString()},00',
            style: TextStyle(
              fontSize: isSelected ? 19 : 16,
              color: isSelected ? Colors.red : Colors.grey[300],
            ),
          ),
          onPressed: () => onPressed(price),
        ),
      ),
    );
  }
}
