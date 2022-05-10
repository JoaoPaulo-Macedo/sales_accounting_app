import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/presentation/common/app_design.dart';
import 'package:lucky_triangle/app/presentation/common/app_sizes.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_controller.dart';

class PriceCard extends StatelessWidget {
  PriceCard({required this.title, required this.selected});

  final String title;
  final Selected selected;
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
            title,
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
              _price(10, Selected.ten, context),
              _price(15, Selected.fifteen, context),
              _price(20, Selected.twenty, context),
              _price(25, Selected.twentyFive, context),
              _price(30, Selected.thirty, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _price(int price, Selected selection, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selection == selected ? const Color.fromARGB(255, 51, 48, 54) : const Color.fromARGB(255, 48, 45, 51),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(const Size(55, 55)),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            '${price.toString()},00',
            style: TextStyle(
              fontSize: selection == selected ? 19 : 16,
              color: selection == selected ? Colors.red : Colors.grey[300],
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
