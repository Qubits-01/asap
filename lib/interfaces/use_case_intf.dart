import 'params_intf.dart';

/// [T] is the return type of this use case and [P] is the parameter type.
abstract class UseCaseIntf<T, P extends ParamsIntf> {
  const UseCaseIntf();

  /// Every use case should have a call method (i.e., callable classes).
  /// This is so that this class instance can be called as a function.
  T call(P params);
}

class NoParams implements ParamsIntf {
  const NoParams();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
