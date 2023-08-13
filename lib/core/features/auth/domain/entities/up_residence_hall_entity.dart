import '../../../../../interfaces/entity_intf.dart';
import 'address_entity.dart';

/// This class is immutable by design in order to prevent accidental changes.
/// If you need to change the fields, then you must create a new instance of
/// this class alongside with the new field values.
class UpResidenceHallEntity implements EntityIntf {
  const UpResidenceHallEntity({
    required String completeName,
    required String tagName,
    required AddressEntity addressEntity,
  })  : _completeName = completeName,
        _tagName = tagName,
        _addressEntity = addressEntity;

  final String _completeName;
  final String _tagName;
  final AddressEntity _addressEntity;

  // Getters.
  String get completeName => _completeName;
  String get tagName => _tagName;
  AddressEntity get addressEntity => _addressEntity;
  String get province => _addressEntity.province;
  String get cityOrMunicipality => _addressEntity.cityOrMunicipality;
  String get barangay => _addressEntity.barangay;
  String get streetAndBuildingName => _addressEntity.streetAndBuildingName;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object?> get props => [
        _completeName,
        _tagName,
        _addressEntity,
      ];

  @override
  bool? get stringify => false;
}
