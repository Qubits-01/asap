import 'package:dartz/dartz.dart';

import '../../../../../core/exception_handling/failures/local_storage_failure.dart';
import '../../../../../interfaces/use_case_intf.dart';
import '../../entities/generic_map_value_entity.dart';
import '../../repository_interfaces/local_storage_repo_intf.dart';
import 'params.dart';

typedef FutureGenericMapValueEntity
    = Future<Either<LocalStorageFailure, GenericMapValueEntity>>;

class GetData extends UseCaseIntf<FutureGenericMapValueEntity, Params> {
  const GetData({
    required LocalStorageRepoIntf localStorageRepo,
  }) : _localStorageRepo = localStorageRepo;

  final LocalStorageRepoIntf _localStorageRepo;

  @override
  FutureGenericMapValueEntity call(Params params) async {
    return await _localStorageRepo.getData(
      key: params.key,
    );
  }
}
