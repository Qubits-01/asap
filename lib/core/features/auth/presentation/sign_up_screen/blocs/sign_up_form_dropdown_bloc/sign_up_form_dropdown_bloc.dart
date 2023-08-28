import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../entities/failure_entity.dart';
import '../../../../domain/entities/address_information_text_field_status_entity.dart';
import '../../../../domain/entities/sign_up_form_entity/address_information_entity.dart';

part 'event_handlers/on_sign_up_form_dropdown_on_changed_event.dart';
part 'sign_up_form_dropdown_event.dart';
part 'sign_up_form_dropdown_state.dart';

class SignUpFormDropdownBloc
    extends Bloc<SignUpFormDropdownEvent, SignUpFormDropdownState> {
  SignUpFormDropdownBloc({
    required final GlobalKey<FormState> addressInformationFormKey,
    required final TextEditingController provinceTextController,
    required final TextEditingController cityOrMunicipalityTextController,
    required final TextEditingController barangayTextController,
    required final TextEditingController streetAndBuildingNameTextController,
  })  : _addressInformationFormKey = addressInformationFormKey,
        _provinceTextController = provinceTextController,
        _cityOrMunicipalityTextController = cityOrMunicipalityTextController,
        _barangayTextController = barangayTextController,
        _streetAndBuildingNameTextController =
            streetAndBuildingNameTextController,
        super(const SignUpFormDropdownInitial()) {
    _registerEventHandlers();
  }

  final GlobalKey<FormState> _addressInformationFormKey;
  final TextEditingController _provinceTextController,
      _cityOrMunicipalityTextController,
      _barangayTextController,
      _streetAndBuildingNameTextController;

  /// Getters.
  GlobalKey<FormState> get addressInformationFormKey =>
      _addressInformationFormKey;
  TextEditingController get provinceTextController => _provinceTextController;
  TextEditingController get cityOrMunicipalityTextController =>
      _cityOrMunicipalityTextController;
  TextEditingController get barangayTextController => _barangayTextController;
  TextEditingController get streetAndBuildingNameTextController =>
      _streetAndBuildingNameTextController;

  void _registerEventHandlers() {
    on<SignUpFormDropdownStarted>((event, emit) {});

    on<SignUpFormDropdownOnChanged>((event, emit) async {
      late final AddressInformationEntity addressInformationEntity;
      late AddressInformationTextFieldStatusEntity
          addressInformationTextFieldStatusEntity;
      late final bool isFormValid;

      /// [ Step 1. ]
      /// Initialize the variables.
      addressInformationEntity = event.addressInformationEntity?.copyWith() ??
          state.addressInformationEntity.copyWith();
      addressInformationTextFieldStatusEntity =
          state.addressInformationTextFieldStatusEntity.copyWith();

      /// [ Step 2. ]
      /// At the first instance that the user selected a [DropdownMenuItem],
      /// enable all the corresponding text fields.
      addressInformationTextFieldStatusEntity =
          addressInformationTextFieldStatusEntity.copyWith(
        isProvinceTextFieldEnabled: true,
        isCityOrMunicipalityTextFieldEnabled: true,
        isBarangayTextFieldEnabled: true,
        isStreetAndBuildingNameTextFieldEnabled: true,
      );

      if (addressInformationEntity.tagName == '[ Other UP RH ]') {
        /// [ Step 3.1.1. ]
        /// Update the corresponding address fields. For now,
        /// only set the Street and Building Name field to an empty string.
        _provinceTextController.text = addressInformationEntity.province;
        _cityOrMunicipalityTextController.text =
            addressInformationEntity.cityOrMunicipality;
        _barangayTextController.text = addressInformationEntity.barangay;
        _streetAndBuildingNameTextController.text = '';

        /// [ Step 3.1.2. ]
        /// Set the corresponding address fields to not read-only mode.
        /// So that the user can input their own address.
        addressInformationTextFieldStatusEntity =
            addressInformationTextFieldStatusEntity.copyWith(
          isProvinceTextFieldReadOnly: false,
          isCityOrMunicipalityTextFieldReadOnly: false,
          isBarangayTextFieldReadOnly: false,
          isStreetAndBuildingNameTextFieldReadOnly: false,
        );
      } else {
        /// [ Step 3.2.1. ]
        /// Update the corresponding address fields.
        _provinceTextController.text = addressInformationEntity.province;
        _cityOrMunicipalityTextController.text =
            addressInformationEntity.cityOrMunicipality;
        _barangayTextController.text = addressInformationEntity.barangay;
        _streetAndBuildingNameTextController.text =
            addressInformationEntity.streetAndBuildingName;

        /// [ Step 3.2.2. ]
        /// Set the corresponding address fields to read-only mode.
        addressInformationTextFieldStatusEntity =
            addressInformationTextFieldStatusEntity.copyWith(
          isProvinceTextFieldReadOnly: true,
          isCityOrMunicipalityTextFieldReadOnly: true,
          isBarangayTextFieldReadOnly: true,
          isStreetAndBuildingNameTextFieldReadOnly: true,
        );
      }

      /// [ Step 4. ]
      /// Validate the form to remove the error message/s and error-themed visual alerts.
      isFormValid =
          _addressInformationFormKey.currentState?.validate() ?? false;

      /// [ Step 5. ]
      /// Emit the new state including wether the form is valid or not.
      emit(
        SignUpFormDropdownVisualUpdateSuccess(
          addressInformationEntity: addressInformationEntity,
          addressInformationTextFieldStatusEntity:
              addressInformationTextFieldStatusEntity,
          isFormValid: isFormValid,
        ),
      );
    });
  }
}
