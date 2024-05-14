import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/functions/accountFuncs/accountFuncs.dart';
import 'package:fitness_clup/pages/registerAndLogin/page.dart';
import 'package:fitness_clup/variables/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  Map<String, dynamic> userInfo;
  ProfileMenu({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Edit Profile',
              style: TextStyles.ProfileMenuTextStyle(),
            ),
            onTap: () {
              Navigator.pushNamed(context, editProfileRoute, arguments: {
                "Name": userInfo["Name"],
                "Surname": userInfo["Surname"],
                "E-Mail": userInfo["E-Mail"]
              });
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyles.ProfileMenuTextStyle(),
            ),
            onTap: () {
              // Privacy policy action
              Navigator.pushNamed(context, privacyPolicyRoute);
            },
          ),
          const Divider(),
          // ListTile(
          //   title: Text(
          //     'Settings',
          //     style: TextStyles.ProfileMenuTextStyle(),
          //   ),
          //   onTap: () {
          //     // Settings action
          //   },
          // ),
          // const Divider(),
          ListTile(
            title: Text(
              'Sign Out',
              style: TextStyles.ProfileSignoutTextStyle(),
            ),
            onTap: () {
              userSignOut().whenComplete(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => RegisterAndLoginPage()),
                    ModalRoute.withName(registerAndLoginRoute));
              });
            },
          ),
        ],
      ),
    );
  }
}
