import '../../../../../../interfaces/entity_intf.dart';

class UserInformationEntity implements EntityIntf {
  const UserInformationEntity({
    required final String userName,
    required final String firstName,
    required final String middleInitial,
    required final String lastName,
    final String? suffix,
  })  : _userName = userName,
        _firstName = firstName,
        _middleInitial = middleInitial,
        _lastName = lastName,
        _suffix = suffix;

  final String _userName, _firstName, _middleInitial, _lastName;
  final String? _suffix;

  /// Getters.
  String get userName => _userName;
  String get firstName => _firstName;
  String get middleInitial => _middleInitial;
  String get lastName => _lastName;
  String? get suffix => _suffix;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object?> get props => [
        userName,
        firstName,
        middleInitial,
        lastName,
        suffix,
      ];

  @override
  bool? get stringify => false;
}
