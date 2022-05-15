import 'package:get_it/get_it.dart';
import 'package:reckoning/app/data/datasources/week_common_values_datasource.dart';
import 'package:reckoning/app/data/repositories/week_common_values_repository_imp.dart';
import 'package:reckoning/app/domain/repositories/week_common_values_repository.dart';
import 'package:reckoning/app/domain/usecases/get_week_common_values_usecase.dart';
import 'package:reckoning/app/domain/usecases/set_week_common_values_usecase.dart';
import 'package:reckoning/app/external/week_common_values_datasource_imp.dart';
import 'package:reckoning/core/data/services/preferences_service_imp.dart';
import 'package:reckoning/core/domain/services/local_data_service.dart';

class Inject {
  static final GetIt _getIt = GetIt.instance;

  static init() {
    // Services
    _getIt.registerLazySingleton<LocalDataService>(() => PreferencesServiceImp());

    // DataSources
    _getIt.registerLazySingleton<WeekCommonValuesDataSource>(
      () => WeekCommonValuesDataSourceImp(_getIt()),
    );

    // Repositories
    _getIt.registerLazySingleton<WeekCommonValuesRepository>(
      () => WeekCommonValuesRepositoryImp(_getIt()),
    );

    // UseCases
    _getIt.registerLazySingleton<GetWeekCommonValuesUseCase>(
      () => GetWeekCommonValuesUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<SetWeekCommonValuesUseCase>(
      () => SetWeekCommonValuesUseCaseImp(_getIt()),
    );
  }
}
