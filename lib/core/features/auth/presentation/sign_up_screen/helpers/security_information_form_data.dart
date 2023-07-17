// ignore_for_file: unnecessary_getters_setters

/// The copyWith paradigm was not also used in this class since there might be
/// a chance of a dirty state (i.e., making a copy of this class does not guarantee
/// that it contains all the up to date prop updates made by the user because there might be a
/// chance during the copying process, the user also made an update on this class' props simultaneously,
/// which will not be reflected on the copy).
class SecurityInformationFormData {
  SecurityInformationFormData({
    String? emailAddress,
    String? phoneNumber,
    String? password,
  })  : _emailAddress = emailAddress,
        _phoneNumber = phoneNumber,
        _password = password;

  // They are all of nullable type since the props will be populated one by one
  // (or not all the same time) as the user fills up the form correctly.
  String? _emailAddress;
  String? _phoneNumber;
  String? _password;

  // Getters.
  String? get emailAddress => _emailAddress;
  String? get phoneNumber => _phoneNumber;
  String? get password => _password;

  // Setters.
  // No need for input validators here since the Form validators
  // that was used in the front-end said takes care of it.
  set emailAddress(String? value) => _emailAddress = value;
  set phoneNumber(String? value) => _phoneNumber = value;
  set password(String? value) => _password = value;
}
