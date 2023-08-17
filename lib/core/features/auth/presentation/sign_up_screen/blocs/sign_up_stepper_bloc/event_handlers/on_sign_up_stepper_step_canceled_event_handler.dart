part of '../sign_up_stepper_bloc.dart';

void onSignUpStepperStepCanceledEventHandler({
  required SignUpStepperStepCanceled event,
  required Emitter<SignUpStepperState> emit,
  required SignUpStepperState state,
  required List<GlobalKey<FormState>> formKeys,
}) {
  /// [ Step 1.1. ]
  /// Get a copy of the [SignUpStepperEntity] from the
  /// current state of [SignUpStepperBloc].
  late SignUpStepperEntity signUpStepperEntity;
  signUpStepperEntity = state.signUpStepperEntity.copyWith();

  /// [ Step 1.2. ]
  /// Emit the [SignUpStepperVisualUpdateInProgress] state.
  emit(SignUpStepperVisualUpdateInProgress(
    signUpStepperEntity: signUpStepperEntity,
  ));

  /// [ Step 2. ]
  /// Declare all the needed variables (and
  /// convenience variables).
  late final bool isCurrentFormValid;
  late final bool isCompleteOrErrorStepState;
  late final int currentIndex;
  late final StepState userInformationStepState;
  late final StepState addressInformationStepState;

  /// [ Step 2.1. ]
  /// Initialize the variables (if applicable).
  currentIndex = signUpStepperEntity.currentIndex;
  userInformationStepState = signUpStepperEntity.userInformationStepState;
  addressInformationStepState = signUpStepperEntity.addressInformationStepState;

  /// [ Step 3. ]
  /// Validate the current form (step).
  isCurrentFormValid = formKeys[currentIndex].currentState?.validate() as bool;

  /// [ Step 3.1. ]
  /// Update the visual UI of the [Stepper] widget.
  switch (currentIndex) {
    /// [ User Information Step ]
    case 0:
      // [ Step 3.1. ]
      /// Update the current step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        userInformationStepState:
            isCurrentFormValid ? StepState.complete : StepState.error,
        // Special case (the user is in the first corresponding logical step).
        isUserInformationStepActive: true,
      );

      break;

    /// [ Address Information Step ]
    case 1:
      // [ Step 3.1. ]
      /// Update the current step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        addressInformationStepState:
            isCurrentFormValid ? StepState.complete : StepState.error,
        isAddressInformationStepActive: false,
      );

      /// [ Step 3.2. ]
      /// Update the destination step's step state and its isActive status.
      /// Do not update if the destination step has already a complete state
      /// or an error state.
      isCompleteOrErrorStepState =
          (userInformationStepState == StepState.complete) ||
              (userInformationStepState == StepState.error);

      signUpStepperEntity = signUpStepperEntity.copyWith(
        userInformationStepState: isCompleteOrErrorStepState
            ? userInformationStepState
            : StepState.editing,
        isSecurityInformationStepActive: true,
      );

      break;

    /// [ Security Information Step ]
    case 2:
      // [ Step 3.1. ]
      /// Update the current step's step state and its isActive status.
      signUpStepperEntity = signUpStepperEntity.copyWith(
        securityInformationStepState:
            isCurrentFormValid ? StepState.complete : StepState.error,
        isSecurityInformationStepActive: false,
      );

      /// [ Step 3.2. ]
      /// Update the destination step's step state and its isActive status.
      /// Do not update if the destination step has already a complete state
      /// or an error state.
      isCompleteOrErrorStepState =
          (addressInformationStepState == StepState.complete) ||
              (addressInformationStepState == StepState.error);

      signUpStepperEntity = signUpStepperEntity.copyWith(
        addressInformationStepState: isCompleteOrErrorStepState
            ? addressInformationStepState
            : StepState.editing,
        isAddressInformationStepActive: true,
      );

      break;
  }

  /// [ Step 4. ]
  /// Decrement the current index by one.
  if (currentIndex != 0) {
    signUpStepperEntity = signUpStepperEntity.copyWith(
      currentIndex: currentIndex - 1,
    );
  }

  /// [ Step 5. ]
  /// Emit the [SignUpStepperVisualUpdateSuccess] state.
  emit(SignUpStepperVisualUpdateSuccess(
    signUpStepperEntity: signUpStepperEntity,
  ));

  /// Navigation to the next screen will be handled by the bloc
  /// in charge of saving the user's sign up data. This is to ensure
  /// that the data is saved first locally before navigating to
  /// the next screen.
}
