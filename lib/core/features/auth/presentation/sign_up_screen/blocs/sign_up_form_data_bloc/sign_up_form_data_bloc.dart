import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../service_locator/service_locator.dart';
import '../../../../../../../utils/local_storage/domain/repository_interfaces/local_storage_repo_intf.dart';
import '../../../../../../../utils/local_storage/domain/use_cases/save_data_use_case/params.dart';
import '../../../../../../../utils/local_storage/domain/use_cases/save_data_use_case/save_data_use_case.dart';
import '../../../../../../exception_handling/failures/local_storage_failure.dart';

part 'sign_up_data_preservation_event.dart';
part 'sign_up_data_preservation_state.dart';

class SignUpFormDataBloc
    extends Bloc<SignUpFormDataEvent, SignUpFormDataState> {
  final LocalStorageRepoIntf _localStorageRepo;

  SignUpFormDataBloc({
    required localStorageRepo,
  })  : _localStorageRepo = localStorageRepo,
        super(const SignUpFormDataInitial()) {
    on<SignUpFormDataStarted>((event, emit) {});

    on<SignUpFormDataInputSaved>((event, emit) async {
      late final SaveDataUseCase saveDataUseCase;
      late final Either<LocalStorageFailure, void> eitherSaveData;

      saveDataUseCase = sl<SaveDataUseCase>();

      emit(const SignUpFormDataSavingInProgress());

      eitherSaveData = await saveDataUseCase(
        Params(key: event.key, value: event.value),
      );

      eitherSaveData.fold((LocalStorageFailure left) {
        print('Failure');

        emit(SignUpFormDataSavingFailure(
          errorTitle: left.title,
          errorMessage: left.message,
        ));
      }, (void right) {
        print('Success');
        emit(const SignUpFormDataSavingSuccess());
      });
    });
  }
}
