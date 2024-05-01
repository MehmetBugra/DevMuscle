// ignore_for_file: must_be_immutable

import 'package:fitness_clup/widgets/mainpage_widgets/homepage_widgets/greeting.dart';
import 'package:fitness_clup/widgets/mainpage_widgets/homepage_widgets/today_workout.dart';
import 'package:fitness_clup/widgets/mainpage_widgets/homepage_widgets/workout_categories/workout_categories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String name = "Buğra";
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingText(name: name),
          const SizedBox(height: 32),
          TodayWorkoutPlan(),
          const SizedBox(height: 32),
          WorkoutCategories(),
        ],
      ),
    );
  }
}
