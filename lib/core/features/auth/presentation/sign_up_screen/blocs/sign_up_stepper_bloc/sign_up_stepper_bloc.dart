import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../entities/failure_entity.dart';
import '../../../../domain/entities/sign_up_stepper_entity.dart';

part 'event_handlers/on_sign_up_stepper_step_canceled_event_handler.dart';
part 'event_handlers/on_sign_up_stepper_step_continued_event_handler.dart';
part 'event_handlers/on_sign_up_stepper_step_tapped_event_handler.dart';
part 'sign_up_stepper_event.dart';
part 'sign_up_stepper_state.dart';

class SignUpStepperBloc extends Bloc<SignUpStepperEvent, SignUpStepperState> {
  SignUpStepperBloc({required List<GlobalKey<FormState>> formKeys})
      : _formKeys = formKeys,
        super(const SignUpStepperInitial()) {
    _registerEventHandlers();
  }

  final List<GlobalKey<FormState>> _formKeys;

  void _registerEventHandlers() {
    on<SignUpStepperStarted>((event, emit) {
      /// [ Step 1 ]
      /// Emit the initial state of the [Stepper] widget.
      emit(const SignUpStepperInitial());
    });

    on<SignUpStepperStepContinued>((event, emit) {
      onSignUpStepperStepContinuedEventHandler(
        event: event,
        emit: emit,
        state: state,
        formKeys: _formKeys,
      );
    });

    on<SignUpStepperStepCanceled>((event, emit) {
      onSignUpStepperStepCanceledEventHandler(
        event: event,
        emit: emit,
        state: state,
        formKeys: _formKeys,
      );
    });

    on<SignUpStepperStepTapped>((event, emit) {
      onSignUpStepperStepTappedEventHandler(
        event: event,
        emit: emit,
        state: state,
        formKeys: _formKeys,
      );
    });
  }
}
