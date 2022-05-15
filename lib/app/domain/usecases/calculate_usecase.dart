import 'package:reckoning/app/domain/entities/raffle_week_entity.dart';
import 'package:reckoning/app/domain/entities/reckoning_entity.dart';
import 'package:reckoning/app/domain/entities/week_common_values_entity.dart';
import 'package:reckoning/app/presentation/pages/home/utils/home_enums.dart';
import 'package:reckoning/core/utils/app_exception.dart';

abstract class CalculateUseCase {
  ReckoningEntity call(
    WeekCommonValuesEntity commonValues,
    RaffleWeekEntity raffle,
    ReckoningEntity reckoning,
  );
}

class CalculateUseCaseImp extends CalculateUseCase {
  @override
  ReckoningEntity call(
    WeekCommonValuesEntity commonValues,
    RaffleWeekEntity raffle,
    ReckoningEntity reckoning,
  ) {
    validateFields(commonValues, raffle);

    double price = 0;

    switch (raffle.price) {
      case Price.ten:
        price = 10;
        break;
      case Price.fifteen:
        price = 15;
        break;
      case Price.twenty:
        price = 20;
        break;
      case Price.twentyFive:
        price = 25;
        break;
      case Price.thirty:
        price = 30;
        break;
      case Price.none:
        throw Exception();
    }

    double fee = price * 0.82;
    double grossDebt = raffle.sold! * fee;
    double earnRate = price * 0.08;
    double taxRate = commonValues.tax! / 100;
    double taxDebt = (raffle.sold! * earnRate) * taxRate;
    double missingDebt = raffle.missing! > 0 ? raffle.missing! * price : 0;

    reckoning.debt = grossDebt + missingDebt + taxDebt - reckoning.money - reckoning.deposits - commonValues.allowance!;

    reckoning.situation = reckoning.debt > 0 ? Situation.debt : Situation.credit;

    return reckoning;
  }

  validateFields(WeekCommonValuesEntity commonValues, RaffleWeekEntity raffle) {
    if (raffle.sold! > commonValues.totalCards!) {
      throw AppException('Venda não pode ser maior que total de cartelas!');
    }
    if (raffle.devolution! > commonValues.totalCards!) {
      throw AppException('Devolução não pode ser maior que total de cartelas!');
    }
    if (raffle.missing! > commonValues.totalCards!) {
      throw AppException('Faltas não pode ser maior que total de cartelas!');
    }
    if (raffle.sold! + raffle.devolution! > commonValues.totalCards!) {
      throw AppException('Venda mais devolução não pode ser maior que total de cartelas!');
    }
    if (raffle.sold! + raffle.missing! > commonValues.totalCards!) {
      throw AppException('Venda mais faltas não pode ser maior que total de cartelas!');
    }
  }
}
