import 'package:flutter/material.dart';

import '../../../../../../../utils/general_dialog_boxes.dart';
import '../../helpers/sign_up_screen_step_state.dart';

class OnStepCancel {
  const OnStepCancel();

  Future<void> call({
    required BuildContext buildContext,
    required List<int> stepperIndex,
    required List<GlobalKey<FormState>> formKeys,
    required List<SignUpScreenStepState> stepStates,
    required void Function() setState,
  }) async {
    late final bool isCurrentFormValid;
    late bool isCompleteOrErrorStepState;
    late StepState currentStepState;
    late final bool willCancelSignUpProcess;
    late int thisStepperIndex;

    // For code readability purposes.
    thisStepperIndex = stepperIndex[0];

    // Validate the corresponding form first.
    isCurrentFormValid =
        formKeys[thisStepperIndex].currentState?.validate() as bool;

    // Update the current step's state and its isActive status.
    stepStates[thisStepperIndex] = stepStates[thisStepperIndex].copyWith(
      stepState: isCurrentFormValid ? StepState.complete : StepState.error,

      // Special case (User is in the last corresponding logical step).
      isActive: thisStepperIndex == 0 ? true : false,
    );

    // Special case (User is in the last corresponding logical step).
    if (thisStepperIndex == 0) {
      // Ask the user if they really want to cancel the sign up process.
      willCancelSignUpProcess = await GeneralDialogBoxes.showYesOrNoAlert(
        buildContext: buildContext,
        title: 'Are You Sure?',
        contentMessage: 'Any progress made will be lost if you go back.',
      );

      // Go back to the login screen if the user wants to cancel the sign up process.
      if (willCancelSignUpProcess) {
        if (buildContext.mounted) Navigator.of(buildContext).pop();
      }
    } else {
      // Update the stepper index.
      thisStepperIndex -= 1;

      // Update the destination step's state and its isActive status.
      // Do not update if the destination step has already  a complete state
      // or an error state.
      currentStepState = stepStates[thisStepperIndex].stepState;
      isCompleteOrErrorStepState = (currentStepState == StepState.complete) ||
          (currentStepState == StepState.error);

      stepStates[thisStepperIndex] = stepStates[thisStepperIndex].copyWith(
        stepState:
            isCompleteOrErrorStepState ? currentStepState : StepState.editing,
        isActive: true,
      );
    }

    // Update the stepperIndex on the origin list (so that it will be reflected
    // on the scope of the called of this function).
    stepperIndex[0] = thisStepperIndex;

    // Rebuild.
    setState();
  }
}
