// ignore_for_file: must_be_immutable

import "package:fitness_clup/components/styles.dart";
import "package:flutter/material.dart";
import "package:form_validator/form_validator.dart";

class PasswordField extends StatefulWidget {
  final String label;
  final void Function(String?) onSaved;

  PasswordField({super.key, required this.label, required this.onSaved});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isOpen = false;
  Color _passwordTextColor = Colors.white;

  FocusNode _focusNodePassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isOpen,
      autocorrect: false,
      keyboardType: TextInputType.text,
      focusNode: _focusNodePassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecorations.RegisterLoginInputDec(
          widget.label, _passwordTextColor,
          isOpen: _isOpenPassword),
      onSaved: widget.onSaved,
      validator: ValidationBuilder()
          .minLength(8, "Password must be at least 8 characters")
          .build(),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    super.dispose();
  }

  GestureDetector _isOpenPassword() {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (_isOpen)
              _isOpen = false;
            else
              _isOpen = true;
          });
        },
        child: Icon(_isOpen ? Icons.visibility_off : Icons.visibility));
  }

  void _onPasswordFocusChange() {
    setState(() {
      _passwordTextColor =
          _focusNodePassword.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}

class MailField extends StatefulWidget {
  void Function(String?) onSaved;
  MailField({super.key, required this.onSaved});

  @override
  State<MailField> createState() => _MailFieldState();
}

class _MailFieldState extends State<MailField> {
  FocusNode _focusNodeMail = FocusNode();

  Color _emailTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNodeMail,
      onSaved: widget.onSaved,
      style: const TextStyle(color: Colors.white),
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecorations.RegisterLoginInputDec("E-Mail", _emailTextColor)
              .copyWith(suffixIcon: Icon(Icons.mail)),
      validator: ValidationBuilder().email().minLength(5).maxLength(50).build(),
    );
  }

  @override
  void dispose() {
    _focusNodeMail.dispose();
    super.dispose();
  }

  void _onEmailFocusChange() {
    setState(() {
      _emailTextColor =
          _focusNodeMail.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}
