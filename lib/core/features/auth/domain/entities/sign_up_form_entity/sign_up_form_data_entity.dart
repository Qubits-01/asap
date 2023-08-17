import 'security_information_entity.dart';
import 'user_information_entity.dart';

import '../../../../../../interfaces/entity_intf.dart';
import 'address_information_entity.dart';

class SignUpFormDataEntity implements EntityIntf {
  const SignUpFormDataEntity({
    required final UserInformationEntity userInformationEntity,
    required final AddressInformationEntity addressInformationEntity,
    required final SecurityInformationEntity securityInformationEntity,
  })  : _userInformationEntity = userInformationEntity,
        _addressInformationEntity = addressInformationEntity,
        _securityInformationEntity = securityInformationEntity;

  final UserInformationEntity _userInformationEntity;
  final AddressInformationEntity _addressInformationEntity;
  final SecurityInformationEntity _securityInformationEntity;

  /// Getters.
  UserInformationEntity get userInformationEntity => _userInformationEntity;
  AddressInformationEntity get addressInformationEntity =>
      _addressInformationEntity;
  SecurityInformationEntity get securityInformationEntity =>
      _securityInformationEntity;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [
        userInformationEntity,
        addressInformationEntity,
        securityInformationEntity,
      ];

  @override
  bool? get stringify => false;
}
