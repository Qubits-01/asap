import 'package:flutter/material.dart';

/// This class is immutable by design (for code maintenance
/// and clarity). That is, in order to change the state of this class, the
/// programmer needs to create a new instance of this class.
/// Hence, the copyWith method.
class SignUpScreenStepState {
  const SignUpScreenStepState({
    stepState = StepState.indexed,
    isActive = false,
  })  : _stepState = stepState,
        _isActive = isActive;

  final StepState _stepState;
  final bool _isActive;

  // Getters.
  StepState get stepState => _stepState;
  bool get isActive => _isActive;

  SignUpScreenStepState copyWith({
    StepState? stepState,
    bool? isActive,
  }) {
    return SignUpScreenStepState(
      stepState: stepState ?? _stepState,
      isActive: isActive ?? _isActive,
    );
  }
}
