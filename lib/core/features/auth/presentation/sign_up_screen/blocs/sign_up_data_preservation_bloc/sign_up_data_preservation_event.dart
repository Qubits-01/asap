part of 'sign_up_data_preservation_bloc.dart';

sealed class SignUpDataPreservationEvent extends Equatable {
  const SignUpDataPreservationEvent();

  @override
  List<Object?> get props => [];
}

final class SignUpDataPreservationStarted extends SignUpDataPreservationEvent {
  const SignUpDataPreservationStarted();
}

final class SignUpDataPreservationContinueButtonPressed
    extends SignUpDataPreservationEvent {
  const SignUpDataPreservationContinueButtonPressed({
    // User Information.
    required String username,
    required String firstName,
    required String middleInitial,
    required String lastName,
    String? suffix,

    // Address Information.
    required String presetAddressTag,
    required String province,
    required String cityOrMunicipality,
    required String barangay,
    required String streetAndBuildingName,

    // Security Information.
    required String emailAddress,
    required String phoneNumber,
    required String password,
  })  : _username = username,
        _firstName = firstName,
        _middleInitial = middleInitial,
        _lastName = lastName,
        _suffix = suffix,
        _presetAddressTag = presetAddressTag,
        _province = province,
        _cityOrMunicipality = cityOrMunicipality,
        _barangay = barangay,
        _streetAndBuildingName = streetAndBuildingName,
        _emailAddress = emailAddress,
        _phoneNumber = phoneNumber,
        _password = password;

  // User Information.
  final String _username, _firstName, _middleInitial, _lastName;
  final String? _suffix;

  // Address Information.
  final String _presetAddressTag,
      _province,
      _cityOrMunicipality,
      _barangay,
      _streetAndBuildingName;

  // Security Information.
  final String _emailAddress, _phoneNumber, _password;

  // Getters.
  String get username => _username;
  String get firstName => _firstName;
  String get middleInitial => _middleInitial;
  String get lastName => _lastName;
  String? get suffix => _suffix;
  String get presetAddressTag => _presetAddressTag;
  String get province => _province;
  String get cityOrMunicipality => _cityOrMunicipality;
  String get barangay => _barangay;
  String get streetAndBuildingName => _streetAndBuildingName;
  String get emailAddress => _emailAddress;
  String get phoneNumber => _phoneNumber;
  String get password => _password;

  @override
  List<Object?> get props => [
        username,
        firstName,
        middleInitial,
        lastName,
        suffix,
        presetAddressTag,
        province,
        cityOrMunicipality,
        barangay,
        streetAndBuildingName,
        emailAddress,
        phoneNumber,
        password,
      ];
}
