import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../entities/failure_entity.dart';
import '../../../../../../entities/key_value_pair_entity.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(const SignUpFormInitial()) {
    on<SignUpFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
