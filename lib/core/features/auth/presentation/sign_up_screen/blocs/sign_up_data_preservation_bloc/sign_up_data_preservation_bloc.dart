import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_data_preservation_event.dart';
part 'sign_up_data_preservation_state.dart';

class SignUpDataPreservationBloc extends Bloc<SignUpDataPreservationEvent, SignUpDataPreservationState> {
  SignUpDataPreservationBloc() : super(SignUpDataPreservationInitial()) {
    on<SignUpDataPreservationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
