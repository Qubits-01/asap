import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/entities/up_residence_hall_entities.dart';
import '../../../../../constants/enums/username_status_enum.dart';
import '../../../../../utils/loading_indicators_util.dart';
import '../../domain/entities/up_residence_hall_entity.dart';
import 'helpers/sign_up_screen_step_state.dart';
import 'helpers/user_information_form_data.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up-screen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SignUpFormStepper(),
            ],
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

  late Map<String, bool> _isReadOnlyTextFields;
  late Map<String, bool> _isEnabledTextFields;

  // Step 3: Security Information.
  late final GlobalKey<FormState> _securityInformationFormKey;

  // Security Information controllers.
  late final TextEditingController _phoneNumberTextController;
  late final TextEditingController _emailAddressTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _confirmPasswordTextController;

  late bool _isPhoneNumberVerified;
  late bool _isEmailAddressVerified;

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

    _isReadOnlyTextFields = {
      'Province': false,
      'City or Municipality': false,
      'Barangay': false,
      'Street and Building Name': false,
    };
    _isEnabledTextFields = {
      'Province': false,
      'City or Municipality': false,
      'Barangay': false,
      'Street and Building Name': false,
    };

    // Step 3: Security Information.
    _securityInformationFormKey = GlobalKey<FormState>();

    // Security Information controllers.
    _phoneNumberTextController = TextEditingController();
    _emailAddressTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();

    _isPhoneNumberVerified = false;
    _isEmailAddressVerified = false;
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
    _phoneNumberTextController.dispose();
    _emailAddressTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _stepperIndex,
      onStepContinue: () {
        final int prevStepperIndex = _stepperIndex;
        late final bool isCurrentFormValid;
        late bool isCompleteOrErrorStepState;
        late StepState currentStepState;

        switch (_stepperIndex) {
          // User Information.
          case 0:
            {
              // Validate the corresponding form first.
              isCurrentFormValid =
                  _userInformationFormKey.currentState?.validate() as bool;

              if (isCurrentFormValid) {
                // // Save the User Information form data (for later user - sign up submission).
                // _userInformationFormKey.currentState?.save();

                // Update the current stepper state to a complete state.
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.complete,
                  isActive: false,
                );
              } else {
                // Update the current stepper state to an error state.
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.error,
                  isActive: false,
                );
              }

              // Update the previous active step.
              // Do not update if the previous step is already complete or has an error.
              currentStepState = _stepStates[_stepperIndex].stepState;
              isCompleteOrErrorStepState =
                  (currentStepState == StepState.complete) ||
                      (currentStepState == StepState.error);

              if (!isCompleteOrErrorStepState) {
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.indexed,
                  isActive: false,
                );
              }

              // Update the current active stepper index.
              _stepperIndex += 1;

              // Update the current active step.
              // Do not update if the previous step is already complete or has an error.
              currentStepState = _stepStates[_stepperIndex].stepState;
              isCompleteOrErrorStepState =
                  (currentStepState == StepState.complete) ||
                      (currentStepState == StepState.error);

              if (!isCompleteOrErrorStepState) {
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.editing,
                  isActive: true,
                );
              }

              break;
            }

          // Delivery Address.
          case 1:
            {
              // Validate the corresponding form first.
              isCurrentFormValid =
                  _deliveryAddressFormKey.currentState?.validate() as bool;

              if (isCurrentFormValid) {
                // Update the current stepper state to a complete state.
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.complete,
                  isActive: false,
                );
              } else {
                // Update the current stepper state to an error state.
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.error,
                  isActive: false,
                );
              }

              // Update the previous active step.
              // Do not update if the previous step is already complete or has an error.
              currentStepState = _stepStates[_stepperIndex].stepState;
              isCompleteOrErrorStepState =
                  (currentStepState == StepState.complete) ||
                      (currentStepState == StepState.error);

              if (!isCompleteOrErrorStepState) {
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.indexed,
                  isActive: false,
                );
              }

              // Update the current active stepper index.
              _stepperIndex += 1;

              // Update the current active step.
              // Do not update if the previous step is already complete or has an error.
              currentStepState = _stepStates[_stepperIndex].stepState;
              isCompleteOrErrorStepState =
                  (currentStepState == StepState.complete) ||
                      (currentStepState == StepState.error);

              if (!isCompleteOrErrorStepState) {
                _stepStates[_stepperIndex] =
                    _stepStates[_stepperIndex].copyWith(
                  stepState: StepState.editing,
                  isActive: true,
                );
              }

              break;
            }

          // Security Information.
          case 2:
            {
              // validate the corresponding form first.

              // Show loading indicator.
              LoadingIndicatorsUtil.showSpinningCircleOnDialogBox(
                buildContext: context,
              );

              // Simulate a 2-second delay.
              Future.delayed(const Duration(seconds: 2), () {
                // Remove the loading indicator.
                Navigator.of(context).pop();
              });

              break;
            }

          // This will never be reached. Just in case that there will be
          // an unwanted bit flips due to cosmic rays or any other rare phenomenons.
          default:
            {
              // TODO: Implement an error dialog (to inform the user).
              break;
            }
        }

        // Rebuild.
        setState(() {});
      },
      onStepCancel: () {
        setState(() {
          if (_stepperIndex == 0) {
            GoRouter.of(context).pop();
          } else if (_stepperIndex > 0) {
            final int prevStepperIndex = _stepperIndex;

            // Update the current active stepper index.
            _stepperIndex -= 1;

            // Update the previous active step.
            _stepStates[prevStepperIndex] =
                _stepStates[prevStepperIndex].copyWith(
              stepState: StepState.indexed,
              isActive: false,
            );

            // Update the current active step.
            _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
              stepState: StepState.editing,
              isActive: true,
            );
          }
        });
      },
      onStepTapped: (int index) {
        setState(() {
          final int prevStepperIndex = _stepperIndex;

          // Update the current active stepper index.
          _stepperIndex = index;

          // Update the previous active step.
          _stepStates[prevStepperIndex] =
              _stepStates[prevStepperIndex].copyWith(
            stepState: StepState.indexed,
            isActive: false,
          );

          // Update the current active step.
          _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
            stepState: StepState.editing,
            isActive: true,
          );
        });

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
                      onChanged:
                          (UpResidenceHallEntity? upResidenceHallEntity) {
                        // Typecast the [upResidenceHallEntity] variable to a non-nullable type since
                        // it will never be null due to the implementation of the [DropdownMenuItem]
                        // value properties (i.e., they are non-nullable by design).
                        upResidenceHallEntity as UpResidenceHallEntity;

                        // At the first instance that the user selected a [DropdownMenuItem],
                        // enable all the corresponding text fields.
                        //
                        // Note: There is no need to call for setState() here since it will be called
                        // later on in this method either way.
                        _isEnabledTextFields.forEach((key, bool value) {
                          _isEnabledTextFields[key] = true;
                        });

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
                          _isReadOnlyTextFields.forEach((key, bool value) {
                            _isReadOnlyTextFields[key] = false;
                          });
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
                          _isReadOnlyTextFields.forEach((key, bool value) {
                            _isReadOnlyTextFields[key] = true;
                          });
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
                      readOnly: _isReadOnlyTextFields['Province'] as bool,
                      enabled: _isEnabledTextFields['Province'],
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
                      readOnly:
                          _isReadOnlyTextFields['City or Municipality'] as bool,
                      enabled: _isEnabledTextFields['City or Municipality'],
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
                      readOnly: _isReadOnlyTextFields['Barangay'] as bool,
                      enabled: _isEnabledTextFields['Barangay'],
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
                      readOnly:
                          _isReadOnlyTextFields['Street and Building Name']
                              as bool,
                      enabled: _isEnabledTextFields['Street and Building Name'],
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
                child: Column(
                  children: <Widget>[
                    // Phone number and verification status indicator.
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Username.
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Phone Number',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a your Phone Number.';
                              } else if (value.length != 11) {
                                return 'Please enter a valid Phone Number.';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12.0),

                        // Username status checker icon.
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: _isPhoneNumberVerified
                              ? const Tooltip(
                                  message: 'Phone number is verified.',
                                  child: Icon(
                                    Icons.info_outline_rounded,
                                    color: Colors.green,
                                  ),
                                )
                              : const Tooltip(
                                  message: 'Phone number is not yet verified.',
                                  child: Icon(Icons.info_outline_rounded),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Send Verification Code button (for phone number).
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonalIcon(
                        onPressed: () {},
                        icon: const Icon(Icons.sms_outlined),
                        label: const Text('Send Verification Code (SMS)'),
                      ),
                    ),

                    Visibility(
                      visible: true,
                      child: Column(
                        children: <Widget>[
                          // Vertical spacing from the button above.
                          const SizedBox(height: 12.0),

                          // Verification code guiding message.
                          Text(
                            'A verification code was sent to 09369072458. '
                            'Please enter the code below to verify your phone number.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 12.0),

                          // Resend verification code guiding message.
                          Text(
                            'Did not receive the code? '
                            'You can send another code in 42 seconds.',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                          const SizedBox(height: 12.0),

                          // Confirm verification code.
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Verification Code (SMS)',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a your Email Address.';
                              } else if (!value.contains('@')) {
                                return 'Please enter a valid Email Address.';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 12.0),

                          // Confirm Verification Code button (for phone number).
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton.tonal(
                              onPressed: () {},
                              child: const Text('Confirm Verification Code'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4.0),

                    // Horizontal divider.
                    const Divider(),
                    const SizedBox(height: 8.0),

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
                        if (value == null || value.isEmpty) {
                          return 'Please enter a your Email Address.';
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid Email Address.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Password.
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Password',
                      ),
                      validator: (String? value) {
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
