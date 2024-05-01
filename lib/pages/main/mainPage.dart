import "package:fitness_clup/components/UIHelper.dart";
import "package:fitness_clup/widgets/mainpage_widgets/bottomNavBar.dart";
import "package:flutter/material.dart";

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1E),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
        child: UIHelper.PageChanger(page),
      ),
      bottomNavigationBar: BottomNavBar(
        page: page,
        onPressed: (value) {
          setState(() {
            page = value;
          });
        },
      ),
    );
  }
}
