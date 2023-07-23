import 'package:equatable/equatable.dart';

/// Properties _title,  _message, and _stackTrace are required for every [ExceptionIntf] objects.
/// The programmer can add more properties on the concrete implementation
/// of this [ExceptionIntf] abstract class as needed be.
abstract class ExceptionIntf extends Equatable implements Exception {
  const ExceptionIntf({
    required String title,
    required String message,
    required StackTrace stackTrace,
  });

  String get title;
  String get message;
  StackTrace get stackTrace;
}
