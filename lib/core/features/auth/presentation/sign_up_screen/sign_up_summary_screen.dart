import 'package:flutter/material.dart';

class SignUpSummaryScreen extends StatelessWidget {
  const SignUpSummaryScreen({super.key});

  static const routeName = '/sign-up-summary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up Summary')),
      body: const Center(
        child: Text('Sign Up Summary Screen'),
      ),
    );
  }
}
