part of '../sign_up_stepper_bloc.dart';

/// TODO: Implement an exception handler in order to use the [SignUpStepperVisualUpdateFailure] state.
void onSignUpStepperStepTappedEventHandler({
  required SignUpStepperStepTapped event,
  required Emitter<SignUpStepperState> emit,
  required SignUpStepperState state,
  required List<GlobalKey<FormState>> formKeys,
}) {
  /// [ Step 1. ]
  /// Emit the [SignUpStepperVisualUpdateInProgress] state.
  emit(const SignUpStepperVisualUpdateInProgress());

  late final int newIndex;

  /// [ Convenience variables (for readability). ]
  late SignUpStepperEntity signUpStepperEntity;
  late final bool isCurrentFormValid;
  late final bool isCompleteOrErrorStepState;
  late final int currentIndex;
  late StepState userInformationStepState;
  late StepState addressInformationStepState;
  late StepState securityInformationStepState;

  /// [ Step 2. ]
  /// Initialize the convenience variables (and other variables) if needed be,
  /// using the values of the [SignUpStepperWidgetState] event property.
  /// Do take note that these said convenience variables' values might
  /// change later on.
  newIndex = event.newIndex;
  signUpStepperEntity = state.signUpStepperEntity as SignUpStepperEntity;
  currentIndex = signUpStepperEntity.currentIndex;
  userInformationStepState = signUpStepperEntity.userInformationStepState;
  addressInformationStepState = signUpStepperEntity.addressInformationStepState;
  securityInformationStepState =
      signUpStepperEntity.securityInformationStepState;

  /// [ Step 3. ]
  /// Validate the current form (step).
  isCurrentFormValid = formKeys[currentIndex].currentState?.validate() as bool;

  /// [ Step 4. ]
  /// Update the current step's state and its isActive status.
  switch (currentIndex) {
    /// [ User Information Step ]
    case 0:
      // [ Step 4.1. ]
      /// Update the current step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        userInformationStepState:
            isCurrentFormValid ? StepState.complete : StepState.error,
        isUserInformationStepActive: false,
      );

      break;

    /// [ Address Information Step ]
    case 1:
      // [ Step 4.1. ]
      /// Update the current step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        addressInformationStepState:
            isCurrentFormValid ? StepState.complete : StepState.error,
        isAddressInformationStepActive: false,
      );

      break;

    /// [ Security Information Step ]
    case 2:
      // [ Step 4.1. ]
      /// Update the current step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        securityInformationStepState:
            isCurrentFormValid ? StepState.complete : StepState.error,
        isSecurityInformationStepActive: false,
      );

      break;
  }

  /// [ Step 5. ]
  /// Update the tapped (destination; newIndex) step's state into an editing state.
  /// Do not update if the tapped step is already complete or has an error.
  switch (newIndex) {
    /// [ User Information Step ]
    case 0:
      // [ Step 5.1. ]
      /// Determine if the tapped step is already complete or has an error.
      isCompleteOrErrorStepState =
          (userInformationStepState == StepState.complete) ||
              (userInformationStepState == StepState.error);

      /// [ Step 5.2. ]
      /// Update the destination step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        userInformationStepState: isCompleteOrErrorStepState
            ? userInformationStepState
            : StepState.editing,
        isUserInformationStepActive: true,
      );

      break;

    /// [ Address Information Step ]
    case 1:
      // [ Step 5.1. ]
      /// Determine if the tapped step is already complete or has an error.
      isCompleteOrErrorStepState =
          (addressInformationStepState == StepState.complete) ||
              (addressInformationStepState == StepState.error);

      /// [ Step 5.2. ]
      /// Update the destination step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        addressInformationStepState: isCompleteOrErrorStepState
            ? addressInformationStepState
            : StepState.editing,
        isAddressInformationStepActive: true,
      );

      break;

    /// [ Security Information Step ]
    case 2:
      // [ Step 5.1. ]
      /// Determine if the tapped step is already complete or has an error.
      isCompleteOrErrorStepState =
          (securityInformationStepState == StepState.complete) ||
              (securityInformationStepState == StepState.error);

      /// [ Step 5.2. ]
      /// Update the destination step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        securityInformationStepState: isCompleteOrErrorStepState
            ? securityInformationStepState
            : StepState.editing,
        isSecurityInformationStepActive: true,
      );

      break;
  }

  /// [ Step 6. ]
  /// Update the current index of the [Stepper] widget.
  signUpStepperEntity = signUpStepperEntity.copyWith(
    currentIndex: newIndex,
  );

  /// [ Step 7. ]
  /// Emit the updated [SignUpStepperEntity] object.
  emit(SignUpStepperVisualUpdateSuccess(
    signUpStepperEntity: signUpStepperEntity,
  ));
}
