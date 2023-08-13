import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/stepper_entity.dart';
import '../../helpers/sign_up_stepper_widget_state.dart';

part 'sign_up_stepper_event.dart';
part 'sign_up_stepper_state.dart';

class SignUpStepperBloc extends Bloc<SignUpStepperEvent, SignUpStepperState> {
  SignUpStepperBloc() : super(const SignUpStepperInitial()) {
    _registerEventHandlers();
  }

  void _registerEventHandlers() {
    on<SignUpStepperStarted>((event, emit) {
      /// [ Step 1 ]
      /// Emit the initial state of the [Stepper] widget.
      emit(const SignUpStepperInitial());
    });

    on<SignUpStepperStepContinued>((event, emit) {
      // TODO: implement event handler
    });

    on<SignUpStepperStepCanceled>((event, emit) {
      // TODO: implement event handler
    });

    on<SignUpStepperStepTapped>((event, emit) {
      late final StepperEntity stepperEntity;
      late final int newIndex;

      /// [ Convenience variables (for readability). ]
      late final List<GlobalKey<FormState>> formKeys;
      late final bool isCurrentFormValid;
      late final bool isCompleteOrErrorStepState;
      late final int currentIndex;

      /// User Information step.
      late StepState userInformationStepState;
      late bool isUserInformationStepActive;

      /// Address Information step.
      late StepState addressInformationStepState;
      late bool isAddressInformationStepActive;

      /// Security Information step.
      late StepState securityInformationStepState;
      late bool isSecurityInformationStepActive;

      /// [ Step 1.1. ]
      /// Initialize the convenience variables (and other variables) if needed be,
      /// using the values of the [SignUpStepperWidgetState] event property.
      /// Do take note that these said convenience variables' values might
      /// change later on.
      newIndex = event.newIndex;
      formKeys = event.formKeys;
      currentIndex = event.signUpStepperWidgetState.currentIndex;
      userInformationStepState =
          event.signUpStepperWidgetState.userInformationStepState;
      isUserInformationStepActive =
          event.signUpStepperWidgetState.isUserInformationStepActive;
      addressInformationStepState =
          event.signUpStepperWidgetState.addressInformationStepState;
      isAddressInformationStepActive =
          event.signUpStepperWidgetState.isAddressInformationStepActive;
      securityInformationStepState =
          event.signUpStepperWidgetState.securityInformationStepState;
      isSecurityInformationStepActive =
          event.signUpStepperWidgetState.isSecurityInformationStepActive;

      /// [ Step 2. ]
      /// Validate the current form (step).
      isCurrentFormValid =
          formKeys[currentIndex].currentState?.validate() as bool;

      /// [ Step 3. ]
      /// Update the current step's state and its isActive status.
      switch (currentIndex) {
        /// [ User Information Step ]
        case 0:
          // [ Step 3.1. ]
          /// Update the current step's step state and its isActive status.
          userInformationStepState =
              isCurrentFormValid ? StepState.complete : StepState.error;
          isUserInformationStepActive = false;

          break;

        /// [ Address Information Step ]
        case 1:
          // [ Step 3.1. ]
          /// Update the current step's step state and its isActive status.
          addressInformationStepState =
              isCurrentFormValid ? StepState.complete : StepState.error;
          isAddressInformationStepActive = false;

          break;

        /// [ Security Information Step ]
        case 2:
          // [ Step 3.1. ]
          /// Update the current step's step state and its isActive status.
          securityInformationStepState =
              isCurrentFormValid ? StepState.complete : StepState.error;
          isSecurityInformationStepActive = false;

          break;
      }

      /// [ Step 4. ]
      /// Update the tapped (destination; newIndex) step's state into an editing state.
      /// Do not update if the tapped step is already complete or has an error.
      switch (newIndex) {
        /// [ User Information Step ]
        case 0:
          // [ Step 4.1. ]
          /// Determine if the tapped step is already complete or has an error.
          isCompleteOrErrorStepState =
              (userInformationStepState == StepState.complete) ||
                  (userInformationStepState == StepState.error);

          /// [ Step 4.2. ]
          /// Update the destination step's step state and its isActive status.
          userInformationStepState =
              isCompleteOrErrorStepState ? StepState.complete : StepState.error;
          isUserInformationStepActive = true;

          break;

        /// [ Address Information Step ]
        case 1:
          // [ Step 4.1. ]
          /// Determine if the tapped step is already complete or has an error.
          isCompleteOrErrorStepState =
              (addressInformationStepState == StepState.complete) ||
                  (addressInformationStepState == StepState.error);

          /// [ Step 4.2. ]
          /// Update the destination step's step state and its isActive status.
          addressInformationStepState =
              isCompleteOrErrorStepState ? StepState.complete : StepState.error;
          isAddressInformationStepActive = true;

          break;

        /// [ Security Information Step ]
        case 2:
          // [ Step 4.1. ]
          /// Determine if the tapped step is already complete or has an error.
          isCompleteOrErrorStepState =
              (securityInformationStepState == StepState.complete) ||
                  (securityInformationStepState == StepState.error);

          /// [ Step 4.2. ]
          /// Update the destination step's step state and its isActive status.
          securityInformationStepState =
              isCompleteOrErrorStepState ? StepState.complete : StepState.error;
          isSecurityInformationStepActive = true;

          break;
      }

      /// [ Step 5. ]
      /// Build the [StepperEntity] object with the updated [Stepper] widget state.
      stepperEntity = StepperEntity(
        currentIndex: newIndex,
        userInformationStepState: userInformationStepState,
        isUserInformationStepActive: isUserInformationStepActive,
        addressInformationStepState: addressInformationStepState,
        isAddressInformationStepActive: isAddressInformationStepActive,
        securityInformationStepState: securityInformationStepState,
        isSecurityInformationStepActive: isSecurityInformationStepActive,
      );

      /// [ Step 6. ]
      /// Emit the [StepperEntity] object.
      emit(SignUpStepperVisualUpdateSuccess(stepperEntity: stepperEntity));
    });
  }
}
