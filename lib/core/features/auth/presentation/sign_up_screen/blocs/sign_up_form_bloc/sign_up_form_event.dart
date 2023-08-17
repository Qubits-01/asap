part of 'sign_up_form_bloc.dart';

sealed class SignUpFormEvent extends Equatable {
  const SignUpFormEvent();

  @override
  List<Object> get props => [];
}

final class SignUpFormStarted extends SignUpFormEvent {
  const SignUpFormStarted();
}

final class SignUpFormInputDataSaved extends SignUpFormEvent {
  const SignUpFormInputDataSaved({
    required final String key,
    required final String value,
  })  : _key = key,
        _value = value;

  final String _key, _value;

  /// Getters.
  String get key => _key;
  String get value => _value;

  /// Equality overwrite using the [Equatable] package.
  @override
  List<Object> get props => [_key, _value];
}

final class SignUpFormInputDataLoaded extends SignUpFormEvent {
  const SignUpFormInputDataLoaded({required final String key}) : _key = key;

  final String _key;

  /// Getters.
  String get key => _key;

  /// Equality overwrite using the [Equatable] package.
  @override
  List<Object> get props => [_key];
}
