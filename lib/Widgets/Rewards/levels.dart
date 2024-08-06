import 'package:ecocred/Widgets/Rewards/level_button.dart';
import 'package:flutter/material.dart';

class Levels extends StatelessWidget {
  final int userLevel;

  Levels({super.key, required this.userLevel});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LevelButton(level: 'Level 1'),
        LevelButton(level: 'Level 2'),
        LevelButton(level: 'Level 3'),
        // Add more levels as needed
      ],
    );
  }
}
