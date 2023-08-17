import 'package:flutter/material.dart';

import '../../../../domain/entities/sign_up_form_entity/address_information_entity.dart';
import '../../helpers/delivery_address_text_field_state.dart';

class DropdownButtonOnChanged {
  DropdownButtonOnChanged();

  void call({
    required List<int> stepperIndex,
    required GlobalKey<FormState> addressInformationFormKey,
    required Map<String, DeliveryAddressTextFieldState>
        deliveryAddressTextFieldStates,
    required TextEditingController provinceTextController,
    required TextEditingController cityOrMunicipalityTextController,
    required TextEditingController barangayTextController,
    required TextEditingController streetAndBuildingNameTextController,
    required AddressInformationEntity? upResidenceHallEntity,
    required void Function() setState,
  }) {
    late bool? isFormValid;

    // The [thisStepperIndex] is a required parameter instead of just using
    // [thisStepperIndex = 1] (simple way). The simple way was not used because the number
    // of sections in the [Stepper] widget might change in the future (i.e., the corresponding
    // stepper index for this section will not be equal to 1 anymore).

    late final int thisStepperIndex;

    // [ Step 1.1. ]
    // Typecast the [upResidenceHallEntity] variable to a non-nullable type since
    // it will never be null due to the implementation of the [DropdownMenuItem]
    // value properties (i.e., they are non-nullable by design).
    upResidenceHallEntity as AddressInformationEntity;

    // [ Step 1.2. ]
    // At the first instance that the user selected a [DropdownMenuItem],
    // enable all the corresponding text fields.
    //
    // Note: There is no need to call for setState() here since it will be called
    // later on in this method either way.
    deliveryAddressTextFieldStates.forEach((
      String key,
      DeliveryAddressTextFieldState value,
    ) {
      deliveryAddressTextFieldStates[key] = value.copyWith(isEnabled: true);
    });

    // [ Step 2.1. ]
    if (upResidenceHallEntity.tagName == '[ Other UP RH ]') {
      // Update the corresponding address fields. For now,
      // only set the Street and Building Name field to an empty string.
      provinceTextController.text = upResidenceHallEntity.province;
      cityOrMunicipalityTextController.text =
          upResidenceHallEntity.cityOrMunicipality;
      barangayTextController.text = upResidenceHallEntity.barangay;
      streetAndBuildingNameTextController.text = '';

      // [ Step 3.1. ]
      // Set the corresponding address fields to not read-only mode.
      // So that the user can input their own address.
      deliveryAddressTextFieldStates.forEach((
        String key,
        DeliveryAddressTextFieldState value,
      ) {
        deliveryAddressTextFieldStates[key] = value.copyWith(isReadOnly: false);
      });

      // [ Step 2.2. ]
    } else {
      // Update the corresponding address fields.
      provinceTextController.text = upResidenceHallEntity.province;
      cityOrMunicipalityTextController.text =
          upResidenceHallEntity.cityOrMunicipality;
      barangayTextController.text = upResidenceHallEntity.barangay;
      streetAndBuildingNameTextController.text =
          upResidenceHallEntity.streetAndBuildingName;

      // [ Step 3.2. ]
      // Set the corresponding address fields to read-only mode.
      deliveryAddressTextFieldStates.forEach((
        String key,
        DeliveryAddressTextFieldState value,
      ) {
        deliveryAddressTextFieldStates[key] = value.copyWith(isReadOnly: true);
      });
    }

    // [ Step 4. ]
    // Validate the form to remove the error message/s and error-themed visual alerts.
    thisStepperIndex = stepperIndex[0];
    isFormValid = addressInformationFormKey.currentState?.validate();

    // TODO: This is not working. Fix this. The visual errors on the corresponding step
    // must update dynamically. One potential reason why this is not working might be because
    // of the limitation of passing a list by reference through function parameters (maybe it
    // only works on 1-call level). In the future, refactor the whole Stepper logic using Bloc.
    // This is to cleanly separate the UI and the logic layers.
    if (isFormValid != null) {
      // stepStates[thisStepperIndex] = stepStates[thisStepperIndex].copyWith(
      //   stepState: isFormValid ? StepState.complete : StepState.error,
      // );
    }

    // [ Step 5.]
    // Rebuild.
    setState();
  }
}
