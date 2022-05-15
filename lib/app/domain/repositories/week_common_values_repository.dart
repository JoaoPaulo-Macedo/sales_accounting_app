import 'package:reckoning/app/domain/entities/week_common_values_entity.dart';

abstract class WeekCommonValuesRepository {
  Future<WeekCommonValuesEntity?> getValues();
  Future setValues(WeekCommonValuesEntity values);
}
