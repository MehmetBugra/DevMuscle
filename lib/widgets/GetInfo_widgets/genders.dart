import 'package:fitness_clup/components/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Genders extends StatefulWidget {
  final Function(int) onGenderSelected;
  Genders({
    super.key,
    required this.onGenderSelected,
  });

  @override
  State<Genders> createState() => _GendersState();
}

class _GendersState extends State<Genders> {
  bool _Male = true;
  bool _Female = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _Male = true;
              _Female = false;
              widget.onGenderSelected(0);
            });
          },
          child: CircleAvatar(
            backgroundColor: _Male ? Color(0xffD0FD3E) : Color(0xff2C2C2E),
            radius: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.male,
                  size: 80,
                  color: _Male ? Colors.black : Colors.white,
                ),
                Text(
                  "Male",
                  style: TextStyles.GetInfoGendersText(_Male),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 44,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _Male = false;
              _Female = true;
              widget.onGenderSelected(1);
            });
          },
          child: CircleAvatar(
            backgroundColor: _Female ? Color(0xffD0FD3E) : Color(0xff2C2C2E),
            radius: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.female,
                  size: 70,
                  color: _Female ? Colors.black : Colors.white,
                ),
                Text(
                  "Female",
                  style: TextStyles.GetInfoGendersText(_Female),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
