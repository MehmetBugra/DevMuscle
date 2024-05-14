import 'package:fitness_clup/widgets/workouts/calories.dart';
import 'package:fitness_clup/widgets/workouts/circle.dart';
import 'package:fitness_clup/widgets/workouts/finishedWorkouts.dart';
import 'package:fitness_clup/widgets/workouts/myCalendar.dart';
import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  Map<String, dynamic> userInfo;
  WorkoutsPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          myCalendar(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Calories(),
                Row(
                  children: [
                    CircleParts(label: "Protein", val: 60),
                    CircleParts(label: "Carb", val: 600),
                    CircleParts(label: "Fat", val: 40),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          FinishedWorkouts(),
        ],
      ),
    );
  }
}
