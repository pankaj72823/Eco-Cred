import 'package:ecocred/Widgets/Profile/screen_card.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget{

  final VoidCallback challengeoverlay;
  final VoidCallback achievementoverlay;
  final VoidCallback personaldetailsoverlay;

  const ProfileDetails({super.key, required this.challengeoverlay, required this.achievementoverlay, required this.personaldetailsoverlay});
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 250,
        height: 600,
        padding: EdgeInsets.all(16),
    // margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      // gradient: const  LinearGradient(
      //   colors: [
      //     Colors.green,
      //     Colors.lightGreen,
      //   ],
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomRight,
      // ),
      borderRadius: BorderRadius.circular(15),

    ),
    child: Column(
      children: [
        ScreenCard(name: 'Personal Details', overlaymain: personaldetailsoverlay),
        ScreenCard(name: 'My Challenges', overlaymain: challengeoverlay),
        ScreenCard(name: 'Projects Invested', overlaymain:() {}),
        ScreenCard(name: 'Achievements', overlaymain: achievementoverlay),
      ],
     ),
    );
  }

}
