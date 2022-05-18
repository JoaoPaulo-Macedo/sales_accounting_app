import 'package:sales_accounting/app/domain/entities/week_common_values_entity.dart';

abstract class WeekCommonValuesDataSource {
  Future<WeekCommonValuesEntity?> getValues();
  Future setValues(WeekCommonValuesEntity values);
}
