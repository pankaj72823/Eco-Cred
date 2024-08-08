import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class UpcomingCard extends StatefulWidget {
  final String level;
  final String reward;
  final String difficulty;
  final String file;

  const UpcomingCard({
    super.key,
    required this.level,
    required this.reward,
    required this.difficulty,
    required this.file,
  });

  @override
  State<UpcomingCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<UpcomingCard> {
  bool isEnabled = true;
  final scratchKey = GlobalKey<ScratcherState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Scratcher(
            key: scratchKey,
            brushSize: 30,
            threshold: 100,
            enabled: isEnabled,
            onThreshold: () => setState(() {
              isEnabled = false;
            }),
            color: Colors.blue.withOpacity(0.5),
            child: Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(widget.file),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              scratchKey.currentState?.reveal(duration: Duration(milliseconds: 500));
            },
            child: Text('Reveal'),
          ),
        ],
      ),
    );
  }
}
