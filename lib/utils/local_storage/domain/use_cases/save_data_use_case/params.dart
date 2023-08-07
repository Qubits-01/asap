import '../../../../../interfaces/params_intf.dart';

class Params implements ParamsIntf {
  const Params({
    required String key,
    required String value,
  })  : _key = key,
        _value = value;

  final String _key;
  final String _value;

  // Getters.
  String get key => _key;
  String get value => _value;

  // [Equatable] package setup requirements.
  @override
  List<Object> get props => [key, value];

  @override
  bool? get stringify => false;
}
