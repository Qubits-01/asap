import 'package:dartz/dartz.dart';

import '../../../../core/exception_handling/failures/local_storage_failure.dart';
import '../../../../interfaces/entity_intf.dart';

abstract class LocalStorageRepoIntf {
  const LocalStorageRepoIntf();

  /// Data is saved as a key-value pair.
  ///
  /// Inspired by the package Hive.
  /// (Ref: https://pub.dev/packages/hive)
  Future<Either<LocalStorageFailure, void>> saveData<T>({
    required String key,
    required T value,
  });

  /// Data is retrieved using the key.
  Future<Either<LocalStorageFailure, T>> getData<T extends EntityIntf>({
    required String key,
  });
}
