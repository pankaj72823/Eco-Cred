
import 'package:ecocred/Screens/Overlay/achievement_overlay.dart';
import 'package:ecocred/Screens/Overlay/personal_details_overlay.dart';
import 'package:ecocred/Screens/challenges_screen.dart';
import 'package:ecocred/Screens/project.dart';
import 'package:ecocred/Widgets/Profile/profile_details.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  void _openChallengeScreenOverlay() {
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
  void _openProjectScreenOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return FractionallySizedBox(
            heightFactor: 0.75,
            child: ProjectScreen(),
          );
        });
  }
  void _openPersonalDetailsScreenOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return FractionallySizedBox(
            heightFactor: 1,
            child: PersonalDetailsOverlay(),
          );
        });
  }

  void _openAchievementsScreenOverlay() {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.greenAccent.withOpacity(0.9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('lib/assets/Home_screen/education.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aman',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Carbon Credits Earned',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ProfileDetails(
              challengeoverlay: _openChallengeScreenOverlay,
              achievementoverlay: _openAchievementsScreenOverlay,
              personaldetailsoverlay: _openPersonalDetailsScreenOverlay,
              projectoverlay: _openProjectScreenOverlay,

            ),
          ],
        ),
      ),
    );
  }
}
