import 'package:flutter/material.dart';

import '../../helpers/sign_up_screen_step_state.dart';

class OnStepTapped {
  const OnStepTapped();

  void call({
    required List<int> stepperIndex,
    required int newIndex,
    required List<GlobalKey<FormState>> formKeys,
    required List<SignUpScreenStepState> stepStates,
    required void Function() setState,
  }) {
    late final bool isCurrentFormValid;
    late final bool isCompleteOrErrorStepState;
    late final StepState currentStepState;
    late int thisStepperIndex;

    // For code readability purposes.
    thisStepperIndex = stepperIndex[0];

    // Validate the current form (step) first.
    isCurrentFormValid =
        formKeys[thisStepperIndex].currentState?.validate() as bool;

    // Update the current step's state and its isActive status.
    stepStates[thisStepperIndex] = stepStates[stepperIndex[0]].copyWith(
      stepState: isCurrentFormValid ? StepState.complete : StepState.error,
      isActive: false,
    );

    // Update the stepperIndex to the tapped index.
    thisStepperIndex = newIndex;

    // Update the tapped (destination) step's state into an editing state.
    // Do not update if the tapped step is already complete or has an error.
    currentStepState = stepStates[thisStepperIndex].stepState;
    isCompleteOrErrorStepState = (currentStepState == StepState.complete) ||
        (currentStepState == StepState.error);

    stepStates[thisStepperIndex] = stepStates[thisStepperIndex].copyWith(
      stepState:
          isCompleteOrErrorStepState ? currentStepState : StepState.editing,
      isActive: true,
    );

    // Update the stepperIndex on the origin list (so that it will be reflected
    // on the scope of the called of this function).
    stepperIndex[0] = thisStepperIndex;

    // Rebuild.
    setState();
  }
}
