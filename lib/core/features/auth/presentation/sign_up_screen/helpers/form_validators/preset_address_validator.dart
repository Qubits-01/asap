import '../../../../domain/entities/sign_up_form_entity/address_information_entity.dart';

class PresetAddressValidator {
  const PresetAddressValidator();

  String? call({required AddressInformationEntity? addressInformationEntity}) {
    if (addressInformationEntity == null) {
      return 'Please select a preset address.';
    }

    return null;
  }
}
