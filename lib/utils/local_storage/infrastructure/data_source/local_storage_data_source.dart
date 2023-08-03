import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/exception_handling/exceptions/local_storage_exception.dart';
import 'interfaces/local_storage_data_source_intf.dart';

class LocalStorageDataSource implements LocalStorageDataSourceIntf {
  const LocalStorageDataSource({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<T> getData<T>({required String key}) {
    late final T? value;

    // [ Step 1 ]: Get the corresponding value (by data type) from the local storage.
    //
    // Using the 'is' keyword is more preferable than the 'runtimeType' property
    // of a variable in determining the type of the said variable. This is because
    // the 'is' keyword works with subclasses while the 'runtimeType' property
    // does not (ref: https://stackoverflow.com/questions/51284575/flutter-evaluate-if-var-is-integer-or-string).
    if (T is int) {
      value = _sharedPreferences.getInt(key) as T?;
    } else if (T is double) {
      value = _sharedPreferences.getDouble(key) as T?;
    } else if (T is String) {
      value = _sharedPreferences.getString(key) as T?;
    } else if (T is bool) {
      value = _sharedPreferences.getBool(key) as T?;
    } else if (T is List<String>) {
      value = _sharedPreferences.getStringList(key) as T?;
    } else {
      throw LocalStorageException(
        title: 'Local Storage',
        message:
            'LocalStorageDataSource.getData: Unsupported type: ${T.runtimeType}',
        stackTrace: StackTrace.current,
      );
    }

    // [ Step 2 ]: Throw an exception if the retrieved value is null.
    // This means that the key does not exist in the local storage.
    if (value == null) {
      throw LocalStorageException(
        title: 'Local Storage',
        message:
            'LocalStorageDataSource.getData: The key does not exist in the local storage.',
        stackTrace: StackTrace.current,
      );
    }

    // [ Step 3 ]: Return the retrieved value as a Future type.
    // It is a Future type because to make way for possible future asynchronous
    // implementations of this method.
    return Future.value(value);
  }

  @override
  Future<void> saveData<T>({required String key, required T value}) async {
    // [ Step 1 ]: Save the corresponding value (by data type) to the local storage.
    //
    // Using the 'is' keyword is more preferable than the 'runtimeType' property
    // of a variable in determining the type of the said variable. This is because
    // the 'is' keyword works with subclasses while the 'runtimeType' property
    // does not (ref: https://stackoverflow.com/questions/51284575/flutter-evaluate-if-var-is-integer-or-string).
    try {
      if (T is int) {
        await _sharedPreferences.setInt(key, value as int);
      } else if (T is double) {
        await _sharedPreferences.setDouble(key, value as double);
      } else if (T is String) {
        await _sharedPreferences.setString(key, value as String);
      } else if (T is bool) {
        await _sharedPreferences.setBool(key, value as bool);
      } else if (T is List<String>) {
        await _sharedPreferences.setStringList(key, value as List<String>);
      } else {
        throw LocalStorageException(
          title: 'Local Storage',
          message:
              'LocalStorageDataSource.getData: Unsupported type: ${T.runtimeType}',
          stackTrace: StackTrace.current,
        );
      }
    } catch (e, stackTrace) {
      throw LocalStorageException(
        title: 'Local Storage',
        message: 'LocalStorageDataSource.saveData: $e'
            '\n[$stackTrace]',
        stackTrace: stackTrace,
      );
    }
  }
}
