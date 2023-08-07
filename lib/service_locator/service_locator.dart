import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/local_storage/domain/repository_interfaces/local_storage_repo_intf.dart';
import '../utils/local_storage/domain/use_cases/get_data_use_case/get_data_use_case.dart';
import '../utils/local_storage/domain/use_cases/save_data_use_case/save_data_use_case.dart';
import '../utils/local_storage/infrastructure/data_source/interfaces/local_storage_data_source_intf.dart';
import '../utils/local_storage/infrastructure/data_source/local_storage_data_source.dart';
import '../utils/local_storage/infrastructure/repositories/local_storage_repo.dart';

Future<void> init() async {
  // // [ Blocs ]
  // GetIt.I.registerLazySingleton(
  //   () => SignUpDataPreservationBloc(
  //     localStorageRepo: GetIt.I<LocalStorageRepo>(),
  //   ),
  // );

  // [ Use Cases ]
  GetIt.I.registerLazySingleton(
    () => SaveDataUseCase(localStorageRepo: GetIt.I<LocalStorageRepoIntf>()),
  );

  GetIt.I.registerLazySingleton(
    () => GetDataUseCase(localStorageRepo: GetIt.I<LocalStorageRepoIntf>()),
  );

  // [ Repositories ]
  GetIt.I.registerLazySingleton<LocalStorageRepoIntf>(
    () => LocalStorageRepo(
      localStorageDataSource: GetIt.I<LocalStorageDataSourceIntf>(),
    ),
  );

  // [ Data Sources ]
  // LocalStorageDataSource
  GetIt.I.registerLazySingleton<LocalStorageDataSourceIntf>(
    () {
      print('LocalStorageDataSource created.');

      return LocalStorageDataSource(
        sharedPreferences: GetIt.I<SharedPreferences>(),
      );
    },
  );

  // [ Third-party libraries/packages ]
  // SharedPreferences.
  final SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerLazySingleton(() => sharedPreferences);

  print('Service locator initialized.');
}
