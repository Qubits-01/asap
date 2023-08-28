import 'package:ate_kens_food_delivery/core/features/auth/domain/entities/address_information_text_field_status_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../constants/entity_values/preset_addresses.dart';
import '../../../../../../../constants/local_storage_cache_keys.dart';
import '../../../../domain/entities/sign_up_form_entity/address_information_entity.dart';
import '../../blocs/sign_up_form_data_bloc/sign_up_form_data_bloc.dart';
import '../../blocs/sign_up_form_dropdown_bloc/sign_up_form_dropdown_bloc.dart';
import '../../blocs/sign_up_stepper_bloc/sign_up_stepper_bloc.dart';
import '../../helpers/form_validators/preset_address_validator.dart';

class AddressInformationForm extends StatefulWidget {
  const AddressInformationForm({super.key});

  @override
  State<AddressInformationForm> createState() => _AddressInformationState();
}

class _AddressInformationState extends State<AddressInformationForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormDropdownBloc, SignUpFormDropdownState>(
      listener: (context, state) {
        if (state is SignUpFormDropdownVisualUpdateSuccess) {
          context.read<SignUpStepperBloc>().add(
                SignUpStepperDropdownOnChanged(
                  isFormValid: state.isFormValid ?? false,
                ),
              );
        }
      },
      builder: (context, state) {
        late final SignUpFormDropdownBloc signUpFormDropdownBloc;
        late final AddressInformationTextFieldStatusEntity
            addressInformationTextFieldStatusEntity;

        signUpFormDropdownBloc = context.read<SignUpFormDropdownBloc>();
        addressInformationTextFieldStatusEntity = signUpFormDropdownBloc
            .state.addressInformationTextFieldStatusEntity;

        return Form(
          key: signUpFormDropdownBloc.addressInformationFormKey,
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<AddressInformationEntity>(
                // hint: Text('Select a preset address'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  labelText: 'Preset Address',
                ),
                onChanged: (
                  AddressInformationEntity? addressInformationEntity,
                ) {
                  signUpFormDropdownBloc.add(SignUpFormDropdownOnChanged(
                    addressInformationEntity: addressInformationEntity,
                  ));
                },
                validator: (AddressInformationEntity? value) {
                  return const PresetAddressValidator()(
                    addressInformationEntity: value,
                  );
                },
                onSaved: (AddressInformationEntity? newValue) {
                  context.read<SignUpFormDataBloc>().add(
                        SignUpFormDataInputSaved(
                          key: LocalStorageCacheKeys.presetAddressTag,
                          value: newValue?.tagName as String,
                        ),
                      );
                },
                items: const <DropdownMenuItem<AddressInformationEntity>>[
                  DropdownMenuItem(
                    value: PresetAddresses.ipilRH,
                    child: Text('Ipil RH'),
                  ),
                  DropdownMenuItem(
                    value: PresetAddresses.yakalRH,
                    child: Text('Yakal RH'),
                  ),
                  DropdownMenuItem(
                    value: PresetAddresses.kalayaanRH,
                    child: Text('Kalayaan RH'),
                  ),
                  DropdownMenuItem(
                    value: PresetAddresses.acaciaRH,
                    child: Text('Acacia RH'),
                  ),
                  DropdownMenuItem(
                    value: PresetAddresses.otherUpRH,
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
                controller: signUpFormDropdownBloc.provinceTextController,
                readOnly: addressInformationTextFieldStatusEntity
                    .isProvinceTextFieldReadOnly,
                enabled: addressInformationTextFieldStatusEntity
                    .isProvinceTextFieldEnabled,
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
                controller:
                    signUpFormDropdownBloc.cityOrMunicipalityTextController,
                readOnly: addressInformationTextFieldStatusEntity
                    .isCityOrMunicipalityTextFieldReadOnly,
                enabled: addressInformationTextFieldStatusEntity
                    .isCityOrMunicipalityTextFieldEnabled,
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
                controller: signUpFormDropdownBloc.barangayTextController,
                readOnly: addressInformationTextFieldStatusEntity
                    .isBarangayTextFieldReadOnly,
                enabled: addressInformationTextFieldStatusEntity
                    .isBarangayTextFieldEnabled,
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
                controller:
                    signUpFormDropdownBloc.streetAndBuildingNameTextController,
                readOnly: addressInformationTextFieldStatusEntity
                    .isStreetAndBuildingNameTextFieldReadOnly,
                enabled: addressInformationTextFieldStatusEntity
                    .isStreetAndBuildingNameTextFieldEnabled,
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
      },
    );
  }
}
