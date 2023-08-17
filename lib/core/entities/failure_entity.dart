import 'package:equatable/equatable.dart';

class FailureEntity extends Equatable {
  const FailureEntity({
    required String title,
    required String message,
  })  : _title = title,
        _message = message;

  final String _title, _message;

  /// Getters.
  String get title => _title;
  String get message => _message;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object?> get props => [title, message];
}
