// ignore_for_file: unnecessary_getters_setters

/// The copyWith paradigm was not also used in this class since there might be
/// a chance of a dirty state (i.e., making a copy of this class does not guarantee
/// that it contains all the up to date prop updates made by the user because there might be a
/// chance during the copying process, the user also made an update on this class' props simultaneously,
/// which will not be reflected on the copy).
class DeliveryAddressFormData {
  DeliveryAddressFormData({
    String? presetAddress,
    String? province,
    String? cityOrMunicipality,
    String? barangay,
    String? streetAndBuildingName,
  })  : _presetAddress = presetAddress,
        _province = province,
        _cityOrMunicipality = cityOrMunicipality,
        _barangay = barangay,
        _streetAndBuildingName = streetAndBuildingName;

  // They are all of nullable type since the props will be populated one by one
  // (or not all the same time) as the user fills up the form correctly.
  String? _presetAddress;
  String? _province;
  String? _cityOrMunicipality;
  String? _barangay;
  String? _streetAndBuildingName;

  // Getters.
  String? get presetAddress => _presetAddress;
  String? get province => _province;
  String? get cityOrMunicipality => _cityOrMunicipality;
  String? get barangay => _barangay;
  String? get streetAndBuildingName => _streetAndBuildingName;

  // Setters.
  // No need for input validators here since the Form validators
  // that was used in the front-end said takes care of it.
  set presetAddress(String? value) => _presetAddress = value;
  set province(String? value) => _province = value;
  set cityOrMunicipality(String? value) => _cityOrMunicipality = value;
  set barangay(String? value) => _barangay = value;
  set streetAndBuildingName(String? value) => _streetAndBuildingName = value;
}
