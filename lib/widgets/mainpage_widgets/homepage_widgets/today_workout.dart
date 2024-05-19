import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/functions/exercises/exercises.dart';
import 'package:fitness_clup/variables/routes.dart';
import 'package:fitness_clup/widgets/mainpage_widgets/homepage_widgets/parts/workout_card.dart';
import 'package:flutter/material.dart';

class TodayWorkoutPlan extends StatelessWidget {
  const TodayWorkoutPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today Workout Plan",
              style: TextStyles.HomeLeftSubtitleTextStyle(),
            ),
            Text(
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              style: TextStyles.HomeRightSubtitleTextStyle(),
            ),
          ],
        ),
        const SizedBox(height: 17),
        WorkoutCard(
          width: double.infinity,
          route: workoutPageRoute,
          exercise: getExercises()["Beginner"][0],
        ),
      ],
    );
  }
}
