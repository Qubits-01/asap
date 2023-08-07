import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../utils/local_storage/domain/repository_interfaces/local_storage_repo_intf.dart';
import '../../../../../../../utils/local_storage/domain/use_cases/save_data_use_case/params.dart';
import '../../../../../../../utils/local_storage/domain/use_cases/save_data_use_case/save_data_use_case.dart';
import '../../../../../../exception_handling/failures/local_storage_failure.dart';

part 'sign_up_data_preservation_event.dart';
part 'sign_up_data_preservation_state.dart';

class SignUpDataPreservationBloc
    extends Bloc<SignUpDataPreservationEvent, SignUpDataPreservationState> {
  final LocalStorageRepoIntf _localStorageRepo;

  SignUpDataPreservationBloc({
    required localStorageRepo,
  })  : _localStorageRepo = localStorageRepo,
        super(const SignUpDataPreservationInitial()) {
    on<SignUpDataPreservationStarted>((event, emit) {
      print('SignUpDataPreservationStarted');
    });

    on<SignUpDataPreservationFormSaved>((event, emit) async {
      print('SignUpDataPreservationFormSaved');

      late final SaveDataUseCase saveDataUseCase;
      late final Either<LocalStorageFailure, void> eitherSaveData;

      saveDataUseCase = GetIt.I<SaveDataUseCase>();

      emit(const SignUpDataPreservationInProgress());

      eitherSaveData = await saveDataUseCase(
        Params(key: event.key, value: event.value),
      );

      eitherSaveData.fold((LocalStorageFailure left) {
        emit(SignUpDataPreservationFailure(
          errorTitle: left.title,
          errorMessage: left.message,
        ));
      }, (void right) {
        print('Success');
        emit(const SignUpDataPreservationSuccess());
      });
    });
  }
}
