import '../../../../../../interfaces/entity_intf.dart';

/// This class is immutable by design in order to prevent accidental changes.
/// If you need to change the fields, then you must create a new instance of
/// this class alongside with the new field values.
class AddressInformationEntity implements EntityIntf {
  const AddressInformationEntity({
    required final String tagName,
    required final String province,
    required final String cityOrMunicipality,
    required final String barangay,
    required final String streetAndBuildingName,
    final String? completeBuildingName,

    /// Null means that the address is still undetermined weather it is a UP
    /// dormitory or not; and if the food vendor can deliver to this said address.
    final bool? isUPDormitory,
    final bool? canDeliverToThisAddress,
  })  : _tagName = tagName,
        _province = province,
        _cityOrMunicipality = cityOrMunicipality,
        _barangay = barangay,
        _streetAndBuildingName = streetAndBuildingName,
        _completeBuildingName = completeBuildingName,
        _isUPDormitory = isUPDormitory,
        _canDeliverToThisAddress = canDeliverToThisAddress;

  final String _tagName,
      _province,
      _cityOrMunicipality,
      _barangay,
      _streetAndBuildingName;
  final String? _completeBuildingName;
  final bool? _isUPDormitory, _canDeliverToThisAddress;

  /// Getters.
  String get tagName => _tagName;
  String get province => _province;
  String get cityOrMunicipality => _cityOrMunicipality;
  String get barangay => _barangay;
  String get streetAndBuildingName => _streetAndBuildingName;
  String? get completeBuildingName => _completeBuildingName;
  bool? get isUPDormitory => _isUPDormitory;
  bool? get canDeliverToThisAddress => _canDeliverToThisAddress;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object?> get props => [
        tagName,
        province,
        cityOrMunicipality,
        barangay,
        streetAndBuildingName,
        completeBuildingName,
        isUPDormitory,
        canDeliverToThisAddress,
      ];

  @override
  bool? get stringify => false;
}
