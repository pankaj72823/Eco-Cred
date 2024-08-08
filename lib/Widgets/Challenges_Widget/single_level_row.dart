import 'package:ecocred/Provider/challenge_provider.dart';
import 'package:ecocred/Widgets/Challenges_Widget/challenge_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SingleLevelRow extends StatelessWidget {
  const SingleLevelRow ( {super.key,  required this.level, required this.challenges});


  final String level;
  final List<Challenge> challenges;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.leaderboard, color: Colors.green, size: 30),
            const SizedBox(width: 10),
            Text(
              level,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: challenges.map((challenge) => ChallengeCard(challenge: challenge)).toList(),
          ),
        ),
      ],
    );
  }
}
