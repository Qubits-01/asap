import '../../../../../interfaces/params_intf.dart';

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
