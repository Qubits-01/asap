part of 'sign_up_form_dropdown_bloc.dart';

sealed class SignUpFormDropdownEvent extends Equatable {
  const SignUpFormDropdownEvent();

  @override
  List<Object?> get props => [];
}

final class SignUpFormDropdownStarted extends SignUpFormDropdownEvent {
  const SignUpFormDropdownStarted();
}

final class SignUpFormDropdownOnChanged extends SignUpFormDropdownEvent {
  const SignUpFormDropdownOnChanged({
    required final AddressInformationEntity? addressInformationEntity,
  }) : _addressInformationEntity = addressInformationEntity;

  final AddressInformationEntity? _addressInformationEntity;

  /// Getters.
  AddressInformationEntity? get addressInformationEntity =>
      _addressInformationEntity;

  @override
  List<Object?> get props => [addressInformationEntity];
}
