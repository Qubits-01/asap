import '../../core/features/auth/domain/entities/address_entity.dart';
import '../../core/features/auth/domain/entities/up_residence_hall_entity.dart';

// This might be deprecated in the future in favor of the admin/seller side
// creating the residence hall entities in the database.
class UpResidenceHallEntities {
  const UpResidenceHallEntities._();

  static const ipilRH = UpResidenceHallEntity(
    completeName: 'Ipil Residence Hall',
    shortName: 'Ipil RH',
    addressEntity: AddressEntity(
      province: 'Metro Manila',
      cityOrMunicipality: 'Quezon City',
      barangay: 'U.P. Campus',
      streetAndBuildingName: 'Magsaysay Ave., Ipil RH',
    ),
  );

  static const yakalRH = UpResidenceHallEntity(
    completeName: 'Yakal Residence Hall',
    shortName: 'Yakal RH',
    addressEntity: AddressEntity(
      province: 'Metro Manila',
      cityOrMunicipality: 'Quezon City',
      barangay: 'U.P. Campus',
      streetAndBuildingName: 'Magsaysay Ave., Yakal RH',
    ),
  );

  static const kalayaanRH = UpResidenceHallEntity(
    completeName: 'Kalayaan Residence Hall',
    shortName: 'Kalayaan RH',
    addressEntity: AddressEntity(
      province: 'Metro Manila',
      cityOrMunicipality: 'Quezon City',
      barangay: 'U.P. Campus',
      streetAndBuildingName: 'Roces Street, Kalayaan RH',
    ),
  );

  static const acaciaRH = UpResidenceHallEntity(
    completeName: 'Acacia Residence Hall',
    shortName: 'Acacia RH',
    addressEntity: AddressEntity(
      province: 'Metro Manila',
      cityOrMunicipality: 'Quezon City',
      barangay: 'U.P. Campus',
      streetAndBuildingName: 'Apacible Street, Acacia RH',
    ),
  );

  static const otherUpRH = UpResidenceHallEntity(
    completeName: '[ Other UP Residence Hall ]',
    shortName: '[ Other UP RH ]',
    addressEntity: AddressEntity(
      province: 'Metro Manila',
      cityOrMunicipality: 'Quezon City',
      barangay: 'U.P. Campus',
      streetAndBuildingName: '[ Unknown ]',
    ),
  );
}
