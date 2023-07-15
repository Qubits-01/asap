import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    _stepperIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _stepperIndex,
      onStepContinue: () {
        setState(() {
          if (_stepperIndex < 2) _stepperIndex += 1;

          if (_stepperIndex == 2) {
            // Show loading indicator.
            _showLoadingIndicator(buildContext: context);

            // Simulate a 2-second delay.
            Future.delayed(const Duration(seconds: 2), () {
              // Remove the loading indicator.
              Navigator.of(context).pop();
            });
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (_stepperIndex > 0) _stepperIndex -= 1;
        });
      },
      onStepTapped: (int index) {
        setState(() {
          _stepperIndex = index;
        });
      },
      steps: <Step>[
        // User information.
        Step(
          title: const Text('User Information'),
          subtitle: const Text('This is to identify you correctly.'),
          content: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
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
                  const SizedBox(height: 16.0),

                  // First name and Middle initial.
                  Row(
                    children: <Widget>[
                      // First name.
                      Expanded(
                        flex: 80,
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
                        flex: 20,
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
          state: StepState.editing,
        ),

        // Delivery address.
        Step(
          title: const Text('Delivery Address'),
          subtitle: const Text('Default address. Can be modified later.'),
          content: const Text('Step 1 content'),
          state: StepState.indexed,
        ),

        // Contact information.
        Step(
          title: const Text('Contact Information'),
          subtitle: const Text('A way to verify your identity.'),
          content: const Text('Step 1 content'),
          state: StepState.indexed,
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
