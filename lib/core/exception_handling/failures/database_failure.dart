import '../../../interfaces/failure_intf.dart';

class DatabaseFailure implements FailureIntf {
  const DatabaseFailure({
    required String title,
    required String message,
    required StackTrace stackTrace,
  })  : _title = title,
        _message = message;

  final String _title;
  final String _message;

  // Getters.
  @override
  String get title => _title;

  @override
  String get message => _message;

  @override
  List<Object?> get props => [title, message];

  @override
  bool? get stringify => false;
}
