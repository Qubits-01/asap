import 'package:flutter/material.dart';

class SecurityInformationForm extends StatefulWidget {
  const SecurityInformationForm({
    super.key,
    required GlobalKey<FormState> securityInformationFormKey,
  }) : _securityInformationFormKey = securityInformationFormKey;

  final GlobalKey<FormState> _securityInformationFormKey;

  @override
  State<SecurityInformationForm> createState() =>
      _SecurityInformationFormState();
}

class _SecurityInformationFormState extends State<SecurityInformationForm> {
  // Step 3. Security Information.
  // Security Information controllers.
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();

    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // Step 3. Security Information controllers.
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._securityInformationFormKey,
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
    );
  }
}
