import '../../../../domain/entities/up_residence_hall_entity.dart';

class PresetAddressValidator {
  const PresetAddressValidator();

  String? call({required UpResidenceHallEntity? upResidenceHallEntity}) {
    if (upResidenceHallEntity == null) {
      return 'Please select a preset address.';
    }

    return null;
  }
}
