part of 'sign_up_data_preservation_bloc.dart';

sealed class SignUpDataPreservationEvent extends Equatable {
  const SignUpDataPreservationEvent();

  @override
  List<Object?> get props => [];
}

final class SignUpDataPreservationStarted extends SignUpDataPreservationEvent {
  const SignUpDataPreservationStarted();
}

final class SignUpDataPreservationFormSaved
    extends SignUpDataPreservationEvent {
  const SignUpDataPreservationFormSaved({
    required String key,
    required String value,
  })  : _key = key,
        _value = value;

  final String _key, _value;

  // Getters.
  String get key => _key;
  String get value => _value;

  @override
  List<Object?> get props => [key, value];
}
