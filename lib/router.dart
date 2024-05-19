import 'package:fitness_clup/pages/baslangic_ekrani2/GetInfoDefaultPage.dart';
import 'package:fitness_clup/pages/main/mainPage.dart';
import 'package:fitness_clup/pages/main/pages/404.dart';
import 'package:fitness_clup/pages/main/pages/home/AllWorkoutCategories/allWorkoutCategories.dart';
import 'package:fitness_clup/pages/workout/Workout.dart';
import 'package:fitness_clup/pages/main/pages/home/profile/edit_profile.dart';
import 'package:fitness_clup/pages/main/pages/home/profile/privacyPolicy.dart';
import 'package:fitness_clup/pages/registerAndLogin/forgotpassword/forgotPassword.dart';
import 'package:fitness_clup/pages/registerAndLogin/page.dart';
import 'package:fitness_clup/variables/routes.dart';
import 'package:flutter/cupertino.dart';

class myRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return CupertinoPageRoute(
          builder: (context) => MainPage(),
        );

      case allWorkoutCategoriesRoute:
        return CupertinoPageRoute(
          builder: (context) => AllWorkoutCategories(),
        );

      case workoutPageRoute:
        var args = settings.arguments;
        if (args != null && args is Map<String, dynamic>) {
          print(args);
          var exercise = args;
          print(exercise);
          return CupertinoPageRoute(
            builder: (context) => WorkoutPage(
              exercise: exercise,
            ),
          );
        }

      case getInfoRoute:
        return CupertinoPageRoute(builder: (context) => GetInfoDefaultPage());
      case registerAndLoginRoute:
        return CupertinoPageRoute(builder: (context) => RegisterAndLoginPage());
      case privacyPolicyRoute:
        return CupertinoPageRoute(builder: (context) => PrivacyPolicy());

      case forgotPasswordRoute:
        return CupertinoPageRoute(builder: (context) => ForgotPassword());

      case editProfileRoute:
        var args = settings.arguments;
        if (args != null && args is Map<String, dynamic>) {
          String name = args["Name"];
          String surname = args["Surname"];
          String email = args["E-Mail"];
          return CupertinoPageRoute(
              builder: (context) =>
                  EditProfilePage(name: name, surname: surname, email: email));
        }
    }
    return CupertinoPageRoute(
      builder: (context) => PageNotFound(),
    );
  }
}
