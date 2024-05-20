import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: background_color,
        centerTitle: true,
        leadingWidth: 85,
        title: Text(
          "Privacy Policy",
          style: TextStyles.PrivacyPolicyTitleTextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Text(
            "_localFile.readAsString(),",
            style: TextStyles.PrivacyPolicyTextStyle(),
          ),
        ),
      ),
    );
  }
}
