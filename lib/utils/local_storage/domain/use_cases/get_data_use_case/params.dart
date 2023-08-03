import '../../../../../interfaces/params_intf.dart';

class Params implements ParamsIntf {
  const Params({required String key}) : _key = key;

  final String _key;

  // Getters.
  String get key => _key;

  // [Equatable] package setup requirements.
  @override
  List<Object?> get props => [key];

  @override
  bool? get stringify => false;
}
