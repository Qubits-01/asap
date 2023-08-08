import 'package:flutter/material.dart';

class PasswordTextInput extends StatefulWidget {
  const PasswordTextInput({
    super.key,
    required TextInputAction textInputAction,
    required String labelText,
    required String? Function(String?) validator,
    void Function(String?)? onSaved,
  })  : _textInputAction = textInputAction,
        _labelText = labelText,
        _validator = validator,
        _onSaved = onSaved;

  final TextInputAction _textInputAction;
  final String _labelText;
  final String? Function(String?) _validator;
  final void Function(String?)? _onSaved;

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
    return TextFormField(
      obscureText: _isObscureText,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget._textInputAction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        labelText: widget._labelText,
        suffixIcon: InkWell(
          onTap: () {
            _isObscureText = !_isObscureText;

            // Rebuild.
            setState(() {});
          },
          child: Icon(
            _isObscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
      validator: widget._validator,
      onSaved: widget._onSaved,
    );
  }
}
