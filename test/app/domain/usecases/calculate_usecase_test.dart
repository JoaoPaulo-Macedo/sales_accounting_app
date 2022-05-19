import 'package:flutter_test/flutter_test.dart';
import 'package:sales_accounting/app/domain/entities/raffle_week_entity.dart';
import 'package:sales_accounting/app/domain/entities/reckoning_entity.dart';
import 'package:sales_accounting/app/domain/entities/week_common_values_entity.dart';
import 'package:sales_accounting/app/domain/usecases/calculate_usecase.dart';
import 'package:sales_accounting/app/presentation/pages/home/utils/home_enums.dart';

void main() {
  test('Calculate', () {
    var usecase = CalculateUseCaseImp();

    var commonValues = WeekCommonValuesEntity(totalCards: 1000, tax: 10.45, allowance: 200);
    var raffle = RaffleWeekEntity(sold: 500, devolution: 499, missing: 1, price: Price.ten);
    var reckoning = ReckoningEntity(money: 0, deposits: 0, debt: 0, situation: Situation.none);

    reckoning = usecase(commonValues, raffle, reckoning);

    expect(reckoning.debt, 3951.8);
    expect(reckoning.situation, Situation.debt);
  });
}
