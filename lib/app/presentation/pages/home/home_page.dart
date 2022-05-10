import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lucky_triangle/app/domain/usecases/get_week_common_values_usecase.dart';
import 'package:lucky_triangle/app/presentation/pages/home/components/cards_component.dart';
import 'package:lucky_triangle/app/presentation/pages/home/components/debt_component.dart';
import 'package:lucky_triangle/app/presentation/pages/home/components/reckoning_component.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();

    controller = HomeController(GetIt.I.get<GetWeekCommonValuesUseCase>());
  }

  @override
  void dispose() {
    controller.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: BlocProvider.value(
                  value: controller,
                  child: BlocBuilder<HomeController, HomeState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardsComponent(controller),
                          ReckoningComponent(controller),
                          DebtComponent(controller),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
