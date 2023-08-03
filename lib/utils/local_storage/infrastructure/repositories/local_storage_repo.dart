import 'package:dartz/dartz.dart';

import '../../../../core/exception_handling/exceptions/local_storage_exception.dart';
import '../../../../core/exception_handling/failures/local_storage_failure.dart';
import '../../domain/repository_interfaces/local_storage_repo_intf.dart';
import '../data_source/interfaces/local_storage_data_source_intf.dart';

class LocalStorageRepo implements LocalStorageRepoIntf {
  const LocalStorageRepo({
    required LocalStorageDataSourceIntf localStorageDataSource,
  }) : _localStorageDataSource = localStorageDataSource;

  final LocalStorageDataSourceIntf _localStorageDataSource;

  @override
  Future<Either<LocalStorageFailure, T>> getData<T>({
    required String key,
  }) async {
    late final T data;

    try {
      // [ Step 1 ]: Get the data from the Local Storage.
      data = await _localStorageDataSource.getData<T>(key: key);

      // [ Step 2 ]: Return the data.
      return Right(data);

      // [Expected exceptions]
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(
        title: '${e.title} Failure',
        message: e.message,
        stackTrace: e.stackTrace,
      ));

      // [Unexpected exceptions]
    } catch (e, stackTrace) {
      return Left(LocalStorageFailure(
        title: 'Local Storage Failure',
        message:
            'Something went wrong when retrieving or saving data on the Local Storage.',
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<LocalStorageFailure, void>> saveData<T>({
    required String key,
    required T value,
  }) async {
    try {
      // [ Step 1 ]: Save the data on the local storage.
      await _localStorageDataSource.saveData(key: key, value: value);

      // [ Step 2 ]: Return success (in this case, return null).
      // I.e., returning null means that the data was saved successfully.
      return const Right(null);

      // [Expected exceptions]
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(
        title: '${e.title} Failure',
        message: e.message,
        stackTrace: e.stackTrace,
      ));

      // [Unexpected exceptions]
    } catch (e, stackTrace) {
      return Left(LocalStorageFailure(
        title: 'Local Storage Failure',
        message:
            'Something went wrong when retrieving or saving data on the Local Storage.',
        stackTrace: stackTrace,
      ));
    }
  }
}
