import 'package:flutter/material.dart';

import '../../../../../constants/enums/username_status_enum.dart';
import '../../../../../utils/general_dialog_boxes.dart';
import 'helpers/sign_up_screen_step_state.dart';
import 'helpers/user_information_form_data.dart';
import 'widgets/delivery_address_form.dart';
import 'widgets/stepper_callbacks/on_step_cancel.dart';
import 'widgets/stepper_callbacks/on_step_continue.dart';
import 'widgets/stepper_callbacks/on_step_tapped.dart';

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
  // The [stepperIndex] variable is a list of integer because it is needed
  // to be passed by reference (especially useful when refactoring the code
  // in the onStep callbacks of the Stepper widget).
  late List<int> _stepperIndex;
  late List<SignUpScreenStepState> _stepStates;
  late UserInformationFormData _userInformationFormData;

  // Step 1: User Information.
  late final GlobalKey<FormState> _userInformationFormKey;
  late UsernameStatusEnum _usernameStatusEnum;
  late Icon _usernameStatusIcon;
  late bool _wasDidChangeDependenciesAlreadyCalledOnce;

  // Step 2: Delivery Address.
  late final GlobalKey<FormState> _deliveryAddressFormKey;

  // Step 3: Security Information.
  late final GlobalKey<FormState> _securityInformationFormKey;

  // Security Information controllers.
  late final TextEditingController _passwordTextController;

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
    _userInformationFormData = UserInformationFormData();

    // Step 1: User Information.
    _userInformationFormKey = GlobalKey<FormState>();
    _usernameStatusEnum = UsernameStatusEnum.unknown;
    _wasDidChangeDependenciesAlreadyCalledOnce = false;

    // Step 2: Delivery Address.
    _deliveryAddressFormKey = GlobalKey<FormState>();

    // Step 3: Security Information.
    _securityInformationFormKey = GlobalKey<FormState>();

    // Security Information controllers.
    _passwordTextController = TextEditingController();

    // OnStep callbacks for the [Stepper] widget.
    _onStepContinue = const OnStepContinue();
    _onStepCancel = const OnStepCancel();
    _onStepTapped = const OnStepTapped();
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
    // Step 3. Security Information controllers.
    _passwordTextController.dispose();

    super.dispose();
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
                userInformationFormData: _userInformationFormData,
                usernameStatusIcon: _usernameStatusIcon,
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

class UserInformationForm extends StatelessWidget {
  const UserInformationForm({
    super.key,
    required GlobalKey<FormState> userInformationFormKey,
    required UserInformationFormData userInformationFormData,
    required Icon usernameStatusIcon,
  })  : _userInformationFormKey = userInformationFormKey,
        _userInformationFormData = userInformationFormData,
        _usernameStatusIcon = usernameStatusIcon;

  final GlobalKey<FormState> _userInformationFormKey;
  final UserInformationFormData _userInformationFormData;
  final Icon _usernameStatusIcon;

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
