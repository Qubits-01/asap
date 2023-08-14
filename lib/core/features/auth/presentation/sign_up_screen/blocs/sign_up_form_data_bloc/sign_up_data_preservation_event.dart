part of 'sign_up_form_data_bloc.dart';

sealed class SignUpFormDataEvent extends Equatable {
  const SignUpFormDataEvent();

  @override
  List<Object?> get props => [];
}

final class SignUpFormDataStarted extends SignUpFormDataEvent {
  const SignUpFormDataStarted();
}

final class SignUpFormDataInputSaved extends SignUpFormDataEvent {
  const SignUpFormDataInputSaved({
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
