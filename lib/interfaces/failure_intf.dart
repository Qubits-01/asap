import 'package:equatable/equatable.dart';

/// Properties _title,  _message, and _stackTrace are required for every [FailureIntf] objects.
/// The programmer can add more properties on the concrete implementation
/// of this [FailureIntf] abstract class as needed be.
abstract class FailureIntf extends Equatable {
  const FailureIntf({
    required String title,
    required String message,
  });

  // Getters.
  String get title;
  String get message;
}
