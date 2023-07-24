import 'package:dartz/dartz.dart';

import '../../../../core/exception_handling/failures/local_storage_failure.dart';
import '../../../../interfaces/params_intf.dart';
import '../../../../interfaces/use_case_intf.dart';
import '../repository_interfaces/local_storage_repo_intf.dart';

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

class Params implements ParamsIntf {
  const Params({
    required String key,
    required Map<String, dynamic> value,
  })  : _key = key,
        _value = value;

  final String _key;
  final Map<String, dynamic> _value;

  // Getters.
  String get key => _key;
  Map<String, dynamic> get value => _value;

  // [Equatable] package setup requirements.
  @override
  List<Object?> get props => [key, value];

  @override
  bool? get stringify => false;
}
