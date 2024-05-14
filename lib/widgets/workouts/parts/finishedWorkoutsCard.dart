import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/variables/colors.dart';
import 'package:flutter/material.dart';

class FinishedWorkoutCard extends StatelessWidget {
  const FinishedWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: button_color,
      child: ListTile(
        title: Text(
          "Bir Antrenman ismi",
          style: TextStyles.WorkoutsFinishedWorkoutCardTitleTextStyle(),
        ),
        subtitle: Text(
          "Dakikası",
          style: TextStyles.WorkoutsFinishedWorkoutCardSubtitleTextStyle(),
        ),
        trailing: Icon(Icons.check_box, color: high_green),
      ),
    );
  }
}
