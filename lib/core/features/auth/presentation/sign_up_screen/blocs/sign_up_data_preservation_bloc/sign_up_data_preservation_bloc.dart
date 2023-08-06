import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_data_preservation_event.dart';
part 'sign_up_data_preservation_state.dart';

class SignUpDataPreservationBloc
    extends Bloc<SignUpDataPreservationEvent, SignUpDataPreservationState> {
  SignUpDataPreservationBloc() : super(SignUpDataPreservationInitial()) {
    on<SignUpDataPreservationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
