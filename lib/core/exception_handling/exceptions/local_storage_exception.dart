import '../../../interfaces/exception_intf.dart';

class LocalStorageException implements ExceptionIntf {
  const LocalStorageException({
    required String title,
    required String message,
    required StackTrace stackTrace,
  })  : _title = title,
        _message = message,
        _stackTrace = stackTrace;

  final String _title;
  final String _message;
  final StackTrace _stackTrace;

  // Getters.
  @override
  String get title => _title;

  @override
  String get message => _message;

  @override
  StackTrace get stackTrace => _stackTrace;

  @override
  List<Object?> get props => [title, message, stackTrace];

  @override
  bool? get stringify => false;
}
