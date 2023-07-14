import 'package:flutter/material.dart';

class EmailOtpVerificationScreen extends StatelessWidget {
  const EmailOtpVerificationScreen({super.key});

  static const routeName = '/email-otp-verification';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Email OTP Verification Screen'),
      ),
    );
  }
}
