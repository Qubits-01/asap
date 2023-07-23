import '../../../../../interfaces/entity_intf.dart';

/// This class is immutable by design in order to prevent accidental changes.
/// If you need to change the fields, then you must create a new instance of
/// this class alongside with the new field values.
class AddressEntity implements EntityIntf {
  const AddressEntity({
    required String province,
    required String cityOrMunicipality,
    required String barangay,
    required String streetAndBuildingName,
  })  : _province = province,
        _cityOrMunicipality = cityOrMunicipality,
        _barangay = barangay,
        _streetAndBuildingName = streetAndBuildingName;

  final String _province;
  final String _cityOrMunicipality;
  final String _barangay;
  final String _streetAndBuildingName;

  // Getters.
  String get province => _province;
  String get cityOrMunicipality => _cityOrMunicipality;
  String get barangay => _barangay;
  String get streetAndBuildingName => _streetAndBuildingName;

  @override
  List<Object?> get props => [
        _province,
        _cityOrMunicipality,
        _barangay,
        _streetAndBuildingName,
      ];

  @override
  bool? get stringify => false;
}
