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
