// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/widgets/GetInfo_widgets/activityLevel.dart';
import 'package:fitness_clup/widgets/GetInfo_widgets/ageSpinner.dart';
import 'package:fitness_clup/widgets/GetInfo_widgets/genders.dart';
import 'package:fitness_clup/widgets/GetInfo_widgets/goalSpinner.dart';
import 'package:fitness_clup/widgets/GetInfo_widgets/heightSpinner.dart';
import 'package:fitness_clup/widgets/GetInfo_widgets/weightSpinner.dart';
import 'package:flutter/material.dart';

class GetInfoDefaultPage extends StatefulWidget {
  const GetInfoDefaultPage({super.key});

  @override
  State<GetInfoDefaultPage> createState() => _GetInfoDefaultPageState();
}

class _GetInfoDefaultPageState extends State<GetInfoDefaultPage> {
  int _page = 0;
  int gender = 0;
  int age = 0;
  int weight = 0;
  int height = 0;
  String goal = "";
  int level = 0;

  final List<String> _titleList = [
    "TELL US ABOUT YOURSELF!",
    "HOW OLD ARE YOU ?",
    "WHAT'S YOUR WEIGHT ?",
    "WHAT'S YOUR HEIGHT?",
    "WHAT'S YOUR GOAL?",
    "PHYSICAL ACTIVITY LEVEL?",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pageList = [
      Genders(
        onGenderSelected: _onGenderSelected,
      ),
      AgeSpinner(
        onAgeSelected: _onAgeSelected,
      ),
      WeightSpinner(
        onWeightSelected: _onWeightSelected,
      ),
      HeightSpinner(
        onHeightSelected: _onHeightSelected,
      ),
      GoalSpinner(
        onGoalSelected: _onGoalSelected,
      ),
      LevelSpinner(
        onLevelSelected: _onLevelSelected,
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xff1C1C1E),
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Text(
                  _titleList[_page],
                  style: TextStyles.GetInfoTitleText(),
                ),
                Text(
                  "Tell about yourself",
                  style: TextStyles.GetInfoSubtitleText(),
                )
              ],
            ),
            SizedBox(
              height: 54,
            ),
            _pageList[_page],
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff1C1C1E),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _page > 0
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _page -= 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color(0xff1C1C1E),
                    ),
                    child: const Icon(
                      Icons.subdirectory_arrow_left_sharp,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            _page < _pageList.length - 1
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _page += 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD0FD3E),
                      fixedSize: Size(120, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyles.GetInfoNextButtonText(),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        )
                      ],
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      print("gender : $gender");
                      print("age : $age");
                      print("weight : $weight");
                      print("height : $height");
                      print("goal : $goal");
                      print("level : $level");
                    },
                    child: Text("Start !")),
          ],
        ),
      ),
    );
  }

  void _onGenderSelected(int selectedGender) {
    setState(() {
      gender = selectedGender; // Cinsiyeti sakla
    });
  }

  void _onAgeSelected(int selectedAge) {
    setState(() {
      age = selectedAge;
    });
  }

  void _onLevelSelected(int selectedLevel) {
    setState(() {
      level = selectedLevel;
    });
  }

  void _onGoalSelected(String selectedGoal) {
    setState(() {
      goal = selectedGoal;
    });
  }

  void _onHeightSelected(int selectedHeight) {
    setState(() {
      height = selectedHeight;
    });
  }

  void _onWeightSelected(int selectedWeight) {
    setState(() {
      weight = selectedWeight;
    });
  }
}
