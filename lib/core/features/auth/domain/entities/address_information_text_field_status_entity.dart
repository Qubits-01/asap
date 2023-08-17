import '../../../../../interfaces/entity_intf.dart';

class AddressInformationTextFieldStatusEntity implements EntityIntf {
  const AddressInformationTextFieldStatusEntity({
    required final bool isProvinceTextFieldEnabled,
    required final bool isProvinceTextFieldReadOnly,
    required final bool isCityOrMunicipalityTextFieldEnabled,
    required final bool isCityOrMunicipalityTextFieldReadOnly,
    required final bool isBarangayTextFieldEnabled,
    required final bool isBarangayTextFieldReadOnly,
    required final bool isStreetAndBuildingNameTextFieldEnabled,
    required final bool isStreetAndBuildingNameTextFieldReadOnly,
  })  : _isProvinceTextFieldEnabled = isProvinceTextFieldEnabled,
        _isProvinceTextFieldReadOnly = isProvinceTextFieldReadOnly,
        _isCityOrMunicipalityTextFieldEnabled =
            isCityOrMunicipalityTextFieldEnabled,
        _isCityOrMunicipalityTextFieldReadOnly =
            isCityOrMunicipalityTextFieldReadOnly,
        _isBarangayTextFieldEnabled = isBarangayTextFieldEnabled,
        _isBarangayTextFieldReadOnly = isBarangayTextFieldReadOnly,
        _isStreetAndBuildingNameTextFieldEnabled =
            isStreetAndBuildingNameTextFieldEnabled,
        _isStreetAndBuildingNameTextFieldReadOnly =
            isStreetAndBuildingNameTextFieldReadOnly;

  final bool _isProvinceTextFieldEnabled, _isProvinceTextFieldReadOnly;
  final bool _isCityOrMunicipalityTextFieldEnabled,
      _isCityOrMunicipalityTextFieldReadOnly;
  final bool _isBarangayTextFieldEnabled, _isBarangayTextFieldReadOnly;
  final bool _isStreetAndBuildingNameTextFieldEnabled,
      _isStreetAndBuildingNameTextFieldReadOnly;

  /// Getters.
  bool get isProvinceTextFieldEnabled => _isProvinceTextFieldEnabled;
  bool get isProvinceTextFieldReadOnly => _isProvinceTextFieldReadOnly;
  bool get isCityOrMunicipalityTextFieldEnabled =>
      _isCityOrMunicipalityTextFieldEnabled;
  bool get isCityOrMunicipalityTextFieldReadOnly =>
      _isCityOrMunicipalityTextFieldReadOnly;
  bool get isBarangayTextFieldEnabled => _isBarangayTextFieldEnabled;
  bool get isBarangayTextFieldReadOnly => _isBarangayTextFieldReadOnly;
  bool get isStreetAndBuildingNameTextFieldEnabled =>
      _isStreetAndBuildingNameTextFieldEnabled;
  bool get isStreetAndBuildingNameTextFieldReadOnly =>
      _isStreetAndBuildingNameTextFieldReadOnly;

  /// Copy with.
  AddressInformationTextFieldStatusEntity copyWith({
    bool? isProvinceTextFieldEnabled,
    bool? isProvinceTextFieldReadOnly,
    bool? isCityOrMunicipalityTextFieldEnabled,
    bool? isCityOrMunicipalityTextFieldReadOnly,
    bool? isBarangayTextFieldEnabled,
    bool? isBarangayTextFieldReadOnly,
    bool? isStreetAndBuildingNameTextFieldEnabled,
    bool? isStreetAndBuildingNameTextFieldReadOnly,
  }) {
    return AddressInformationTextFieldStatusEntity(
      isProvinceTextFieldEnabled:
          isProvinceTextFieldEnabled ?? this.isProvinceTextFieldEnabled,
      isProvinceTextFieldReadOnly:
          isProvinceTextFieldReadOnly ?? this.isProvinceTextFieldReadOnly,
      isCityOrMunicipalityTextFieldEnabled:
          isCityOrMunicipalityTextFieldEnabled ??
              this.isCityOrMunicipalityTextFieldEnabled,
      isCityOrMunicipalityTextFieldReadOnly:
          isCityOrMunicipalityTextFieldReadOnly ??
              this.isCityOrMunicipalityTextFieldReadOnly,
      isBarangayTextFieldEnabled:
          isBarangayTextFieldEnabled ?? this.isBarangayTextFieldEnabled,
      isBarangayTextFieldReadOnly:
          isBarangayTextFieldReadOnly ?? this.isBarangayTextFieldReadOnly,
      isStreetAndBuildingNameTextFieldEnabled:
          isStreetAndBuildingNameTextFieldEnabled ??
              this.isStreetAndBuildingNameTextFieldEnabled,
      isStreetAndBuildingNameTextFieldReadOnly:
          isStreetAndBuildingNameTextFieldReadOnly ??
              this.isStreetAndBuildingNameTextFieldReadOnly,
    );
  }

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object?> get props => [
        isProvinceTextFieldEnabled,
        isProvinceTextFieldReadOnly,
        isCityOrMunicipalityTextFieldEnabled,
        isCityOrMunicipalityTextFieldReadOnly,
        isBarangayTextFieldEnabled,
        isBarangayTextFieldReadOnly,
        isStreetAndBuildingNameTextFieldEnabled,
        isStreetAndBuildingNameTextFieldReadOnly,
      ];

  @override
  bool? get stringify => false;
}
