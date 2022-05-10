import 'package:lucky_triangle/app/domain/entities/week_common_values.dart';
import 'package:lucky_triangle/app/domain/repositories/week_common_values_repository.dart';

abstract class GetWeekCommonValuesUseCase {
  Future<WeekCommonValuesEntity?> call();
}

class GetWeekCommonValuesUseCaseImp extends GetWeekCommonValuesUseCase {
  GetWeekCommonValuesUseCaseImp(this._repository);

  final WeekCommonValuesRepository _repository;

  @override
  Future<WeekCommonValuesEntity?> call() async {
    return await _repository.getValues();
  }
}
