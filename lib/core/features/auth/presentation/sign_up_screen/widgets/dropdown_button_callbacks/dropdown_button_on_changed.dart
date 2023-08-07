import 'package:flutter/material.dart';

import '../../../../domain/entities/up_residence_hall_entity.dart';
import '../../helpers/delivery_address_text_field_state.dart';

class DropdownButtonOnChanged {
  DropdownButtonOnChanged();

  void call({
    required Map<String, DeliveryAddressTextFieldState>
        deliveryAddressTextFieldStates,
    required TextEditingController provinceTextController,
    required TextEditingController cityOrMunicipalityTextController,
    required TextEditingController barangayTextController,
    required TextEditingController streetAndBuildingNameTextController,
    required UpResidenceHallEntity? upResidenceHallEntity,
    required void Function() setState,
  }) {
    // Typecast the [upResidenceHallEntity] variable to a non-nullable type since
    // it will never be null due to the implementation of the [DropdownMenuItem]
    // value properties (i.e., they are non-nullable by design).
    upResidenceHallEntity as UpResidenceHallEntity;

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

    if (upResidenceHallEntity.tagName == '[ Other UP RH ]') {
      // Update the corresponding address fields. For now,
      // only set the Street and Building Name field to an empty string.
      provinceTextController.text = upResidenceHallEntity.province;
      cityOrMunicipalityTextController.text =
          upResidenceHallEntity.cityOrMunicipality;
      barangayTextController.text = upResidenceHallEntity.barangay;
      streetAndBuildingNameTextController.text = '';

      // Set the corresponding address fields to not read-only mode.
      // So that the user can input their own address.
      deliveryAddressTextFieldStates.forEach((
        String key,
        DeliveryAddressTextFieldState value,
      ) {
        deliveryAddressTextFieldStates[key] = value.copyWith(isReadOnly: false);
      });
    } else {
      // Update the corresponding address fields.
      provinceTextController.text = upResidenceHallEntity.province;
      cityOrMunicipalityTextController.text =
          upResidenceHallEntity.cityOrMunicipality;
      barangayTextController.text = upResidenceHallEntity.barangay;
      streetAndBuildingNameTextController.text =
          upResidenceHallEntity.streetAndBuildingName;

      // Set the corresponding address fields to read-only mode.
      deliveryAddressTextFieldStates.forEach((
        String key,
        DeliveryAddressTextFieldState value,
      ) {
        deliveryAddressTextFieldStates[key] = value.copyWith(isReadOnly: true);
      });
    }

    // Rebuild.
    setState();
  }
}
