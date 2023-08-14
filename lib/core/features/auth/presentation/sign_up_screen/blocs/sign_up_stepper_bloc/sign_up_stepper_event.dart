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
  const SignUpStepperStepTapped({required int newIndex}) : _newIndex = newIndex;

  final int _newIndex;

  // Getters.
  int get newIndex => _newIndex;

  /// Prerequisite setup for the [Equatable] package.
  @override
  List<Object> get props => [newIndex];
}
