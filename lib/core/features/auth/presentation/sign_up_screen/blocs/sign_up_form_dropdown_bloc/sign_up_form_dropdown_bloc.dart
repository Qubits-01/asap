import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../entities/failure_entity.dart';
import '../../../../domain/entities/address_information_text_field_status_entity.dart';
import '../../../../domain/entities/sign_up_form_entity/address_information_entity.dart';

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
        super(SignUpFormDropdownInitial()) {
    _registerEventHandlers();
  }

  final GlobalKey<FormState> _addressInformationFormKey;
  final TextEditingController _provinceTextController,
      _cityOrMunicipalityTextController,
      _barangayTextController,
      _streetAndBuildingNameTextController;

  void _registerEventHandlers() {
    on<SignUpFormDropdownStarted>((event, emit) {});

    on<SignUpFormDropdownOnChanged>((event, emit) {});
  }
}
