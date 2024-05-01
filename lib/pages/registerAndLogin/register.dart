import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_clup/widgets/register_widgets/fields.dart';
import 'package:fitness_clup/widgets/register_widgets/register/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  late String _passwordConf;

  @override
  void initState() {
    _email = "";
    _password = "";
    _passwordConf = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MailField(
              onSaved: (mail) => _email = mail!,
            ),

            PasswordField(
                label: "Password",
                onSaved: (password) {
                  setState(() {
                    _password = password!;
                  });
                }),

            // Confirm Password
            PasswordField(
                label: "Password Again",
                onSaved: (password) {
                  setState(() {
                    _passwordConf = password!;
                  });
                }),

            const SizedBox(height: 20),

            // Sign Up Button
            RegisterButton(
              myOnPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email, password: _password);

                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email, password: _password);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
