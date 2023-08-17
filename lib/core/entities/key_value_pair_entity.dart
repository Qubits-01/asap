import '../../interfaces/entity_intf.dart';

class KeyValuePairEntity<K, V> implements EntityIntf {
  const KeyValuePairEntity({
    required final K key,
    required final V value,
  })  : _key = key,
        _value = value;

  final K _key;
  final V _value;

  /// Getters.
  K get key => _key;
  V get value => _value;

  /// Equality overwrite using the [Equatable] package.
  @override
  List<Object?> get props => [key, value];

  @override
  bool? get stringify => false;
}
