import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/functions/accountFuncs/accountFuncs.dart';
import 'package:fitness_clup/variables/colors.dart';
import 'package:fitness_clup/widgets/register_widgets/fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfilePage extends StatelessWidget {
  String name;
  String surname;
  String email;
  EditProfilePage({
    super.key,
    required this.name,
    required this.surname,
    required this.email,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.turn_left_outlined, color: Colors.white)),
        title: Text(
          "EDIT PROFILE",
          style: TextStyles.PrivacyPolicyTitleTextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 60, 32, 0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/pp.png",
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: button_color,
                      shape: BoxShape.circle),
                  child: const Icon(Icons.camera_alt,
                      color: Colors.white, size: 20),
                )
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  NameandSurnameField(
                      onSaved: (p0) => name = p0!,
                      label: "Name",
                      initialValue: name),
                  const SizedBox(height: 20),
                  NameandSurnameField(
                      onSaved: (p0) => surname = p0!,
                      label: "Surname",
                      initialValue: surname),
                  const SizedBox(height: 20),
                  MailField(
                    onSaved: (p0) {},
                    readOnly: true,
                    initialValue: email,
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  updateUserInfo(
                    {
                      "Name": name,
                      "Surname": surname,
                    },
                  );
                  showAboutDialog(context: context);
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(high_green)),
              child: Text(
                "Save",
                style: TextStyles.IntroButtonText(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
