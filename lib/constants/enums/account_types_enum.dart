enum AccountTypesEnum {
  god(name: 'God', accessLevel: double.infinity),
  admin(name: 'Admin', accessLevel: 80.0),
  moderator(name: 'Moderator', accessLevel: 70.0),
  upFaculty(name: 'UP Faculty', accessLevel: 60.0),
  upStudent(name: 'UP Student', accessLevel: 50.0),
  upAlumni(name: 'UP Alumni', accessLevel: 40.0),
  upEntity(name: 'UP Entity', accessLevel: 31.0),
  nonUp(name: 'Non-UP', accessLevel: 30.0),
  unverified(name: 'Unverified', accessLevel: 20.0),
  anonymous(name: 'Anonymous', accessLevel: 10.0),
  suspended(name: 'Suspended', accessLevel: -20.0),
  banned(name: 'Banned', accessLevel: -30.0);

  const AccountTypesEnum({required this.name, required this.accessLevel});
  final String name;
  final double accessLevel;
}
