// ignore_for_file: unnecessary_getters_setters

/// The copyWith paradigm was not also used in this class since there might be
/// a chance of a dirty state (i.e., making a copy of this class does not guarantee
/// that it contains all the up to date prop updates made by the user because there might be a
/// chance during the copying process, the user also made an update on this class' props simultaneously,
/// which will not be reflected on the copy).
class UserInformationFormData {
  UserInformationFormData({
    String? username,
    String? firstName,
    String? middleInitial,
    String? lastName,
    String? suffix,
  })  : _username = username,
        _firstName = firstName,
        _middleInitial = middleInitial,
        _lastName = lastName,
        _suffix = suffix;

  // They are all of nullable type since the props will be populated one by one
  // (or not all the same time) as the user fills up the form correctly.
  String? _username;
  String? _firstName;
  String? _middleInitial;
  String? _lastName;
  String? _suffix;

  // Getters.
  String? get username => _username;
  String? get firstName => _firstName;
  String? get middleInitial => _middleInitial;
  String? get lastName => _lastName;
  String? get suffix => _suffix;

  // Setters.
  // No need for input validators here since the Form validators
  // that was used in the front-end said takes care of it.
  set username(String? value) => _username = value;
  set firstName(String? value) => _firstName = value;
  set middleInitial(String? value) => _middleInitial = value;
  set lastName(String? value) => _lastName = value;
  set suffix(String? value) => _suffix = value;
}
