// ignore_for_file: prefer_const_constructors

import 'package:fitness_clup/pages/main/mainPage.dart';
import 'package:fitness_clup/pages/registerAndLogin/page.dart';
import 'package:fitness_clup/router.dart';
import 'package:fitness_clup/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(FitnessClup());
}

class FitnessClup extends StatelessWidget {
  const FitnessClup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: myRouter.generateRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: background_color,
          appBarTheme: AppBarTheme(color: background_color)),
      // initialRoute: homeRoute,
      // color: Color(0xff1C1C1E),
      home: auth.currentUser == null ? RegisterAndLoginPage() : MainPage(),
      // showPerformanceOverlay: true,
    );
  }
}
