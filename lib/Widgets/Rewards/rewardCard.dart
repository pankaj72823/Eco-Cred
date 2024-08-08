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
    return  Container(
        height: 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Level: ${widget.level}',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   'Reward: ${widget.reward}',
              //   style: TextStyle(fontSize: 14),
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   'Difficulty: ${widget.difficulty}',
              //   style: TextStyle(fontSize: 14),
              // ),
              // const SizedBox(height: 10),
              Scratcher(
                key: scratchKey,
                brushSize: 30,
                threshold: 100,
                enabled: isEnabled,
                onThreshold: () => setState(() {
                  isEnabled = true;
                }),
                color: Colors.blue,
                child: Container(
                  width: 150,
                  height: 120,
                  child: Column(
                      children: [
                        ClipRRect(
                          child: Image.asset('lib/assets/Rewards/5%voucher.png', fit: BoxFit.cover, ),

                        ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {
                scratchKey.currentState?.reveal(duration: Duration(milliseconds: 5),);
              },
                child: Text('Reveal'),
              )
            ],
          ),

    );
  }
}
