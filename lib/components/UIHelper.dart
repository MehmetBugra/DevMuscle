// import 'package:fitness_clup/pages/chats.dart';
// import 'package:fitness_clup/pages/instructors.dart';
// import 'package:fitness_clup/pages/mainPage.dart';
// import 'package:fitness_clup/pages/profile.dart';
import 'package:fitness_clup/pages/main/pages/home.dart';
import 'package:fitness_clup/pages/main/pages/notifications.dart';
import 'package:fitness_clup/pages/main/pages/profile.dart';
import 'package:fitness_clup/pages/main/pages/workouts.dart';
import 'package:fitness_clup/widgets/intro_widgets/page.dart';
import 'package:flutter/material.dart';

class UIHelper {
  static Widget PageChanger(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return WorkoutsPage();
      case 2:
        return NotificationsPage();
      case 3:
        return ProfilePage();
      default:
        return const Placeholder();
    }
  }

  static Widget IntroPageChanger(int index) {
    switch (index) {
      case 0:
        return IntroPage("assets/images/intro/intro1.png", "MEET YOUR COACH,",
            "START YOUR JOURNEY", index);
      case 1:
        return IntroPage("assets/images/intro/intro1.png",
            "CREATE A WORKOUT PLAN", "TO STAY FIT", index);
      case 2:
        return IntroPage("assets/images/intro/intro1.png", "ACTION IS THE",
            "KEY TO ALL SUCCESS", index);
      default:
        return const Placeholder();
    }
  }
}
