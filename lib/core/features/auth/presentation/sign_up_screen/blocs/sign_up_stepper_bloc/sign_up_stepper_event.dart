part of 'sign_up_stepper_bloc.dart';

sealed class SignUpStepperEvent extends Equatable {
  const SignUpStepperEvent();

  @override
  List<Object> get props => [];
}

final class SignUpStepperStarted extends SignUpStepperEvent {
  const SignUpStepperStarted();
}

final class SignUpStepperStepContinued extends SignUpStepperEvent {
  const SignUpStepperStepContinued({
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  // Getters.
  int get currentIndex => _currentIndex;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [currentIndex];
}

final class SignUpStepperStepCanceled extends SignUpStepperEvent {
  const SignUpStepperStepCanceled({
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  // Getters.
  int get currentIndex => _currentIndex;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [currentIndex];
}

final class SignUpStepperStepTapped extends SignUpStepperEvent {
  const SignUpStepperStepTapped({
    required SignUpStepperWidgetState signUpStepperWidgetState,
    required int newIndex,
    required List<GlobalKey<FormState>> formKeys,
  })  : _signUpStepperWidgetState = signUpStepperWidgetState,
        _newIndex = newIndex,
        _formKeys = formKeys;

  final SignUpStepperWidgetState _signUpStepperWidgetState;
  final int _newIndex;
  final List<GlobalKey<FormState>> _formKeys;

  // Getters.
  int get newIndex => _newIndex;
  SignUpStepperWidgetState get signUpStepperWidgetState =>
      _signUpStepperWidgetState;
  List<GlobalKey<FormState>> get formKeys => _formKeys;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [signUpStepperWidgetState, newIndex, formKeys];
}
