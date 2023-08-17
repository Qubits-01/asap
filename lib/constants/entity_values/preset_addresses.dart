import '../../core/features/auth/domain/entities/sign_up_form_entity/address_information_entity.dart';

sealed class PresetAddresses {
  const PresetAddresses._();

  static const ipilRH = AddressInformationEntity(
    tagName: 'Ipil RH',
    province: 'Metro Manila',
    cityOrMunicipality: 'Quezon City',
    barangay: 'U.P. Campus',
    streetAndBuildingName: 'Magsaysay Ave., Ipil RH',
    completeBuildingName: 'Ipil Residence Hall',
    isUPDormitory: true,
    canDeliverToThisAddress: true,
  );

  static const yakalRH = AddressInformationEntity(
    tagName: 'Yakal RH',
    province: 'Metro Manila',
    cityOrMunicipality: 'Quezon City',
    barangay: 'U.P. Campus',
    streetAndBuildingName: 'Magsaysay Ave., Yakal RH',
    completeBuildingName: 'Yakal Residence Hall',
    isUPDormitory: true,
    canDeliverToThisAddress: true,
  );

  static const kalayaanRH = AddressInformationEntity(
    tagName: 'Kalayaan RH',
    province: 'Metro Manila',
    cityOrMunicipality: 'Quezon City',
    barangay: 'U.P. Campus',
    streetAndBuildingName: 'Roces Street, Kalayaan RH',
    completeBuildingName: 'Kalayaan Residence Hall',
    isUPDormitory: true,
    canDeliverToThisAddress: true,
  );

  static const acaciaRH = AddressInformationEntity(
    tagName: 'Acacia RH',
    province: 'Metro Manila',
    cityOrMunicipality: 'Quezon City',
    barangay: 'U.P. Campus',
    streetAndBuildingName: 'Apacible Street, Acacia RH',
    completeBuildingName: 'Acacia Residence Hall',
    isUPDormitory: true,
    canDeliverToThisAddress: true,
  );

  static const otherUpRH = AddressInformationEntity(
    tagName: '[ Other UP RH ]',
    province: 'Metro Manila',
    cityOrMunicipality: 'Quezon City',
    barangay: 'U.P. Campus',
    streetAndBuildingName: '[ Unknown ]',
    isUPDormitory: true,
  );
}
