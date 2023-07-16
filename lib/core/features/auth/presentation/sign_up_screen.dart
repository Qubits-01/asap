import '../../../../constants/entities/up_residence_hall_entities.dart';
import '../domain/entities/up_residence_hall_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  late List<_StepState> _stepStates;

  // Step 2: Delivery Address.
  // Delivery Address controllers.
  late final TextEditingController _provinceTextController;
  late final TextEditingController _cityOrMunicipalityTextController;
  late final TextEditingController _barangayTextController;
  late final TextEditingController _streetAndBuildingNameTextController;

  late Map<String, bool> _isReadOnlyTextFields;
  late Map<String, bool> _isEnabledTextFields;

  @override
  void initState() {
    super.initState();

    _stepperIndex = 0;
    _stepStates = <_StepState>[
      const _StepState(stepState: StepState.editing, isActive: true),
      const _StepState(),
      const _StepState(),
    ];

    // Step 2: Delivery Address.
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
  }

  @override
  void dispose() {
    // Delivery Address controllers.
    _provinceTextController.dispose();
    _cityOrMunicipalityTextController.dispose();
    _barangayTextController.dispose();
    _streetAndBuildingNameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _stepperIndex,
      onStepContinue: () {
        setState(() {
          if (_stepperIndex == 2) {
            // Show loading indicator.
            _showLoadingIndicator(buildContext: context);

            // Simulate a 2-second delay.
            Future.delayed(const Duration(seconds: 2), () {
              // Remove the loading indicator.
              Navigator.of(context).pop();
            });
          } else if (_stepperIndex < 2) {
            final int prevStepperIndex = _stepperIndex;

            // Update the current active stepper index.
            _stepperIndex += 1;

            // Update the current active step.
            _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
              stepState: StepState.editing,
              isActive: true,
            );

            // Update the previous active step.
            _stepStates[prevStepperIndex] =
                _stepStates[prevStepperIndex].copyWith(
              stepState: StepState.indexed,
              isActive: false,
            );
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (_stepperIndex == 0) {
            GoRouter.of(context).pop();
          } else if (_stepperIndex > 0) {
            final int prevStepperIndex = _stepperIndex;

            // Update the current active stepper index.
            _stepperIndex -= 1;

            // Update the current active step.
            _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
              stepState: StepState.editing,
              isActive: true,
            );

            // Update the previous active step.
            _stepStates[prevStepperIndex] =
                _stepStates[prevStepperIndex].copyWith(
              stepState: StepState.indexed,
              isActive: false,
            );
          }
        });
      },
      onStepTapped: (int index) {
        setState(() {
          final int prevStepperIndex = _stepperIndex;

          // Update the current active stepper index.
          _stepperIndex = index;

          // Update the current active step.
          _stepStates[_stepperIndex] = _stepStates[_stepperIndex].copyWith(
            stepState: StepState.editing,
            isActive: true,
          );

          // Update the previous active step.
          _stepStates[prevStepperIndex] =
              _stepStates[prevStepperIndex].copyWith(
            stepState: StepState.indexed,
            isActive: false,
          );
        });
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
              child: Column(
                children: <Widget>[
                  // TODO: Implement add user display photo feature.

                  // Username and username status checker.
                  Row(
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
                        ),
                      ),
                      const SizedBox(width: 12.0),

                      // Username status checker.
                      const Icon(Icons.verified_rounded),
                    ],
                  ),
                  const SizedBox(height: 8.0),

                  // Horizontal divider.
                  const Divider(),
                  const SizedBox(height: 8.0),

                  // First name and Middle initial.
                  Row(
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Last name and suffix.
                  Row(
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
                        ),
                      ),
                    ],
                  ),
                ],
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
              child: Column(
                children: <Widget>[
                  DropdownButtonFormField<UpResidenceHallEntity>(
                    //hint: Text('Select a preset address'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Preset Address',
                    ),
                    onChanged: (UpResidenceHallEntity? upResidenceHallEntity) {
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
                        // Update the corresponding address fields (set to an empty string).
                        _provinceTextController.text = '';
                        _cityOrMunicipalityTextController.text = '';
                        _barangayTextController.text = '';
                        _streetAndBuildingNameTextController.text = '';

                        setState(() {
                          // Set the corresponding address fields to not read-only mode.
                          // So that the user can input their own address.
                          _isReadOnlyTextFields.forEach((key, bool value) {
                            _isReadOnlyTextFields[key] = false;
                          });
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
                        setState(() {
                          _isReadOnlyTextFields.forEach((key, bool value) {
                            _isReadOnlyTextFields[key] = true;
                          });
                        });
                      }
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
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Province',
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Philippine city/municipality.
                  TextFormField(
                    controller: _cityOrMunicipalityTextController,
                    readOnly:
                        _isReadOnlyTextFields['City or Municipality'] as bool,
                    enabled: _isEnabledTextFields['City or Municipality'],
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'City or Municipality',
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Philippine barangay.
                  TextFormField(
                    controller: _barangayTextController,
                    readOnly: _isReadOnlyTextFields['Barangay'] as bool,
                    enabled: _isEnabledTextFields['Barangay'],
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Barangay',
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Philippine street and building name.
                  TextFormField(
                    controller: _streetAndBuildingNameTextController,
                    readOnly: _isReadOnlyTextFields['Street and Building Name']
                        as bool,
                    enabled: _isEnabledTextFields['Street and Building Name'],
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Street and Building Name',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Contact information.
        Step(
          title: const Text('Contact Information'),
          subtitle: const Text('A way to verify your identity.'),
          content: const Text('Step 1 content'),
          state: _stepStates[2].stepState,
          isActive: _stepStates[2].isActive,
        ),
      ],
    );
  }

  Future<void> _showLoadingIndicator({required BuildContext buildContext}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator.adaptive(),
                SizedBox(height: 12.0),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StepState extends Equatable {
  const _StepState({
    this.stepState = StepState.indexed,
    this.isActive = false,
  });

  final StepState stepState;
  final bool isActive;

  @override
  List<Object?> get props => [
        stepState,
        isActive,
      ];

  _StepState copyWith({
    StepState? stepState,
    bool? isActive,
  }) {
    return _StepState(
      stepState: stepState ?? this.stepState,
      isActive: isActive ?? this.isActive,
    );
  }
}
