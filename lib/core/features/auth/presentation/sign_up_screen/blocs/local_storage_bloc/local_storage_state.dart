part of 'local_storage_bloc.dart';

abstract class LocalStorageState extends Equatable {
  const LocalStorageState();
  
  @override
  List<Object> get props => [];
}

class LocalStorageInitial extends LocalStorageState {}
