import 'package:sales_accounting/app/data/datasources/week_common_values_datasource.dart';
import 'package:sales_accounting/app/domain/entities/week_common_values_entity.dart';
import 'package:sales_accounting/app/domain/repositories/week_common_values_repository.dart';

class WeekCommonValuesRepositoryImp extends WeekCommonValuesRepository {
  WeekCommonValuesRepositoryImp(this._dataSource);

  final WeekCommonValuesDataSource _dataSource;

  @override
  Future<WeekCommonValuesEntity?> getValues() async {
    return await _dataSource.getValues();
  }

  @override
  Future setValues(WeekCommonValuesEntity values) async {
    await _dataSource.setValues(values);
  }
}
