import 'package:ecocred/Widgets/Profile/screen_card.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  final VoidCallback challengeoverlay;
  final VoidCallback achievementoverlay;
  final VoidCallback personaldetailsoverlay;
  final VoidCallback projectoverlay;

  const ProfileDetails(
      {super.key,
        required this.challengeoverlay,
        required this.achievementoverlay,
        required this.personaldetailsoverlay,
        required this.projectoverlay}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ScreenCard(
              name: 'Personal Details', overlaymain: personaldetailsoverlay),
          ScreenCard(name: 'My Challenges', overlaymain: challengeoverlay),
          ScreenCard(name: 'Projects Invested', overlaymain: projectoverlay),
          ScreenCard(name: 'Achievements', overlaymain: achievementoverlay),
        ],
      ),
    );
  }
}
