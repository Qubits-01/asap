import 'package:flutter/material.dart';

import '../helpers/sign_up_screen_step_state.dart';
import 'forms/delivery_address_form.dart';
import 'forms/security_information_form.dart';
import 'forms/user_information_form.dart';
import 'stepper_callbacks/on_step_cancel.dart';
import 'stepper_callbacks/on_step_continue.dart';
import 'stepper_callbacks/on_step_tapped.dart';

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
  late List<SignUpScreenStepState> _stepStates;

  // Form keys.
  late final GlobalKey<FormState> _userInformationFormKey;
  late final GlobalKey<FormState> _deliveryAddressFormKey;
  late final GlobalKey<FormState> _securityInformationFormKey;

  // OnStep callbacks for the [Stepper] widget.
  late OnStepContinue _onStepContinue;
  late OnStepCancel _onStepCancel;
  late OnStepTapped _onStepTapped;

  @override
  void initState() {
    super.initState();

    _stepperIndex = [0];
    _stepStates = <SignUpScreenStepState>[
      const SignUpScreenStepState(stepState: StepState.editing, isActive: true),
      const SignUpScreenStepState(),
      const SignUpScreenStepState(),
    ];

    // Form keys.
    _userInformationFormKey = GlobalKey<FormState>();
    _deliveryAddressFormKey = GlobalKey<FormState>();
    _securityInformationFormKey = GlobalKey<FormState>();

    // OnStep callbacks for the [Stepper] widget.
    _onStepContinue = const OnStepContinue();
    _onStepCancel = const OnStepCancel();
    _onStepTapped = const OnStepTapped();
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _stepperIndex[0],
      physics: const NeverScrollableScrollPhysics(),
      onStepContinue: () {
        _onStepContinue(
          buildContext: context,
          stepperIndex: _stepperIndex,
          formKeys: <GlobalKey<FormState>>[
            _userInformationFormKey,
            _deliveryAddressFormKey,
            _securityInformationFormKey,
          ],
          stepStates: _stepStates,
          setState: () => setState(() {}),
        );
      },
      onStepCancel: () {
        _onStepCancel(
          buildContext: context,
          stepperIndex: _stepperIndex,
          formKeys: <GlobalKey<FormState>>[
            _userInformationFormKey,
            _deliveryAddressFormKey,
            _securityInformationFormKey,
          ],
          stepStates: _stepStates,
          setState: () => setState(() {}),
        );
      },
      onStepTapped: (int index) {
        _onStepTapped(
          stepperIndex: _stepperIndex,
          newIndex: index,
          formKeys: <GlobalKey<FormState>>[
            _userInformationFormKey,
            _deliveryAddressFormKey,
            _securityInformationFormKey,
          ],
          stepStates: _stepStates,
          setState: () => setState(() {}),
        );
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
              child: UserInformationForm(
                userInformationFormKey: _userInformationFormKey,
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
              child: DeliveryAddressForm(
                deliveryAddressFormKey: _deliveryAddressFormKey,
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
              child: SecurityInformationForm(
                securityInformationFormKey: _securityInformationFormKey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
