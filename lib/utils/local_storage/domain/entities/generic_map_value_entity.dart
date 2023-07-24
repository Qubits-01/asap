import '../../../../interfaces/entity_intf.dart';

class GenericMapValueEntity extends EntityIntf {
  const GenericMapValueEntity({
    required Map<String, dynamic> value,
  }) : _value = value;

  final Map<String, dynamic> _value;

  // Getters.
  Map<String, dynamic> get value => _value;

  // [Equatable] package setup requirements.
  @override
  List<Object?> get props => [value];
}
