import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/local_storage/domain/repository_interfaces/local_storage_repo_intf.dart';
import '../utils/local_storage/domain/use_cases/get_data_use_case/get_data_use_case.dart';
import '../utils/local_storage/domain/use_cases/save_data_use_case/save_data_use_case.dart';
import '../utils/local_storage/infrastructure/data_source/interfaces/local_storage_data_source_intf.dart';
import '../utils/local_storage/infrastructure/data_source/local_storage_data_source.dart';
import '../utils/local_storage/infrastructure/repositories/local_storage_repo.dart';

final GetIt sl = GetIt.instance;

Future<void> initialize() async {
  // Blocs will not be initialized here. Instead, they will be initialized in their
  // respective BlocProvider widgets (and the like). This is to let the flutter_bloc
  // package to manage the automatic disposal of the said bloc instances (most of it).

  // [ Use Cases ]
  sl.registerLazySingleton(
    () => SaveDataUseCase(localStorageRepo: sl<LocalStorageRepoIntf>()),
  );

  sl.registerLazySingleton(
    () => GetDataUseCase(localStorageRepo: sl<LocalStorageRepoIntf>()),
  );

  // [ Repositories ]
  sl.registerLazySingleton<LocalStorageRepoIntf>(
    () => LocalStorageRepo(
      localStorageDataSource: sl<LocalStorageDataSourceIntf>(),
    ),
  );

  // [ Data Sources ]
  // LocalStorageDataSource
  sl.registerLazySingleton<LocalStorageDataSourceIntf>(
    () {
      print('LocalStorageDataSource created.');

      return LocalStorageDataSource(
        sharedPreferences: sl<SharedPreferences>(),
      );
    },
  );

  // [ Third-party libraries/packages ]
  // SharedPreferences.
  final SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  print('Service locator initialized.');
}
