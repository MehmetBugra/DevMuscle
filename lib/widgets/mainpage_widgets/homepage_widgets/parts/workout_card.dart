// ignore_for_file: must_be_immutable

import 'package:fitness_clup/components/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorkoutCard extends StatelessWidget {
  double width;
  String route;
  Map exercise;
  WorkoutCard({
    super.key,
    required this.width,
    required this.route,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 180,
      child: Card(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            print("object");
            Navigator.pushNamed(context, route, arguments: exercise);
          },
          child: Stack(
            fit: StackFit.expand,
            // alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/WorkoutPlans/WarmUp.png",
                fit: BoxFit.fill,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise["title"],
                          style: TextStyles.TodayWorkoutCardTitleTextStyle(),
                        ),
                        Text(
                          "| ${exercise["subtitle"]}",
                          style: TextStyles.TodayWorkoutCardTimeTextStyle(),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
