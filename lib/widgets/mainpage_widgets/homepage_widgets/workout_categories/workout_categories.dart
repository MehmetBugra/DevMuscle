import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/variables/routes.dart';
import 'package:fitness_clup/widgets/mainpage_widgets/homepage_widgets/parts/tabbar.dart';
import 'package:fitness_clup/widgets/mainpage_widgets/homepage_widgets/parts/workoutBringer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorkoutCategories extends StatefulWidget {
  const WorkoutCategories({super.key});

  @override
  State<WorkoutCategories> createState() => _WorkoutCategoriesState();
}

class _WorkoutCategoriesState extends State<WorkoutCategories>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Workout Categories",
              style: TextStyles.HomeLeftSubtitleTextStyle(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, allWorkoutCategoriesRoute);
              },
              child: Text(
                "See All",
                style: TextStyles.HomeRightSubtitleTextStyle(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        WorkoutCategoriesTabBar(
          tabController: tabController,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: TabBarView(
            controller: tabController,
            children: [
              WorkoutBringer(
                level: "Beginner",
                yon: Axis.horizontal,
              ),
              WorkoutBringer(
                level: "Intermediate",
                yon: Axis.horizontal,
              ),
              WorkoutBringer(
                level: "Advance",
                yon: Axis.horizontal,
              ),
            ],
          ),
        )
      ],
    );
  }
}
