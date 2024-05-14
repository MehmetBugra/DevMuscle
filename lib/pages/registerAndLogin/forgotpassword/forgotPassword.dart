import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/variables/colors.dart';
import 'package:fitness_clup/variables/routes.dart';
import 'package:fitness_clup/widgets/register_widgets/fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  String _email = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.turn_left_outlined,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FORGOT PASSWORD?",
              style: TextStyles.ForgotPasswordTitleTextStyle(),
            ),
            const SizedBox(height: 16),
            Text(
              "ENTER YOUR INFORMATIONS BELOW OR LOGIN WITH A OTHER ACCOUNT",
              style: TextStyles.ForgotPasswordSubtitleTextStyle(),
            ),
            const SizedBox(height: 30),
            Form(
                key: _formKey,
                child: MailField(onSaved: (mail) => _email = mail!)),
            SizedBox(height: 200),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(high_green),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      try {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: _email);
                        Navigator.popUntil(context,
                            ModalRoute.withName(registerAndLoginRoute));
                      } catch (e) {}
                    }
                  },
                  child: Text(
                    "Send",
                    style: TextStyles.IntroButtonText(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
