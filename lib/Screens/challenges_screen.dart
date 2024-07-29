import 'package:ecocred/Widgets/Challenges_Widget/current_challenge.dart';
import 'package:ecocred/Widgets/Challenges_Widget/new_challenges.dart';
import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChallengesScreen();
  }

}
class _ChallengesScreen extends State<ChallengesScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Challenges'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CurrentChallenge(),
            NewChallenges(),
          ],
        ),
      ),
    );
  }
}
  
