import 'package:ecocred/Screens/Overlay/achievement_overlay.dart';
import 'package:ecocred/Screens/Overlay/personal_details_overlay.dart';
import 'package:ecocred/Screens/challenges_screen.dart';
import 'package:ecocred/Widgets/Profile/profile_details.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _Profile();
  }

}

class _Profile  extends State<Profile>{
  void _openChallengeScreenOverlay(){
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return const FractionallySizedBox(
            heightFactor: 0.75,
            child: ChallengesScreen(),
          );
        });
  }

  void _openPersonalDetailsScreenOverlay(){
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return FractionallySizedBox(
            heightFactor: 0.75,
            child: PersonalDetailsOverlay(),
          );
        });
  }
  void _openAchievementsScreenOverlay(){
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return FractionallySizedBox(
            heightFactor: 0.75,
            child: AchievementOverlay(),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.withOpacity(0.9),
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('lib/assets/Home_screen/education.jpg'),
                ),
                Text('Pankaj Kurmi ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                Text('Carbon Credits Earned',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20,),
                ProfileDetails(challengeoverlay: _openChallengeScreenOverlay, achievementoverlay: _openAchievementsScreenOverlay, personaldetailsoverlay: _openPersonalDetailsScreenOverlay),
              ],
            )
    );
  }

}