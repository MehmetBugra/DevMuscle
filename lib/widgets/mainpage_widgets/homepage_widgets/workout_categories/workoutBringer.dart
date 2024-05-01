// ignore_for_file: must_be_immutable

import 'package:fitness_clup/widgets/mainpage_widgets/homepage_widgets/parts/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutBringer extends StatelessWidget {
  String level;
  WorkoutBringer({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return WorkoutCard(title: level, subtitle: "subtitle", width: 350);
        },
      ),
    );
  }
}
