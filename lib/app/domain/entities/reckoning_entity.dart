import 'package:reckoning/app/presentation/pages/home/utils/home_enums.dart';

class ReckoningEntity {
  ReckoningEntity({
    required this.money,
    required this.deposits,
    required this.debt,
    required this.situation,
  });

  double money;
  double deposits;
  double debt;
  Situation situation;
}
