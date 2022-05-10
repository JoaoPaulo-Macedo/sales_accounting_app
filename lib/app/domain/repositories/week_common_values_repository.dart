import 'package:lucky_triangle/app/domain/entities/week_common_values_entity.dart';

abstract class WeekCommonValuesRepository {
  Future<WeekCommonValuesEntity?> getValues();
  Future setValues();
  Future updateValue();
}
