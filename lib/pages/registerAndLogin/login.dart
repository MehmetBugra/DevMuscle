import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/widgets/register_widgets/fields.dart';
import 'package:fitness_clup/widgets/register_widgets/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isOpen = false;

  late String _mail;
  late String _password;

  @override
  void initState() {
    _mail = "";
    _password = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MailField(onSaved: (mail) => _mail = mail!),
          PasswordField(
              label: "Password", onSaved: (password) => _password = password!),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password",
              style: TextStyles.ForgotPasswordText(),
            ),
          ),
          const SizedBox(height: 20),
          LoginButton(
            onPressed: () {
              FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _mail, password: _password);
            },
          )
        ],
      )),
    );
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
}
