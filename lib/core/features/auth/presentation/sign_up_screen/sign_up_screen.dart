import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/entities/up_residence_hall_entities.dart';
import '../../../../../constants/enums/username_status_enum.dart';
import '../../../../../utils/general_dialog_boxes.dart';
import '../../domain/entities/up_residence_hall_entity.dart';
import 'helpers/delivery_address_text_field_states.dart';
import 'helpers/sign_up_screen_step_state.dart';
import 'helpers/user_information_form_data.dart';
import 'sign_up_summary_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up-screen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          return GeneralDialogBoxes.showYesOrNoAlert(
            buildContext: context,
            title: 'Are You Sure?',
            contentMessage: 'Any progress made will be lost if you go back.',
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sign Up'),
          ),
          body: const SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SignUpFormStepper(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpFormStepper extends StatefulWidget {
  const SignUpFormStepper({super.key});

  @override
  State<SignUpFormStepper> createState() => _SignUpFormStepperState();
}

class _SignUpFormStepperState extends State<SignUpFormStepper> {
  late int _stepperIndex;
  late List<SignUpScreenStepState> _stepStates;
  late UserInformationFormData _userInformationFormData;

  // Step 1: User Information.
  late final GlobalKey<FormState> _userInformationFormKey;
  late UsernameStatusEnum _usernameStatusEnum;
  late Icon _usernameStatusIcon;
  late bool _wasDidChangeDependenciesAlreadyCalledOnce;

  // Step 2: Delivery Address.
  late final GlobalKey<FormState> _deliveryAddressFormKey;

  // Delivery Address controllers.
  late final TextEditingController _provinceTextController;
  late final TextEditingController _cityOrMunicipalityTextController;
  late final TextEditingController _barangayTextController;
  late final TextEditingController _streetAndBuildingNameTextController;

  late DeliveryAddressTextFieldStates _deliveryAddressTextFieldStates;

  // Step 3: Security Information.
  late final GlobalKey<FormState> _securityInformationFormKey;

  // Security Information controllers.
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();

    _stepperIndex = 0;
    _stepStates = <SignUpScreenStepState>[
      const SignUpScreenStepState(stepState: StepState.editing, isActive: true),
      const SignUpScreenStepState(),
      const SignUpScreenStepState(),
    ];
    _userInformationFormData = UserInformationFormData();

    // Step 1: User Information.
    _userInformationFormKey = GlobalKey<FormState>();
    _usernameStatusEnum = UsernameStatusEnum.unknown;
    _wasDidChangeDependenciesAlreadyCalledOnce = false;

    // Step 2: Delivery Address.
    _deliveryAddressFormKey = GlobalKey<FormState>();

    // Delivery Address controllers.
    _provinceTextController = TextEditingController();
    _cityOrMunicipalityTextController = TextEditingController();
    _barangayTextController = TextEditingController();
    _streetAndBuildingNameTextController = TextEditingController();

    _deliveryAddressTextFieldStates = const DeliveryAddressTextFieldStates();

    // Step 3: Security Information.
    _securityInformationFormKey = GlobalKey<FormState>();

    // Security Information controllers.
    _passwordTextController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_wasDidChangeDependenciesAlreadyCalledOnce) {
      _usernameStatusIcon = Icon(
        Icons.remove_circle_outline_rounded,
        color: Theme.of(context).colorScheme.secondary,
      );
    }
  }

  @override
  void dispose() {
    // Step 2. Delivery Address controllers.
    _provinceTextController.dispose();
    _cityOrMunicipalityTextController.dispose();
    _barangayTextController.dispose();
    _streetAndBuildingNameTextController.dispose();

    // Step 3. Security Information controllers.
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _stepperIndex,
      physics: const NeverScrollableScrollPhysics(),
      onStepContinue: () {
        late final bool isCurrentFormValid;
        late bool isCompleteOrErrorStepState;
        late StepState currentStepState;

        // Validate the corresponding form first.
        if (_stepperIndex == 0) {
          isCurrentFormValid =
              _userInformationFormKey.currentState?.validate() as bool;
        } else if (_stepperIndex == 1) {
          isCurrentFormValid =
              _deliveryAddressFormKey.currentState?.validate() as bool;
        } else if (_stepperIndex == 2) {
          isCurrentFormValid =
              _securityInformationFormKey.currentState?.validate() as bool;
        }

        // Update the current step's state and its isActive status.
        _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
          stepState: isCurrentFormValid ? StepState.complete : StepState.error,

          // Special case (User is in the last corresponding logical step).
          isActive: _stepperIndex == 2 ? true : false,
        );

        // Special case (User is in the last corresponding logical step).
        if (_stepperIndex == 2) {
          if (isCurrentFormValid) {
            // Show loading indicator.
            GeneralDialogBoxes.showLoadingSpinningCircle(
              buildContext: context,
            );

            // Simulate a 2-second delay.
            Future.delayed(const Duration(seconds: 2), () {
              // Remove the loading indicator.
              Navigator.of(context).pop();

              // Navigate to the Sign Up Summary Screen.
              GoRouter.of(context).push(SignUpSummaryScreen.routeName);
            });
          }
        } else {
          // Update the stepper index.
          _stepperIndex += 1;

          // Update the destination step's state and its isActive status.
          // Do not update if the destination step has already  a complete state
          // or an error state.
          currentStepState = _stepStates[_stepperIndex].stepState;
          isCompleteOrErrorStepState =
              (currentStepState == StepState.complete) ||
                  (currentStepState == StepState.error);

          _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
            stepState: isCompleteOrErrorStepState
                ? currentStepState
                : StepState.editing,
            isActive: true,
          );
        }

        // Rebuild.
        setState(() {});
      },
      onStepCancel: () async {
        late final bool isCurrentFormValid;
        late bool isCompleteOrErrorStepState;
        late StepState currentStepState;
        late final bool willCancelSignUpProcess;

        // Validate the corresponding form first.
        if (_stepperIndex == 0) {
          isCurrentFormValid =
              _userInformationFormKey.currentState?.validate() as bool;
        } else if (_stepperIndex == 1) {
          isCurrentFormValid =
              _deliveryAddressFormKey.currentState?.validate() as bool;
        } else if (_stepperIndex == 2) {
          isCurrentFormValid =
              _securityInformationFormKey.currentState?.validate() as bool;
        }

        // Update the current step's state and its isActive status.
        _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
          stepState: isCurrentFormValid ? StepState.complete : StepState.error,

          // Special case (User is in the last corresponding logical step).
          isActive: _stepperIndex == 0 ? true : false,
        );

        // Special case (User is in the last corresponding logical step).
        if (_stepperIndex == 0) {
          // Ask the user if they really want to cancel the sign up process.
          willCancelSignUpProcess = await GeneralDialogBoxes.showYesOrNoAlert(
            buildContext: context,
            title: 'Are You Sure?',
            contentMessage: 'Any progress made will be lost if you go back.',
          );

          // Go back to the login screen if the user wants to cancel the sign up process.
          if (willCancelSignUpProcess) {
            if (context.mounted) Navigator.of(context).pop();
          }
        } else {
          // Update the stepper index.
          _stepperIndex -= 1;

          // Update the destination step's state and its isActive status.
          // Do not update if the destination step has already  a complete state
          // or an error state.
          currentStepState = _stepStates[_stepperIndex].stepState;
          isCompleteOrErrorStepState =
              (currentStepState == StepState.complete) ||
                  (currentStepState == StepState.error);

          _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
            stepState: isCompleteOrErrorStepState
                ? currentStepState
                : StepState.editing,
            isActive: true,
          );
        }

        // Rebuild.
        setState(() {});
      },
      onStepTapped: (int index) {
        late final bool isCurrentFormValid;
        late bool isCompleteOrErrorStepState;
        late StepState currentStepState;

        // Validate the current form (step) first.
        if (_stepperIndex == 0) {
          isCurrentFormValid =
              _userInformationFormKey.currentState?.validate() as bool;
        } else if (_stepperIndex == 1) {
          isCurrentFormValid =
              _deliveryAddressFormKey.currentState?.validate() as bool;
        } else if (_stepperIndex == 2) {
          isCurrentFormValid =
              _securityInformationFormKey.currentState?.validate() as bool;
        }

        // Update the current step's state and its isActive status.
        _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
          stepState: isCurrentFormValid ? StepState.complete : StepState.error,
          isActive: false,
        );

        // Update the _stepperIndex to the tapped index.
        _stepperIndex = index;

        // Update the tapped (destination) step's state into an editing state.
        // Do not update if the tapped step is already complete or has an error.
        currentStepState = _stepStates[_stepperIndex].stepState;
        isCompleteOrErrorStepState = (currentStepState == StepState.complete) ||
            (currentStepState == StepState.error);

        _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
          stepState:
              isCompleteOrErrorStepState ? currentStepState : StepState.editing,
          isActive: true,
        );

        // Rebuild.
        setState(() {});
      },
      steps: <Step>[
        // User information.
        Step(
          title: const Text('User Information'),
          subtitle: const Text('This is to identify you correctly.'),
          state: _stepStates[0].stepState,
          isActive: _stepStates[0].isActive,
          content: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _userInformationFormKey,
                child: Column(
                  children: <Widget>[
                    // TODO: Implement add user display photo feature.

                    // Username and username status checker icon.
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Username.
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Username',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Username.';
                              }

                              return null;
                            },
                            onSaved: (String? newValue) {
                              // The [newValue] is guaranteed to be non-null because of the validator.
                              _userInformationFormData.username = newValue;
                            },
                          ),
                        ),
                        const SizedBox(width: 12.0),

                        // Username status checker icon.
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: _usernameStatusIcon,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),

                    // Horizontal divider.
                    const Divider(),
                    const SizedBox(height: 8.0),

                    // First name and Middle initial.
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // First name.
                        Expanded(
                          flex: 75,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'First Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your First Name.';
                              }

                              return null;
                            },
                            onSaved: (String? newValue) {
                              // The [newValue] is guaranteed to be non-null because of the validator.
                              _userInformationFormData.firstName = newValue;
                            },
                          ),
                        ),
                        const SizedBox(width: 12.0),

                        // Middle initial.
                        Expanded(
                          flex: 25,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'M.I.',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Middle Initial.';
                              }

                              return null;
                            },
                            onSaved: (String? newValue) {
                              // The [newValue] is guaranteed to be non-null because of the validator.
                              _userInformationFormData.middleInitial = newValue;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),

                    // Last name and suffix.
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Last name.
                        Expanded(
                          flex: 70,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Last Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Last Name.';
                              }

                              return null;
                            },
                            onSaved: (String? newValue) {
                              // The [newValue] is guaranteed to be non-null because of the validator.
                              _userInformationFormData.lastName = newValue;
                            },
                          ),
                        ),
                        const SizedBox(width: 12.0),

                        // Suffix.
                        Expanded(
                          flex: 30,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Suffix',
                            ),
                            onSaved: (String? newValue) {
                              _userInformationFormData.suffix = newValue;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Delivery address.
        Step(
          title: const Text('Delivery Address'),
          subtitle: const Text('Default address. Can be modified later.'),
          state: _stepStates[1].stepState,
          isActive: _stepStates[1].isActive,
          content: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _deliveryAddressFormKey,
                child: Column(
                  children: <Widget>[
                    DropdownButtonFormField<UpResidenceHallEntity>(
                      // hint: Text('Select a preset address'),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Preset Address',
                      ),
                      onChanged: (
                        UpResidenceHallEntity? upResidenceHallEntity,
                      ) {
                        // Typecast the [upResidenceHallEntity] variable to a non-nullable type since
                        // it will never be null due to the implementation of the [DropdownMenuItem]
                        // value properties (i.e., they are non-nullable by design).
                        upResidenceHallEntity as UpResidenceHallEntity;

                        // At the first instance that the user selected a [DropdownMenuItem],
                        // enable all the corresponding text fields.
                        //
                        // Note: There is no need to call for setState() here since it will be called
                        // later on in this method either way.
                        _deliveryAddressTextFieldStates =
                            _deliveryAddressTextFieldStates.copyWith(
                          province:
                              _deliveryAddressTextFieldStates.province.copyWith(
                            isEnabled: true,
                          ),
                          cityOrMunicipality: _deliveryAddressTextFieldStates
                              .cityOrMunicipality
                              .copyWith(
                            isEnabled: true,
                          ),
                          barangay:
                              _deliveryAddressTextFieldStates.barangay.copyWith(
                            isEnabled: true,
                          ),
                          streetAndBuildingName: _deliveryAddressTextFieldStates
                              .streetAndBuildingName
                              .copyWith(
                            isEnabled: true,
                          ),
                        );

                        if (upResidenceHallEntity.shortName ==
                            '[ Other UP RH ]') {
                          // Update the corresponding address fields. For now,
                          // only set the Street and Building Name field to an empty string.
                          _provinceTextController.text =
                              upResidenceHallEntity.province;
                          _cityOrMunicipalityTextController.text =
                              upResidenceHallEntity.cityOrMunicipality;
                          _barangayTextController.text =
                              upResidenceHallEntity.barangay;
                          _streetAndBuildingNameTextController.text = '';

                          // Set the corresponding address fields to not read-only mode.
                          // So that the user can input their own address.
                          _deliveryAddressTextFieldStates =
                              _deliveryAddressTextFieldStates.copyWith(
                            province: _deliveryAddressTextFieldStates.province
                                .copyWith(
                              isReadOnly: false,
                            ),
                            cityOrMunicipality: _deliveryAddressTextFieldStates
                                .cityOrMunicipality
                                .copyWith(
                              isReadOnly: false,
                            ),
                            barangay: _deliveryAddressTextFieldStates.barangay
                                .copyWith(
                              isReadOnly: false,
                            ),
                            streetAndBuildingName:
                                _deliveryAddressTextFieldStates
                                    .streetAndBuildingName
                                    .copyWith(
                              isReadOnly: false,
                            ),
                          );
                        } else {
                          // Update the corresponding address fields.
                          _provinceTextController.text =
                              upResidenceHallEntity.province;
                          _cityOrMunicipalityTextController.text =
                              upResidenceHallEntity.cityOrMunicipality;
                          _barangayTextController.text =
                              upResidenceHallEntity.barangay;
                          _streetAndBuildingNameTextController.text =
                              upResidenceHallEntity.streetAndBuildingName;

                          // Set the corresponding address fields to read-only mode.
                          _deliveryAddressTextFieldStates =
                              _deliveryAddressTextFieldStates.copyWith(
                            province: _deliveryAddressTextFieldStates.province
                                .copyWith(
                              isReadOnly: true,
                            ),
                            cityOrMunicipality: _deliveryAddressTextFieldStates
                                .cityOrMunicipality
                                .copyWith(
                              isReadOnly: true,
                            ),
                            barangay: _deliveryAddressTextFieldStates.barangay
                                .copyWith(
                              isReadOnly: true,
                            ),
                            streetAndBuildingName:
                                _deliveryAddressTextFieldStates
                                    .streetAndBuildingName
                                    .copyWith(
                              isReadOnly: true,
                            ),
                          );
                        }

                        // Rebuild.
                        setState(() {});
                      },
                      validator: (UpResidenceHallEntity? value) {
                        if (value == null) {
                          return 'Please select a preset address.';
                        }

                        return null;
                      },
                      items: const <DropdownMenuItem<UpResidenceHallEntity>>[
                        DropdownMenuItem(
                          value: UpResidenceHallEntities.ipilRH,
                          child: Text('Ipil RH'),
                        ),
                        DropdownMenuItem(
                          value: UpResidenceHallEntities.yakalRH,
                          child: Text('Yakal RH'),
                        ),
                        DropdownMenuItem(
                          value: UpResidenceHallEntities.kalayaanRH,
                          child: Text('Kalayaan RH'),
                        ),
                        DropdownMenuItem(
                          value: UpResidenceHallEntities.acaciaRH,
                          child: Text('Acacia RH'),
                        ),
                        DropdownMenuItem(
                          value: UpResidenceHallEntities.otherUpRH,
                          child: Text('Other Address'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),

                    // Horizontal divider.
                    const Divider(),
                    const SizedBox(height: 8.0),

                    // TODO: Implement address dropdown selection.

                    // Philippine province.
                    TextFormField(
                      controller: _provinceTextController,
                      readOnly:
                          _deliveryAddressTextFieldStates.province.isReadOnly,
                      enabled:
                          _deliveryAddressTextFieldStates.province.isEnabled,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Province',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value for Province.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Philippine city/municipality.
                    TextFormField(
                      controller: _cityOrMunicipalityTextController,
                      readOnly: _deliveryAddressTextFieldStates
                          .cityOrMunicipality.isReadOnly,
                      enabled: _deliveryAddressTextFieldStates
                          .cityOrMunicipality.isEnabled,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'City or Municipality',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value for City or Municipality.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Philippine barangay.
                    TextFormField(
                      controller: _barangayTextController,
                      readOnly:
                          _deliveryAddressTextFieldStates.barangay.isReadOnly,
                      enabled:
                          _deliveryAddressTextFieldStates.barangay.isEnabled,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Barangay',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value for Barangay.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Philippine street and building name.
                    TextFormField(
                      controller: _streetAndBuildingNameTextController,
                      readOnly: _deliveryAddressTextFieldStates
                          .streetAndBuildingName.isReadOnly,
                      enabled: _deliveryAddressTextFieldStates
                          .streetAndBuildingName.isEnabled,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Street and Building Name',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value for Street and Building Name.';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Security information.
        Step(
          title: const Text('Security Information'),
          subtitle: const Text('A way to secure your account.'),
          state: _stepStates[2].stepState,
          isActive: _stepStates[2].isActive,
          content: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _securityInformationFormKey,
                child: Column(
                  children: <Widget>[
                    // Email address.
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Email Address',
                      ),
                      validator: (String? value) {
                        // TODO: Implement a proper regex for email validation.

                        if (value == null || value.isEmpty) {
                          return 'Please enter a your Email Address.';
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid Email Address.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Phone number.
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Phone Number',
                      ),
                      validator: (String? value) {
                        // TODO: Implement a regex for phone number validation.

                        if (value == null || value.isEmpty) {
                          return 'Please enter a your Phone Number.';
                        } else if (value.length != 11) {
                          return 'Please enter a valid Phone Number.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),

                    // Horizontal divider.
                    const Divider(),
                    const SizedBox(height: 8.0),

                    // Password.
                    TextFormField(
                      controller: _passwordTextController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Password',
                      ),
                      validator: (String? value) {
                        // TODO: Implement a proper regex for password validation.

                        if (value == null || value.isEmpty) {
                          return 'Please enter a your Password.';
                        } else if (value.length < 8) {
                          return 'Must be at least 8 characters long.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Confirm password.
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Confirm Password',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please reenter your Password.';
                        } else if (_passwordTextController.text != value) {
                          return 'Passwords do not match.';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
