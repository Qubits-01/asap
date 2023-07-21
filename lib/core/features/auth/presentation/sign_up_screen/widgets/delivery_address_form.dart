import 'package:flutter/material.dart';

import '../../../../../../constants/entities/up_residence_hall_entities.dart';
import '../../../domain/entities/up_residence_hall_entity.dart';
import '../helpers/delivery_address_text_field_state.dart';
import 'dropdown_button_callbacks/dropdown_button_on_changed.dart';
import 'form_validators/preset_address_validator.dart';

class DeliveryAddressForm extends StatefulWidget {
  const DeliveryAddressForm({
    super.key,
    required GlobalKey<FormState> deliveryAddressFormKey,
  }) : _deliveryAddressFormKey = deliveryAddressFormKey;

  final GlobalKey<FormState> _deliveryAddressFormKey;

  @override
  State<DeliveryAddressForm> createState() => _DeliveryAddressFormState();
}

class _DeliveryAddressFormState extends State<DeliveryAddressForm> {
  // Step 2: Delivery Address.
  // Delivery Address controllers.
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

    // Step 2: Delivery Address.
    // Delivery Address controllers.
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
    // Step 2. Delivery Address controllers.
    _provinceTextController.dispose();
    _cityOrMunicipalityTextController.dispose();
    _barangayTextController.dispose();
    _streetAndBuildingNameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._deliveryAddressFormKey,
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
          ),
        ],
      ),
    );
  }
}
