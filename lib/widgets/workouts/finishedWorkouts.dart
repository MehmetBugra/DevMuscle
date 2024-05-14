// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/widgets/workouts/parts/finishedWorkoutsCard.dart';
import 'package:flutter/material.dart';

class FinishedWorkouts extends StatelessWidget {
  const FinishedWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " Finished Workouts",
            style: TextStyles.WorkoutsFinishedWorkoutTitleTextStyle(),
          ),
          SizedBox(height: 14),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                FinishedWorkoutCard(),
                FinishedWorkoutCard(),
                FinishedWorkoutCard(),
                FinishedWorkoutCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
