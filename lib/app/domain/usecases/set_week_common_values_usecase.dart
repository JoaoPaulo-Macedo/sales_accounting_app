import 'package:reckoning/app/domain/entities/week_common_values_entity.dart';
import 'package:reckoning/app/domain/repositories/week_common_values_repository.dart';

abstract class SetWeekCommonValuesUseCase {
  Future call(WeekCommonValuesEntity values);
}

class SetWeekCommonValuesUseCaseImp extends SetWeekCommonValuesUseCase {
  SetWeekCommonValuesUseCaseImp(this._repository);

  final WeekCommonValuesRepository _repository;

  @override
  Future call(WeekCommonValuesEntity values) async {
    await _repository.setValues(values);
  }
}
