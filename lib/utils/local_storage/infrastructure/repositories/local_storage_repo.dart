import 'package:dartz/dartz.dart';

import '../../../../core/exception_handling/failures/local_storage_failure.dart';
import '../../domain/repository_interfaces/local_storage_repo_intf.dart';

class LocalStorageRepo implements LocalStorageRepoIntf {
  @override
  Future<Either<LocalStorageFailure, T>> getData<T>({required String key}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<Either<LocalStorageFailure, void>> saveData<T>({
    required String key,
    required T value,
  }) {
    // TODO: implement saveData
    throw UnimplementedError();
  }
}
