import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/home/presentation/home_screen.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Size displaySize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Welcome Text
                const SizedBox(height: 32.0),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 10.0),

                // Subtext
                const Text('Enter your credentials to access your account.'),
                const SizedBox(height: 25.0),

                // Google Login Button
                SizedBox(
                  width: displaySize.width,
                  child: FilledButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text('Login with Google'),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 30.0),

                // Horizontal Divider
                Row(
                  children: <Widget>[
                    const Expanded(child: Divider()),
                    Text(
                      ' or ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white60),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 30.0),

                // Text Inputs
                // Email label
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10.0),

                // Email input
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20.0),

                // Password label and Forgot password
                Row(
                  children: <Widget>[
                    // Password label
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),

                    // Forgot password button
                    GestureDetector(
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                      ),
                      onTap: () {
                        GoRouter.of(context)
                            .push(ForgotPasswordScreen.routeName);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 10.0),

                // Password input
                const PasswordTextInput(),
                const SizedBox(height: 8.0),

                // Remember Me Checkbox
                const RememberMeCheckBox(),
                const SizedBox(height: 30.0),

                // Login Button
                SizedBox(
                  width: displaySize.width,
                  child: FilledButton.tonal(
                    onPressed: () {
                      GoRouter.of(context).push(HomeScreen.routeName);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        letterSpacing: 4.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),

                // Not a member? Sign up here.
                Row(
                  children: <Widget>[
                    const Text('Not a member? '),
                    // Forgot password button
                    GestureDetector(
                      child: Text(
                        ' Sign-up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                      ),
                      onTap: () {
                        GoRouter.of(context).push(SignUpScreen.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({super.key});

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();

    _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          child: Checkbox(
            value: _isChecked,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4),
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          ),
        ),
        const Text(' Remember me'),
      ],
    );
  }
}

class PasswordTextInput extends StatefulWidget {
  const PasswordTextInput({super.key});

  @override
  State<PasswordTextInput> createState() => _PasswordTextInputState();
}

class _PasswordTextInputState extends State<PasswordTextInput> {
  late bool _isObscureText;

  @override
  void initState() {
    super.initState();

    _isObscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscureText,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _isObscureText = !_isObscureText;
            });
          },
          child: Icon(
            _isObscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
    );
  }
}
