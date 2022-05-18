import 'package:get_it/get_it.dart';
import 'package:sales_accounting/app/data/datasources/week_common_values_datasource.dart';
import 'package:sales_accounting/app/data/repositories/week_common_values_repository_imp.dart';
import 'package:sales_accounting/app/domain/repositories/week_common_values_repository.dart';
import 'package:sales_accounting/app/domain/usecases/calculate_usecase.dart';
import 'package:sales_accounting/app/domain/usecases/get_week_common_values_usecase.dart';
import 'package:sales_accounting/app/domain/usecases/set_week_common_values_usecase.dart';
import 'package:sales_accounting/app/external/week_common_values_datasource_imp.dart';
import 'package:sales_accounting/core/data/services/preferences_service_imp.dart';
import 'package:sales_accounting/core/domain/services/local_data_service.dart';

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
    _getIt.registerLazySingleton<CalculateUseCase>(
      () => CalculateUseCaseImp(),
    );
    _getIt.registerLazySingleton<GetWeekCommonValuesUseCase>(
      () => GetWeekCommonValuesUseCaseImp(_getIt()),
    );
    _getIt.registerLazySingleton<SetWeekCommonValuesUseCase>(
      () => SetWeekCommonValuesUseCaseImp(_getIt()),
    );
  }
}
