part of 'sign_up_data_preservation_bloc.dart';

sealed class SignUpDataPreservationState extends Equatable {
  const SignUpDataPreservationState();
  
  @override
  List<Object> get props => [];
}

final class SignUpDataPreservationInitial extends SignUpDataPreservationState {}
