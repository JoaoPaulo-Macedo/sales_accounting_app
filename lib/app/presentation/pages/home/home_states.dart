import 'package:reckoning/app/presentation/pages/home/utils/home_enums.dart';
import 'package:reckoning/core/utils/app_exception.dart';

abstract class HomeState {
  const HomeState([this.price = Price.none, this.situation = Situation.none, this.debt = 0]);

  final Price price;
  final Situation situation;
  final double debt;
}

class Loading extends HomeState {}

class Fetched extends HomeState {}

class Saving extends HomeState {
  Saving({
    required Price price,
    required Situation situation,
    required double debt,
  }) : super(price, situation, debt);
}

class Reload extends HomeState {
  Reload({
    required Price price,
    required Situation situation,
    required double debt,
  }) : super(price, situation, debt);
}

class Error extends HomeState {
  const Error({required Price price, required this.error}) : super(price);

  final AppException error;
}
