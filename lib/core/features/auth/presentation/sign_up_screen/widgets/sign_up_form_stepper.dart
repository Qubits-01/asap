import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../service_locator/service_locator.dart';
import '../../../../../../utils/local_storage/domain/repository_interfaces/local_storage_repo_intf.dart';
import '../../../domain/entities/sign_up_stepper_entity.dart';
import '../blocs/sign_up_form_data_bloc/sign_up_form_data_bloc.dart';
import '../blocs/sign_up_form_dropdown_bloc/sign_up_form_dropdown_bloc.dart';
import '../blocs/sign_up_stepper_bloc/sign_up_stepper_bloc.dart';
import 'forms/address_information_form.dart';
import 'forms/security_information_form.dart';
import 'forms/user_information_form.dart';

class SignUpFormStepper extends StatefulWidget {
  const SignUpFormStepper({super.key});

  @override
  State<SignUpFormStepper> createState() => _SignUpFormStepperState();
}

class _SignUpFormStepperState extends State<SignUpFormStepper> {
  // The [stepperIndex] variable is a list of integer because it is needed
  // to be passed by reference (especially useful when refactoring the code
  // in the onStep callbacks of the Stepper widget).
  late List<int> _stepperIndex;

  // Form keys.
  late final GlobalKey<FormState> _userInformationFormKey;
  late final GlobalKey<FormState> _addressInformationFormKey;
  late final GlobalKey<FormState> _securityInformationFormKey;

  // Step 2: Address Information.
  // Address Information controllers.
  late final TextEditingController _provinceTextController;
  late final TextEditingController _cityOrMunicipalityTextController;
  late final TextEditingController _barangayTextController;
  late final TextEditingController _streetAndBuildingNameTextController;

  @override
  void initState() {
    super.initState();

    _stepperIndex = [0];

    // Form keys.
    _userInformationFormKey = GlobalKey<FormState>();
    _addressInformationFormKey = GlobalKey<FormState>();
    _securityInformationFormKey = GlobalKey<FormState>();

    // Step 2: Address Information.
    // Address Information controllers.
    _provinceTextController = TextEditingController();
    _cityOrMunicipalityTextController = TextEditingController();
    _barangayTextController = TextEditingController();
    _streetAndBuildingNameTextController = TextEditingController();
  }

  @override
  void dispose() {
    // Step 2: Address Information.
    // Address Information controllers.
    _provinceTextController.dispose();
    _cityOrMunicipalityTextController.dispose();
    _barangayTextController.dispose();
    _streetAndBuildingNameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<SignUpStepperBloc>(
          create: (_) {
            return SignUpStepperBloc(
              formKeys: <GlobalKey<FormState>>[
                _userInformationFormKey,
                _addressInformationFormKey,
                _securityInformationFormKey,
              ],
            );
          },
        ),
        BlocProvider<SignUpFormDropdownBloc>(create: (_) {
          return SignUpFormDropdownBloc(
            addressInformationFormKey: _addressInformationFormKey,
            provinceTextController: _provinceTextController,
            cityOrMunicipalityTextController: _cityOrMunicipalityTextController,
            barangayTextController: _barangayTextController,
            streetAndBuildingNameTextController:
                _streetAndBuildingNameTextController,
          );
        }),
        BlocProvider<SignUpFormDataBloc>(create: (_) {
          return SignUpFormDataBloc(
            localStorageRepo: sl<LocalStorageRepoIntf>(),
          );
        }),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final signUpStepperBloc = context.watch<SignUpStepperBloc>();
          final signUpFormDataBloc = context.watch<SignUpFormDataBloc>();
          final SignUpStepperEntity signUpStepperEntity =
              signUpStepperBloc.state.signUpStepperEntity;

          return Stepper(
            currentStep: signUpStepperEntity.currentIndex,
            physics: const NeverScrollableScrollPhysics(),
            onStepContinue: () {
              signUpStepperBloc.add(const SignUpStepperStepContinued());
            },
            onStepCancel: () {
              signUpStepperBloc.add(const SignUpStepperStepCanceled());
            },
            onStepTapped: (int index) {
              signUpStepperBloc.add(SignUpStepperStepTapped(newIndex: index));
            },
            steps: <Step>[
              // User information.
              Step(
                title: const Text('User Information'),
                subtitle: const Text('This is to identify you correctly.'),
                state: signUpStepperEntity.userInformationStepState,
                isActive: signUpStepperEntity.isUserInformationStepActive,
                content: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: UserInformationForm(
                      userInformationFormKey: _userInformationFormKey,
                    ),
                  ),
                ),
              ),

              // Delivery address.
              Step(
                title: const Text('Address Information'),
                subtitle: const Text('Default address. Can be modified later.'),
                state: signUpStepperEntity.addressInformationStepState,
                isActive: signUpStepperEntity.isAddressInformationStepActive,
                content: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: AddressInformationForm(),
                  ),
                ),
              ),

              // Security information.
              Step(
                title: const Text('Security Information'),
                subtitle: const Text('A way to secure your account.'),
                state: signUpStepperEntity.securityInformationStepState,
                isActive: signUpStepperEntity.isSecurityInformationStepActive,
                content: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SecurityInformationForm(
                      securityInformationFormKey: _securityInformationFormKey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
