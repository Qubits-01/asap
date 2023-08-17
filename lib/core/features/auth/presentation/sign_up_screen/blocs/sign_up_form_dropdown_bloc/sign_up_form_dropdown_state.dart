part of 'sign_up_form_dropdown_bloc.dart';

sealed class SignUpFormDropdownState extends Equatable {
  const SignUpFormDropdownState({
    required final AddressInformationEntity addressInformationEntity,
    required final AddressInformationTextFieldStatusEntity
        addressInformationTextFieldStatusEntity,
    final FailureEntity? failureEntity,
  })  : _addressInformationEntity = addressInformationEntity,
        _addressInformationTextFieldStatusEntity =
            addressInformationTextFieldStatusEntity,
        _failureEntity = failureEntity;

  final AddressInformationEntity _addressInformationEntity;
  final AddressInformationTextFieldStatusEntity
      _addressInformationTextFieldStatusEntity;
  final FailureEntity? _failureEntity;

  /// Getters.
  AddressInformationEntity get addressInformationEntity =>
      _addressInformationEntity;
  AddressInformationTextFieldStatusEntity
      get addressInformationTextFieldsEntity =>
          _addressInformationTextFieldStatusEntity;
  FailureEntity? get failureEntity => _failureEntity;

  @override
  List<Object?> get props => [
        addressInformationEntity,
        addressInformationTextFieldsEntity,
        failureEntity,
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

final class SignUpFormDropdownVisualUpdateInProgress
    extends SignUpFormDropdownState {
  const SignUpFormDropdownVisualUpdateInProgress({
    required final AddressInformationEntity addressInformationEntity,
    required final AddressInformationTextFieldStatusEntity
        addressInformationTextFieldStatusEntity,
  }) : super(
          addressInformationEntity: addressInformationEntity,
          addressInformationTextFieldStatusEntity:
              addressInformationTextFieldStatusEntity,
        );
}

final class SignUpFromDropdownVisualUpdateSuccess
    extends SignUpFormDropdownState {
  const SignUpFromDropdownVisualUpdateSuccess({
    required final AddressInformationEntity addressInformationEntity,
    required final AddressInformationTextFieldStatusEntity
        addressInformationTextFieldStatusEntity,
  }) : super(
          addressInformationEntity: addressInformationEntity,
          addressInformationTextFieldStatusEntity:
              addressInformationTextFieldStatusEntity,
        );
}

final class SignUpFormDropdownVisualUpdateFailure
    extends SignUpFormDropdownState {
  const SignUpFormDropdownVisualUpdateFailure({
    required final AddressInformationEntity addressInformationEntity,
    required final AddressInformationTextFieldStatusEntity
        addressInformationTextFieldStatusEntity,
    required final FailureEntity failureEntity,
  }) : super(
          addressInformationEntity: addressInformationEntity,
          addressInformationTextFieldStatusEntity:
              addressInformationTextFieldStatusEntity,
          failureEntity: failureEntity,
        );
}
