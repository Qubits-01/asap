import 'package:flutter/material.dart';

import '../../../../../utils/general_dialog_boxes.dart';
import 'widgets/sign_up_form_stepper.dart';

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
