// TODO: In the future, consider using a library like Hive to store data locally
// (ref: https://pub.dev/packages/hive). This is because in Hive, it is possible
// to store maps and object models. This would make the code more readable and
// easier to maintain.

abstract class LocalStorageDataSourceIntf {
  Future<void> saveData<T>({required String key, required T value});

  Future<T> getData<T>({required String key});
}
