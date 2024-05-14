import 'package:fitness_clup/components/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  const SportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff2C2C2E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Köşelwerin yuvarlaklığı
      ),
      child: Row(
        children: [
          // Sol taraftaki resim
          Container(
            width: 100, // Resmin genişliği
            height: 100, // Resmin yüksekliği
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/WorkoutPlans/hareket1.png"), // Resmin yolu
                fit: BoxFit.cover, // Resmin boyutunu belirleme
              ),
            ),
          ),
          // Sağ taraftaki başlık
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Isınma Hareketi 1",
                style: TextStyles.WorkoutCardTextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
