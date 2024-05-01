import 'dart:ui';

import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/pages/registerAndLogin/login.dart';
import 'package:fitness_clup/pages/registerAndLogin/register.dart';
import 'package:fitness_clup/widgets/appIcon.dart';
import 'package:fitness_clup/widgets/register_widgets/login/register_googleButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterAndLoginPage extends StatelessWidget {
  const RegisterAndLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff1C1C1E),
        appBar: AppBar(
          backgroundColor: const Color(0xff1C1C1E),
          title: TabBar(
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                child: Text(
                  "Login",
                  style: TextStyles.TabBarText(),
                ),
              ),
              Tab(
                child: Text(
                  "Sign Up",
                  style: TextStyles.TabBarText(),
                ),
              ),
            ],
            tabAlignment: TabAlignment.center,
            indicatorColor: Color(0xffD0FD3E),
          ),
          foregroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            TabPage(Login()),
            TabPage(Register()),
          ],
        ),
        bottomNavigationBar: const BottomAppBar(
          color: Color(0xff1C1C1E),
          surfaceTintColor: Color(0xff1C1C1E),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RegisterWithGoogle(),
              // RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget TabPage(Widget page) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          appIcon(),
          page,
        ],
      ),
    );
  }
}
