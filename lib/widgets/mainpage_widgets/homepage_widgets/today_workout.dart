import 'package:fitness_clup/components/styles.dart';
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
              "Tariiih",
              style: TextStyles.HomeRightSubtitleTextStyle(),
            ),
          ],
        ),
        const SizedBox(height: 17),
        WorkoutCard(
          title: "Day 01 - Warm Up",
          subtitle: "29 mart 2023",
          width: double.infinity,
        ),
      ],
    );
  }
}
