abstract class LocalStorageInterface {
  const LocalStorageInterface();

  /// Data is saved as a key-value pair.
  ///
  /// Inspired by the package Hive.
  /// (Ref: https://pub.dev/packages/hive)
  Future<void> saveData<T>({required String key, required T value});

  /// Data is retrieved using the key.
  Future<T> getData<T>({required String key});
}
