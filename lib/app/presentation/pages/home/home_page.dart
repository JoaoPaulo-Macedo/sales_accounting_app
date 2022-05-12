import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lucky_triangle/app/domain/usecases/get_week_common_values_usecase.dart';
import 'package:lucky_triangle/app/domain/usecases/set_week_common_values_usecase.dart';
import 'package:lucky_triangle/app/presentation/common/app_design.dart';
import 'package:lucky_triangle/app/presentation/pages/home/components/app_snackbar.dart';
import 'package:lucky_triangle/app/presentation/pages/home/components/cards_component.dart';
import 'package:lucky_triangle/app/presentation/pages/home/components/debt_component.dart';
import 'package:lucky_triangle/app/presentation/pages/home/components/reckoning_component.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit cubit;
  Situation? situation;
  double? debt;
  //TODO: isn't it state? Shouldn't it be on HomeState abstract class?

  @override
  void initState() {
    super.initState();

    cubit = HomeCubit(
      GetIt.I.get<GetWeekCommonValuesUseCase>(),
      GetIt.I.get<SetWeekCommonValuesUseCase>(),
    );
  }

  @override
  void dispose() {
    cubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: BlocProvider.value(
          value: cubit,
          child: BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is Error) {
                situation = null;
                debt = null;

                AppSnackBar.show(context, message: state.error.message, type: AppSnackBarType.error);
              }
            },
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const SizedBox();
                }

                if (state is Calculated) {
                  situation = state.situation;
                  debt = state.debt;
                }

                return Stack(
                  children: [
                    SingleChildScrollView(
                      physics: isKeyboardOpen ? null : const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardsComponent(cubit),
                                ReckoningComponent(cubit),
                                DebtComponent(
                                  price: state.price,
                                  situation: situation,
                                  debt: debt,
                                  onPressed: cubit.changeSelected,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state is Saving,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: AppDesign().borderRadius,
                          ),
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
