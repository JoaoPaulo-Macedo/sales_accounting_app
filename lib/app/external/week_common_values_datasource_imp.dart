import 'dart:convert';

import 'package:lucky_triangle/app/data/datasources/week_common_values_datasource.dart';
import 'package:lucky_triangle/app/data/dtos/week_common_values_dto.dart';
import 'package:lucky_triangle/app/domain/entities/week_common_values.dart';
import 'package:lucky_triangle/core/domain/services/local_data_service.dart';

class WeekCommonValuesDataSourceImp extends WeekCommonValuesDataSource {
  WeekCommonValuesDataSourceImp(this._service);

  final LocalDataService _service;
  final String _key = 'week';

  @override
  Future<WeekCommonValuesEntity?> getValues() async {
    final json = await _service.getString(_key);

    if (json == null) return null;

    return WeekCommonValuesDTO.fromJson(jsonDecode(json));
  }

  @override
  Future setValues() {
    // TODO: implement setValues
    throw UnimplementedError();
  }

  @override
  Future updateValues() {
    // TODO: implement updateValues
    throw UnimplementedError();
  }
}
