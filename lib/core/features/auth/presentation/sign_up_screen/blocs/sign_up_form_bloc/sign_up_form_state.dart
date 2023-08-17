part of 'sign_up_form_bloc.dart';

/// For now, this bloc state will only support keys and values of type [String].
sealed class SignUpFormState extends Equatable {
  const SignUpFormState({
    required final KeyValuePairEntity<String, String> keyValuePairEntity,
    final FailureEntity? failureEntity,
  })  : _keyValuePairEntity = keyValuePairEntity,
        _failureEntity = failureEntity;

  final KeyValuePairEntity<String, String> _keyValuePairEntity;
  final FailureEntity? _failureEntity;

  /// Getters.
  KeyValuePairEntity<String, String> get keyValuePairEntity =>
      _keyValuePairEntity;
  FailureEntity? get failureEntity => _failureEntity;
  String get key => _keyValuePairEntity.key;
  String get value => _keyValuePairEntity.value;

  /// Equality overwrite using the [Equatable] package.
  @override
  List<Object?> get props => [keyValuePairEntity, failureEntity];
}

final class SignUpFormInitial extends SignUpFormState {
  const SignUpFormInitial({
    super.keyValuePairEntity = const KeyValuePairEntity<String, String>(
      key: '',
      value: '',
    ),
  });
}

/// Load input data states.
final class SignUpFormLoadInputDataInProgress extends SignUpFormState {
  const SignUpFormLoadInputDataInProgress({required super.keyValuePairEntity});
}

final class SignUpFormLoadInputDataSuccess extends SignUpFormState {
  const SignUpFormLoadInputDataSuccess({required super.keyValuePairEntity});
}

final class SignUpFormLoadInputDataFailure extends SignUpFormState {
  const SignUpFormLoadInputDataFailure({
    required super.keyValuePairEntity,
    required super.failureEntity,
  });
}

/// Save input data states.
final class SignUpFormSaveDataInProgress extends SignUpFormState {
  const SignUpFormSaveDataInProgress({required super.keyValuePairEntity});
}

final class SignUpFormSaveDataSuccess extends SignUpFormState {
  const SignUpFormSaveDataSuccess({required super.keyValuePairEntity});
}

final class SignUpFormSaveDataFailure extends SignUpFormState {
  const SignUpFormSaveDataFailure({
    required super.keyValuePairEntity,
    required super.failureEntity,
  });
}
