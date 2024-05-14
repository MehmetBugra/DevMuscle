import 'package:fitness_clup/components/styles.dart';
import 'package:fitness_clup/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Calories extends StatefulWidget {
  const Calories({super.key});

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  double _calValue = 8000;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            showTicks: false,
            minimum: 0,
            maximum: 10000,
            startAngle: 270,
            endAngle: 270,
            axisLineStyle: AxisLineStyle(
              color: button_color,
            ),
            pointers: [
              RangePointer(
                value: _calValue,
                color: button_color,
                gradient: SweepGradient(
                  colors: [
                    GradientsFirst_color,
                    GradientsSec_color,
                  ],
                ),
              ),
            ],
            annotations: [
              GaugeAnnotation(
                angle: 90,
                positionFactor: 0.8,
                widget: Column(
                  children: [
                    Text(
                      _calValue.toStringAsFixed(0) + " Cal",
                      style: TextStyles.WorkoutsCalTextStyle(),
                    ),
                    Text(
                      "Active Calories",
                      style: TextStyles.WorkoutsCalSubtitleTextStyle(),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
