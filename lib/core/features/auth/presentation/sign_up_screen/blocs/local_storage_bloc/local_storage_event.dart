part of 'local_storage_bloc.dart';

sealed class LocalStorageEvent extends Equatable {
  const LocalStorageEvent();

  @override
  List<Object> get props => [];
}

final class LocalStorageStarted extends LocalStorageEvent {
  const LocalStorageStarted();
}
