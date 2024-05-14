// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_clup/widgets/profile_widgets/profile_head/profile_head.dart';
import 'package:fitness_clup/widgets/profile_widgets/profile_menu/profile_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  Map<String, dynamic> userInfo;
  ProfilePage({super.key, required this.userInfo});

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 120, 40, 0),
      child: Column(
        children: [
          Profile_Head(
            name: userInfo["Name"],
            surname: userInfo["Surname"],
          ),
          ProfileMenu(userInfo: userInfo),
        ],
      ),
    );
  }
}
