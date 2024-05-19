import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/variables/colors.dart';
import 'package:flutter/material.dart';

class FinishedWorkoutsCard extends StatelessWidget {
  String exTitle;
  String level;
  int cal;
  FinishedWorkoutsCard({
    super.key,
    required this.exTitle,
    required this.cal,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: button_color,
      child: ListTile(
        title: Text(
          exTitle,
          style: TextStyles.WorkoutsFinishedWorkoutCardTitleTextStyle(),
        ),
        subtitle: Text(
          "CAL: $cal | LEVEL: $level",
          style: TextStyles.WorkoutsFinishedWorkoutCardSubtitleTextStyle(),
        ),
        trailing: Icon(Icons.check_box, color: high_green),
      ),
    );
  }
}
