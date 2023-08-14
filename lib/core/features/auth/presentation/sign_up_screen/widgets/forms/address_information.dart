import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../constants/entities/up_residence_hall_entities.dart';
import '../../../../../../../constants/local_storage_cache_keys.dart';
import '../../../../domain/entities/up_residence_hall_entity.dart';
import '../../blocs/sign_up_form_data_bloc/sign_up_form_data_bloc.dart';
import '../../helpers/delivery_address_text_field_state.dart';
import '../../helpers/form_validators/preset_address_validator.dart';

import '../dropdown_button_callbacks/dropdown_button_on_changed.dart';

class AddressInformation extends StatefulWidget {
  const AddressInformation({
    super.key,
    required GlobalKey<FormState> addressInformationFormKey,
    required List<int> stepperIndex,
  })  : _addressInformationFormKey = addressInformationFormKey,
        _stepperIndex = stepperIndex;

  final GlobalKey<FormState> _addressInformationFormKey;
  final List<int> _stepperIndex;

  @override
  State<AddressInformation> createState() => _AddressInformationState();
}

class _AddressInformationState extends State<AddressInformation> {
  // Step 2: Address Information.
  // Address Information controllers.
  late final TextEditingController _provinceTextController;
  late final TextEditingController _cityOrMunicipalityTextController;
  late final TextEditingController _barangayTextController;
  late final TextEditingController _streetAndBuildingNameTextController;

  late Map<String, DeliveryAddressTextFieldState>
      _deliveryAddressTextFieldStates;
  late DropdownButtonOnChanged _dropdownButtonOnChanged;

  @override
  void initState() {
    super.initState();

    // Step 2: Address Information.
    // Address Information controllers.
    _provinceTextController = TextEditingController();
    _cityOrMunicipalityTextController = TextEditingController();
    _barangayTextController = TextEditingController();
    _streetAndBuildingNameTextController = TextEditingController();

    _deliveryAddressTextFieldStates = {
      'province': const DeliveryAddressTextFieldState(),
      'cityOrMunicipality': const DeliveryAddressTextFieldState(),
      'barangay': const DeliveryAddressTextFieldState(),
      'streetAndBuildingName': const DeliveryAddressTextFieldState(),
    };
    _dropdownButtonOnChanged = DropdownButtonOnChanged();
  }

  @override
  void dispose() {
    // Step 2. Address Information controllers.
    _provinceTextController.dispose();
    _cityOrMunicipalityTextController.dispose();
    _barangayTextController.dispose();
    _streetAndBuildingNameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._addressInformationFormKey,
      child: Column(
        children: <Widget>[
          DropdownButtonFormField<UpResidenceHallEntity>(
            // hint: Text('Select a preset address'),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelText: 'Preset Address',
            ),
            onChanged: (
              UpResidenceHallEntity? upResidenceHallEntity,
            ) {
              _dropdownButtonOnChanged(
                stepperIndex: widget._stepperIndex,
                addressInformationFormKey: widget._addressInformationFormKey,
                deliveryAddressTextFieldStates: _deliveryAddressTextFieldStates,
                provinceTextController: _provinceTextController,
                cityOrMunicipalityTextController:
                    _cityOrMunicipalityTextController,
                barangayTextController: _barangayTextController,
                streetAndBuildingNameTextController:
                    _streetAndBuildingNameTextController,
                upResidenceHallEntity: upResidenceHallEntity,
                setState: () => setState(() {}),
              );
            },
            validator: (UpResidenceHallEntity? value) {
              return const PresetAddressValidator()(
                upResidenceHallEntity: value,
              );
            },
            onSaved: (UpResidenceHallEntity? newValue) {
              context.read<SignUpFormDataBloc>().add(
                    SignUpFormDataInputSaved(
                      key: LocalStorageCacheKeys.presetAddressTag,
                      value: newValue?.tagName as String,
                    ),
                  );
            },
            items: const <DropdownMenuItem<UpResidenceHallEntity>>[
              DropdownMenuItem(
                value: UpResidenceHallEntities.ipilRH,
                child: Text('Ipil RH'),
              ),
              DropdownMenuItem(
                value: UpResidenceHallEntities.yakalRH,
                child: Text('Yakal RH'),
              ),
              DropdownMenuItem(
                value: UpResidenceHallEntities.kalayaanRH,
                child: Text('Kalayaan RH'),
              ),
              DropdownMenuItem(
                value: UpResidenceHallEntities.acaciaRH,
                child: Text('Acacia RH'),
              ),
              DropdownMenuItem(
                value: UpResidenceHallEntities.otherUpRH,
                child: Text('Other Address'),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Horizontal divider.
          const Divider(),
          const SizedBox(height: 8.0),

          // TODO: Implement address dropdown selection.

          // Philippine province.
          TextFormField(
            controller: _provinceTextController,
            readOnly:
                _deliveryAddressTextFieldStates['province']?.isReadOnly as bool,
            enabled:
                _deliveryAddressTextFieldStates['province']?.isEnabled as bool,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelText: 'Province',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value for Province.';
              }

              return null;
            },
            onSaved: (String? newValue) {
              context.read<SignUpFormDataBloc>().add(
                    SignUpFormDataInputSaved(
                      key: LocalStorageCacheKeys.province,
                      value: newValue as String,
                    ),
                  );
            },
          ),
          const SizedBox(height: 16.0),

          // Philippine city/municipality.
          TextFormField(
            controller: _cityOrMunicipalityTextController,
            readOnly: _deliveryAddressTextFieldStates['cityOrMunicipality']
                ?.isReadOnly as bool,
            enabled: _deliveryAddressTextFieldStates['cityOrMunicipality']
                ?.isEnabled as bool,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelText: 'City or Municipality',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value for City or Municipality.';
              }

              return null;
            },
            onSaved: (String? newValue) {
              context.read<SignUpFormDataBloc>().add(
                    SignUpFormDataInputSaved(
                      key: LocalStorageCacheKeys.cityOrMunicipality,
                      value: newValue as String,
                    ),
                  );
            },
          ),
          const SizedBox(height: 16.0),

          // Philippine barangay.
          TextFormField(
            controller: _barangayTextController,
            readOnly:
                _deliveryAddressTextFieldStates['barangay']?.isReadOnly as bool,
            enabled:
                _deliveryAddressTextFieldStates['barangay']?.isEnabled as bool,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelText: 'Barangay',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value for Barangay.';
              }

              return null;
            },
            onSaved: (String? newValue) {
              context.read<SignUpFormDataBloc>().add(
                    SignUpFormDataInputSaved(
                      key: LocalStorageCacheKeys.barangay,
                      value: newValue as String,
                    ),
                  );
            },
          ),
          const SizedBox(height: 16.0),

          // Philippine street and building name.
          TextFormField(
            controller: _streetAndBuildingNameTextController,
            readOnly: _deliveryAddressTextFieldStates['streetAndBuildingName']
                ?.isReadOnly as bool,
            enabled: _deliveryAddressTextFieldStates['streetAndBuildingName']
                ?.isEnabled as bool,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelText: 'Street and Building Name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value for Street and Building Name.';
              }

              return null;
            },
            onSaved: (String? newValue) {
              context.read<SignUpFormDataBloc>().add(
                    SignUpFormDataInputSaved(
                      key: LocalStorageCacheKeys.streetAndBuildingName,
                      value: newValue as String,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
