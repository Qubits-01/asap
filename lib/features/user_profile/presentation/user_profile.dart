import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  static const routName = '/user-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'User Profile',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ));
  }
}
