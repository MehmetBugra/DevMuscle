import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/functions/accountFuncs/accountFuncs.dart';
import 'package:fitness_clup/pages/main/mainPage.dart';
import 'package:fitness_clup/variables/routes.dart';
import 'package:fitness_clup/widgets/register_widgets/fields.dart';
import 'package:fitness_clup/widgets/register_widgets/login/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isOpen = true;

  final _formKey = GlobalKey<FormState>();

  String? _mail;
  String? _password;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MailField(onSaved: (mail) => _mail = mail!),
              PasswordField(
                  label: "Password",
                  onSaved: (password) => _password = password!),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, forgotPasswordRoute),
                  child: Text(
                    "Forgot Password",
                    style: TextStyles.ForgotPasswordText(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              LoginButton(
                onPressed: () {
                  try {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      userSignIn(_mail!, _password!).whenComplete(
                        () {
                          if (auth.currentUser != null) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => MainPage(),
                                settings: const RouteSettings(name: mainRoute),
                              ),
                              ModalRoute.withName(mainRoute),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Kullanıcı Bulunamadı."),
                                  content: Text("E-Posta veya şifre hatalı."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Tamam"),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                      );
                    }
                  } catch (e) {
                    print("object");
                  }
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
