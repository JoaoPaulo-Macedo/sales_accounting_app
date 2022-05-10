import 'package:lucky_triangle/app/domain/entities/week_common_values.dart';

abstract class WeekCommonValuesDataSource {
  Future<WeekCommonValuesEntity?> getValues();
  Future setValues();
  Future updateValues();
}
