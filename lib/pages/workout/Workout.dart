// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/pages/main/pages/home/WorkoutPlan/sportCard.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  Map exercise;
  WorkoutPage({super.key, required this.exercise});

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
                      exercise["title"] ?? "",
                      style: TextStyles.WorkoutTitleTextStyle(),
                    ),
                    SizedBox(height: 8),
                    Text(
                      exercise["subtitle"] ?? "",
                      style: TextStyles.WorkoutSubtitleTextStyle(),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        WorkoutInfo(
                          text: "${exercise["time"]} min ",
                          icon: Icons.play_circle,
                        ),
                        SizedBox(width: 17.5),
                        WorkoutInfo(
                          text: "${exercise["cal"]} cal ",
                          icon: Icons.fireplace,
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Text(
                      exercise["desc"],
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
