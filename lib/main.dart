// ignore_for_file: prefer_const_constructors

import 'package:fitness_clup/pages/baslangic_ekrani/intro.dart';
import 'package:fitness_clup/pages/main/mainPage.dart';
import 'package:fitness_clup/pages/registerAndLogin/page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  print("object");
  runApp(FitnessClup());
}

class FitnessClup extends StatelessWidget {
  const FitnessClup({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff1C1C1E),
      home: RegisterAndLoginPage(),
      // showPerformanceOverlay: true,
    );
  }
}
