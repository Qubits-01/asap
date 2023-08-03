import 'package:dartz/dartz.dart';

import '../../../../core/exception_handling/failures/local_storage_failure.dart';

abstract class LocalStorageRepoIntf {
  const LocalStorageRepoIntf();

  /// Data is retrieved using the key.
  Future<Either<LocalStorageFailure, T>> getData<T>({
    required String key,
  });

  /// Data is saved as a key-value pair.
  ///
  /// Inspired by the package Hive.
  /// (Ref: https://pub.dev/packages/hive)
  Future<Either<LocalStorageFailure, void>> saveData<T>({
    required String key,
    required T value,
  });
}
