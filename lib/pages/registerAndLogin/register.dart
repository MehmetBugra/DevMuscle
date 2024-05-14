import 'package:fitness_clup/functions/accountFuncs/accountFuncs.dart';
import 'package:fitness_clup/pages/baslangic_ekrani2/GetInfoDefaultPage.dart';
import 'package:fitness_clup/variables/routes.dart';
import 'package:fitness_clup/widgets/register_widgets/fields.dart';
import 'package:fitness_clup/widgets/register_widgets/register/register_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _surname;
  late String _email;
  late String _password;
  late String _passwordConf;

  @override
  void initState() {
    _name = "";
    _surname = "";
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
            NameandSurnameField(
              onSaved: (name) => _name = name!,
              label: "Name",
            ),
            NameandSurnameField(
                onSaved: (surname) => _surname = surname!, label: "Surname"),
            MailField(onSaved: (mail) => _email = mail!),

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
              myOnPressed: () {
                try {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    registerUserWithMailandPassword(
                            _name, _surname, _password, _email)
                        .whenComplete(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => GetInfoDefaultPage(),
                            settings: const RouteSettings(name: getInfoRoute),
                          ),
                          (route) => false);
                    });
                  }
                } on Exception catch (e) {
                  print("hata");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
