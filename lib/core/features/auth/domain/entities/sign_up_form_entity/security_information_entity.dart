import '../../../../../../interfaces/entity_intf.dart';

class SecurityInformationEntity implements EntityIntf {
  const SecurityInformationEntity({
    required final String emailAddress,
    required final String phoneNumber,
    required final String password,
  })  : _emailAddress = emailAddress,
        _phoneNumber = phoneNumber,
        _password = password;

  final String _emailAddress, _phoneNumber, _password;

  /// Getters.
  String get emailAddress => _emailAddress;
  String get phoneNumber => _phoneNumber;
  String get password => _password;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [
        emailAddress,
        phoneNumber,
        password,
      ];

  @override
  bool? get stringify => false;
}
