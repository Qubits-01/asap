import 'package:flutter/material.dart';

import '../../../../../interfaces/entity_intf.dart';

final class StepperEntity implements EntityIntf {
  const StepperEntity({
    required int currentIndex,
    required StepState userInformationStepState,
    required bool isUserInformationStepActive,
    required StepState addressInformationStepState,
    required bool isAddressInformationStepActive,
    required StepState securityInformationStepState,
    required bool isSecurityInformationStepActive,
  })  : _currentIndex = currentIndex,
        _userInformationStepState = userInformationStepState,
        _isUserInformationStepActive = isUserInformationStepActive,
        _addressInformationStepState = addressInformationStepState,
        _isAddressInformationStepActive = isAddressInformationStepActive,
        _securityInformationStepState = securityInformationStepState,
        _isSecurityInformationStepActive = isSecurityInformationStepActive;

  final int _currentIndex;

  // User Information step.
  final StepState _userInformationStepState;
  final bool _isUserInformationStepActive;

  // Address Information step.
  final StepState _addressInformationStepState;
  final bool _isAddressInformationStepActive;

  // Security Information step.
  final StepState _securityInformationStepState;
  final bool _isSecurityInformationStepActive;

  // Getters.
  int get currentIndex => _currentIndex;
  StepState get userInformationStepState => _userInformationStepState;
  bool get isUserInformationStepActive => _isUserInformationStepActive;
  StepState get addressInformationStepState => _addressInformationStepState;
  bool get isAddressInformationStepActive => _isAddressInformationStepActive;
  StepState get securityInformationStepState => _securityInformationStepState;
  bool get isSecurityInformationStepActive => _isSecurityInformationStepActive;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [
        currentIndex,
        userInformationStepState,
        isUserInformationStepActive,
        addressInformationStepState,
        isAddressInformationStepActive,
        securityInformationStepState,
        isSecurityInformationStepActive,
      ];

  @override
  bool? get stringify => false;
}
