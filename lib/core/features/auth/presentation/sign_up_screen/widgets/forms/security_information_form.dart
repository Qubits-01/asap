import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../constants/local_storage_cache_keys.dart';
import '../../../../../widgets/password_text_input.dart';
import '../../blocs/sign_up_data_preservation_bloc/sign_up_data_preservation_bloc.dart';

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
            onSaved: (String? newValue) {
              context.read<SignUpDataPreservationBloc>().add(
                    SignUpDataPreservationFormSaved(
                      key: LocalStorageCacheKeys.emailAddress,
                      value: newValue as String,
                    ),
                  );
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
            onSaved: (String? newValue) {
              context.read<SignUpDataPreservationBloc>().add(
                    SignUpDataPreservationFormSaved(
                      key: LocalStorageCacheKeys.phoneNumber,
                      value: newValue as String,
                    ),
                  );
            },
          ),
          const SizedBox(height: 8.0),

          // Horizontal divider.
          const Divider(),
          const SizedBox(height: 8.0),

          // Password.
          PasswordTextInput(
            textInputAction: TextInputAction.next,
            labelText: 'Password',
            validator: (String? value) {
              // TODO: Implement a proper regex for password validation.

              if (value == null || value.isEmpty) {
                return 'Please enter a your Password.';
              } else if (value.length < 8) {
                return 'Must be at least 8 characters long.';
              }

              return null;
            },
            onSaved: (String? newValue) {
              context.read<SignUpDataPreservationBloc>().add(
                    SignUpDataPreservationFormSaved(
                      key: LocalStorageCacheKeys.password,
                      value: newValue as String,
                    ),
                  );
            },
          ),
          const SizedBox(height: 16.0),

          // Confirm password.
          PasswordTextInput(
            textInputAction: TextInputAction.done,
            labelText: 'Confirm Password',
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
