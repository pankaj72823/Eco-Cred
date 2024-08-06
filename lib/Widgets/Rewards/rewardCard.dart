import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class RewardCard extends StatefulWidget {
  final String level;
  final String reward;
  final String difficulty;
  final String file;

  const RewardCard({
    super.key,
    required this.level,
    required this.reward,
    required this.difficulty,
    required this.file,
  });

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard> {
  bool isEnabled = true;
  final scratchKey = GlobalKey<ScratcherState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Container(
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
                'Level: ${widget.level}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Reward: ${widget.reward}',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Difficulty: ${widget.difficulty}',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              Scratcher(
                key: scratchKey,
                brushSize: 30,
                threshold: 50,
                enabled: isEnabled,
                onThreshold: () => setState(() {
                  isEnabled = false;
                }),
                color: Colors.blue,
                child: Container(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(widget.file, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
