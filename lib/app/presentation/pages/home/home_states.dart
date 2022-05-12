import 'package:lucky_triangle/app/presentation/pages/home/home_cubit.dart';
import 'package:lucky_triangle/core/utils/app_exception.dart';

abstract class HomeState {
  const HomeState({this.price = Price.none});

  final Price price;
}

class Loading extends HomeState {}

class Fetched extends HomeState {}

class Saving extends HomeState {
  const Saving({required Price price}) : super(price: price);
}

class Reload extends HomeState {
  Reload({required Price price}) : super(price: price);
}

class Calculated extends HomeState {
  const Calculated({
    required Price price,
    required this.situation,
    required this.debt,
  }) : super(price: price);

  final Situation? situation;
  final double? debt;
}

class Error extends HomeState {
  const Error({required Price price, required this.error}) : super(price: price);

  final AppException error;
}
