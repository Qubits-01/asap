import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/sign_up_screen_step_state.dart';
import '../../sign_up_summary_screen.dart';

class OnStepContinue {
  const OnStepContinue();

  // TODO: Re-examine the dependency injection for static members of a class
  // (e.g. GoRouter.of, static methods, etc.). Determine if dependency injection
  // can be used for it.

  void call({
    required BuildContext buildContext,
    required List<int> stepperIndex,
    required List<GlobalKey<FormState>> formKeys,
    required List<SignUpScreenStepState> stepStates,
    required void Function() setState,
  }) {
    late final bool isCurrentFormValid;
    late final bool isCompleteOrErrorStepState;
    late final StepState currentStepState;
    late int thisStepperIndex;
    late final bool areAllFormsValid;

    // TODO: Add [ Step x.x.x... ] comments on the algorithm throughout the app's code.
    // This is to enhance readability and maintainability.

    // For code readability purposes.
    thisStepperIndex = stepperIndex[0];

    // Validate the corresponding form first.
    isCurrentFormValid =
        formKeys[thisStepperIndex].currentState?.validate() as bool;

    // Update the current step's state and its isActive status.
    stepStates[thisStepperIndex] = stepStates[thisStepperIndex].copyWith(
      stepState: isCurrentFormValid ? StepState.complete : StepState.error,

      // Special case (User is in the last corresponding logical step).
      isActive: thisStepperIndex == 2 ? true : false,
    );

    // Special case (User is in the last corresponding logical step).
    if (thisStepperIndex == 2) {
      // Determine if all forms are valid.
      areAllFormsValid = formKeys.every(
        (formKey) => formKey.currentState?.validate() as bool,
      );

      if (areAllFormsValid) {
        // Save all of the form data locally.
        for (final GlobalKey<FormState> formKey in formKeys) {
          formKey.currentState?.save();
        }

        // Navigate to the Sign Up Summary Screen.
        GoRouter.of(buildContext).push(SignUpSummaryScreen.routeName);
      }
    } else {
      // Update the stepper index.
      thisStepperIndex += 1;

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
