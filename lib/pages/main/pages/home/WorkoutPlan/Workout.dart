// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/pages/main/pages/home/WorkoutPlan/sportCard.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 375,
              child: Image.asset(
                "assets/images/WorkoutPlans/WorkoutPlanDetails.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 300),
              decoration: const BoxDecoration(
                color: Color(0xff1C1C1E),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Day 01 - Warm Up",
                      style: TextStyles.WorkoutTitleTextStyle(),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "04 Workouts For Beginner",
                      style: TextStyles.WorkoutSubtitleTextStyle(),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        WorkoutInfo(
                          text: "60 min",
                          icon: Icons.play_circle,
                        ),
                        SizedBox(width: 17.5),
                        WorkoutInfo(
                          text: "350 cal",
                          icon: Icons.fireplace,
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Text(
                      "Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ",
                      style: TextStyles.WorkoutDescribeTextStyle(),
                    ),
                    SizedBox(height: 32),
                    SportCard(),
                    SportCard(),
                    SportCard(),
                    SportCard(),
                    SportCard(),
                    SportCard(),
                    SportCard(),
                    SportCard(),
                    SportCard(),
                  ],
                ),
              ),
            ),
            IconButton(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 56, left: 24),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.turn_left_sharp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutInfo extends StatelessWidget {
  String text;
  IconData icon;
  WorkoutInfo({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xff2C2C2E),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 6),
          Text(text, style: TextStyles.WorkoutInfoTextStyle()),
        ],
      ),
    );
  }
}
