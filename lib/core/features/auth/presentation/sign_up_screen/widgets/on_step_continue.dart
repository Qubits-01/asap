import 'package:flutter/material.dart';

import '../../../../../../utils/general_dialog_boxes.dart';
import '../sign_up_summary_screen.dart';

void onStepContinue({
  required BuildContext buildContext,
  required int stepperIndex,
  required List<StepState> stepStates,
  required GlobalKey<FormState> userInformationFormKey,
  required GlobalKey<FormState> deliveryAddressFormKey,
  required GlobalKey<FormState> securityInformationFormKey,
  required Function setState,
}) {
  late final bool isCurrentFormValid;
  late bool isCompleteOrErrorStepState;
  late StepState currentStepState;

  switch (stepperIndex) {
    // User Information.
    case 0:
      {
        // Validate the corresponding form first.
        isCurrentFormValid =
            userInformationFormKey.currentState?.validate() as bool;

        if (isCurrentFormValid) {
          // // Save the User Information form data (for later user - sign up submission).
          // _userInformationFormKey.currentState?.save();

          // Update the current stepper state to a complete state.
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.complete,
            isActive: false,
          );
        } else {
          // Update the current stepper state to an error state.
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.error,
            isActive: false,
          );
        }

        // Update the previous active step.
        // Do not update if the previous step is already complete or has an error.
        currentStepState = stepStates[stepperIndex].stepState;
        isCompleteOrErrorStepState = (currentStepState == StepState.complete) ||
            (currentStepState == StepState.error);

        if (!isCompleteOrErrorStepState) {
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.indexed,
            isActive: false,
          );
        }

        // Update the current active stepper index.
        stepperIndex += 1;

        // Update the current active step.
        // Do not update if the previous step is already complete or has an error.
        currentStepState = stepStates[stepperIndex].stepState;
        isCompleteOrErrorStepState = (currentStepState == StepState.complete) ||
            (currentStepState == StepState.error);

        if (!isCompleteOrErrorStepState) {
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.editing,
            isActive: true,
          );
        }

        break;
      }

    // Delivery Address.
    case 1:
      {
        // Validate the corresponding form first.
        isCurrentFormValid =
            deliveryAddressFormKey.currentState?.validate() as bool;

        if (isCurrentFormValid) {
          // Update the current stepper state to a complete state.
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.complete,
            isActive: false,
          );
        } else {
          // Update the current stepper state to an error state.
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.error,
            isActive: false,
          );
        }

        // Update the previous active step.
        // Do not update if the previous step is already complete or has an error.
        currentStepState = stepStates[stepperIndex].stepState;
        isCompleteOrErrorStepState = (currentStepState == StepState.complete) ||
            (currentStepState == StepState.error);

        if (!isCompleteOrErrorStepState) {
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.indexed,
            isActive: false,
          );
        }

        // Update the current active stepper index.
        stepperIndex += 1;

        // Update the current active step.
        // Do not update if the previous step is already complete or has an error.
        currentStepState = stepStates[stepperIndex].stepState;
        isCompleteOrErrorStepState = (currentStepState == StepState.complete) ||
            (currentStepState == StepState.error);

        if (!isCompleteOrErrorStepState) {
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.editing,
            isActive: true,
          );
        }

        break;
      }

    // Security Information.
    case 2:
      {
        // Validate the corresponding form first.
        isCurrentFormValid =
            securityInformationFormKey.currentState?.validate() as bool;

        if (isCurrentFormValid) {
          // Update the current stepper state to a complete state.
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.complete,
            isActive: false,
          );

          // Show loading indicator.
          GeneralDialogBoxes.showLoadingSpinningCircle(
            buildContext: buildContext,
          );

          // Simulate a 2-second delay.
          Future.delayed(const Duration(seconds: 2), () {
            // Remove the loading indicator.
            Navigator.of(buildContext).pop();

            // Navigate to the Sign Up Summary Screen.
            GoRouter.of(buildContext).push(SignUpSummaryScreen.routeName);
          });
        } else {
          // Update the current stepper state to an error state.
          stepStates[stepperIndex] = stepStates[stepperIndex].copyWith(
            stepState: StepState.error,
            isActive: false,
          );
        }

        break;
      }

    // This will never be reached. Just in case that there will be
    // an unwanted bit flips due to cosmic rays or any other rare phenomenons.
    default:
      {
        // TODO: Implement a fatal error dialog (to inform the user).
        break;
      }
  }

  // Rebuild.
  setState(() {});
}
