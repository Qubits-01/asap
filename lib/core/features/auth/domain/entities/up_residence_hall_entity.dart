import '../../../../../interfaces/entity_interface.dart';
import 'address_entity.dart';

/// This class is immutable by design in order to prevent accidental changes.
/// If you need to change the fields, then you must create a new instance of
/// this class alongside with the new field values.
class UpResidenceHallEntity implements EntityInterface {
  const UpResidenceHallEntity({
    required String completeName,
    required String shortName,
    required AddressEntity addressEntity,
  })  : _completeName = completeName,
        _shortName = shortName,
        _addressEntity = addressEntity;

  final String _completeName;
  final String _shortName;
  final AddressEntity _addressEntity;

  // Getters.
  String get completeName => _completeName;
  String get shortName => _shortName;
  AddressEntity get addressEntity => _addressEntity;
  String get province => _addressEntity.province;
  String get cityOrMunicipality => _addressEntity.cityOrMunicipality;
  String get barangay => _addressEntity.barangay;
  String get streetAndBuildingName => _addressEntity.streetAndBuildingName;

  @override
  List<Object?> get props => [
        _completeName,
        _shortName,
        _addressEntity,
      ];

  @override
  bool? get stringify => false;
}
