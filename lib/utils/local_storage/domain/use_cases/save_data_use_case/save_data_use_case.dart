import 'package:dartz/dartz.dart';

import '../../../../../core/exception_handling/failures/local_storage_failure.dart';
import '../../../../../interfaces/use_case_intf.dart';
import '../../repository_interfaces/local_storage_repo_intf.dart';
import 'params.dart';

typedef FutureGenericMapValueEntity = Future<Either<LocalStorageFailure, void>>;

class SaveDataUseCase
    implements UseCaseIntf<FutureGenericMapValueEntity, Params> {
  const SaveDataUseCase({
    required LocalStorageRepoIntf localStorageRepo,
  }) : _localStorageRepo = localStorageRepo;

  final LocalStorageRepoIntf _localStorageRepo;

  @override
  FutureGenericMapValueEntity call(Params params) async {
    return await _localStorageRepo.saveData(
      key: params.key,
      value: params.value,
    );
  }
}
