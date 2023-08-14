import 'package:flutter/material.dart';

import '../../../../../interfaces/entity_intf.dart';

final class SignUpStepperEntity implements EntityIntf {
  const SignUpStepperEntity({
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

  /// User Information step.
  final StepState _userInformationStepState;
  final bool _isUserInformationStepActive;

  /// Address Information step.
  final StepState _addressInformationStepState;
  final bool _isAddressInformationStepActive;

  /// Security Information step.
  final StepState _securityInformationStepState;
  final bool _isSecurityInformationStepActive;

  /// Getters.
  int get currentIndex => _currentIndex;
  StepState get userInformationStepState => _userInformationStepState;
  bool get isUserInformationStepActive => _isUserInformationStepActive;
  StepState get addressInformationStepState => _addressInformationStepState;
  bool get isAddressInformationStepActive => _isAddressInformationStepActive;
  StepState get securityInformationStepState => _securityInformationStepState;
  bool get isSecurityInformationStepActive => _isSecurityInformationStepActive;

  /// Copy with.
  SignUpStepperEntity copyWith({
    int? currentIndex,
    StepState? userInformationStepState,
    bool? isUserInformationStepActive,
    StepState? addressInformationStepState,
    bool? isAddressInformationStepActive,
    StepState? securityInformationStepState,
    bool? isSecurityInformationStepActive,
  }) {
    return SignUpStepperEntity(
      currentIndex: currentIndex ?? this.currentIndex,
      userInformationStepState:
          userInformationStepState ?? this.userInformationStepState,
      isUserInformationStepActive:
          isUserInformationStepActive ?? this.isUserInformationStepActive,
      addressInformationStepState:
          addressInformationStepState ?? this.addressInformationStepState,
      isAddressInformationStepActive:
          isAddressInformationStepActive ?? this.isAddressInformationStepActive,
      securityInformationStepState:
          securityInformationStepState ?? this.securityInformationStepState,
      isSecurityInformationStepActive: isSecurityInformationStepActive ??
          this.isSecurityInformationStepActive,
    );
  }

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
