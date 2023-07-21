class DeliveryAddressTextFieldStates {
  const DeliveryAddressTextFieldStates({
    DeliveryAddressTextFieldState? province,
    DeliveryAddressTextFieldState? cityOrMunicipality,
    DeliveryAddressTextFieldState? barangay,
    DeliveryAddressTextFieldState? streetAndBuildingName,
  })  : _province = province ?? const DeliveryAddressTextFieldState(),
        _cityOrMunicipality =
            cityOrMunicipality ?? const DeliveryAddressTextFieldState(),
        _barangay = barangay ?? const DeliveryAddressTextFieldState(),
        _streetAndBuildingName =
            streetAndBuildingName ?? const DeliveryAddressTextFieldState();

  final DeliveryAddressTextFieldState _province;
  final DeliveryAddressTextFieldState _cityOrMunicipality;
  final DeliveryAddressTextFieldState _barangay;
  final DeliveryAddressTextFieldState _streetAndBuildingName;

  // Getters.
  DeliveryAddressTextFieldState get province => _province;
  DeliveryAddressTextFieldState get cityOrMunicipality => _cityOrMunicipality;
  DeliveryAddressTextFieldState get barangay => _barangay;
  DeliveryAddressTextFieldState get streetAndBuildingName =>
      _streetAndBuildingName;

  DeliveryAddressTextFieldStates copyWith({
    DeliveryAddressTextFieldState? province,
    DeliveryAddressTextFieldState? cityOrMunicipality,
    DeliveryAddressTextFieldState? barangay,
    DeliveryAddressTextFieldState? streetAndBuildingName,
  }) {
    print('inside: ${province?.isEnabled}');
    return DeliveryAddressTextFieldStates(
      province: province ?? this.province,
      cityOrMunicipality: cityOrMunicipality ?? this.cityOrMunicipality,
      barangay: barangay ?? this.barangay,
      streetAndBuildingName:
          streetAndBuildingName ?? this.streetAndBuildingName,
    );
  }
}

class DeliveryAddressTextFieldState {
  const DeliveryAddressTextFieldState({
    bool isEnabled = false,
    bool isReadOnly = false,
  })  : _isEnabled = isEnabled,
        _isReadOnly = isReadOnly;

  // Getters.
  bool get isEnabled => _isEnabled;
  bool get isReadOnly => _isReadOnly;

  final bool _isEnabled;
  final bool _isReadOnly;

  DeliveryAddressTextFieldState copyWith({
    bool? isEnabled,
    bool? isReadOnly,
  }) {
    return DeliveryAddressTextFieldState(
      isEnabled: isEnabled ?? this.isEnabled,
      isReadOnly: isReadOnly ?? this.isReadOnly,
    );
  }
}
