part of 'sign_up_form_dropdown_bloc.dart';

sealed class SignUpFormDropdownState extends Equatable {
  const SignUpFormDropdownState({
    required final AddressInformationEntity addressInformationEntity,
    required final AddressInformationTextFieldStatusEntity
        addressInformationTextFieldStatusEntity,
    final bool? isFormValid,
    final FailureEntity? failureEntity,
  })  : _addressInformationEntity = addressInformationEntity,
        _addressInformationTextFieldStatusEntity =
            addressInformationTextFieldStatusEntity,
        _isFormValid = isFormValid,
        _failureEntity = failureEntity;

  final AddressInformationEntity _addressInformationEntity;
  final AddressInformationTextFieldStatusEntity
      _addressInformationTextFieldStatusEntity;
  final FailureEntity? _failureEntity;
  final bool? _isFormValid;

  /// Getters.
  AddressInformationEntity get addressInformationEntity =>
      _addressInformationEntity;
  AddressInformationTextFieldStatusEntity
      get addressInformationTextFieldStatusEntity =>
          _addressInformationTextFieldStatusEntity;
  bool? get isFormValid => _isFormValid;
  FailureEntity? get failureEntity => _failureEntity;

  @override
  List<Object?> get props => [
        addressInformationEntity,
        addressInformationTextFieldStatusEntity,
        failureEntity,
        isFormValid,
      ];
}

final class SignUpFormDropdownInitial extends SignUpFormDropdownState {
  const SignUpFormDropdownInitial({
    super.addressInformationEntity = const AddressInformationEntity(
      tagName: '',
      province: '',
      cityOrMunicipality: '',
      barangay: '',
      streetAndBuildingName: '',
    ),
    super.addressInformationTextFieldStatusEntity =
        const AddressInformationTextFieldStatusEntity(
      isProvinceTextFieldEnabled: false,
      isProvinceTextFieldReadOnly: true,
      isCityOrMunicipalityTextFieldEnabled: false,
      isCityOrMunicipalityTextFieldReadOnly: true,
      isBarangayTextFieldEnabled: false,
      isBarangayTextFieldReadOnly: true,
      isStreetAndBuildingNameTextFieldEnabled: false,
      isStreetAndBuildingNameTextFieldReadOnly: true,
    ),
  });
}

final class SignUpFormDropdownVisualUpdateSuccess
    extends SignUpFormDropdownState {
  const SignUpFormDropdownVisualUpdateSuccess({
    required super.addressInformationEntity,
    required super.addressInformationTextFieldStatusEntity,
    required bool super.isFormValid,
  });
}

final class SignUpFormDropdownVisualUpdateFailure
    extends SignUpFormDropdownState {
  const SignUpFormDropdownVisualUpdateFailure({
    required super.addressInformationEntity,
    required super.addressInformationTextFieldStatusEntity,
    required FailureEntity super.failureEntity,
  });
}
