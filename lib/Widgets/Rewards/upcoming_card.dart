import 'package:flutter/material.dart';

class UpcomingCard extends StatelessWidget {
  final String level;
  final String reward;
  final String difficulty;

  const UpcomingCard({
    super.key,
    required this.level,
    required this.reward,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Level: $level',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Reward: $reward',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Difficulty: $difficulty',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
