import 'package:reckoning/app/presentation/pages/home/utils/home_enums.dart';

class RaffleWeekEntity {
  RaffleWeekEntity({
    required this.sold,
    required this.devolution,
    required this.missing,
    required this.price,
  });

  int? sold;
  int? devolution;
  int? missing;
  Price price;
}
