import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecocred/Widgets/Challenges_Widget/current_challenge.dart';
import 'package:ecocred/Widgets/Challenges_Widget/levels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChallengesScreen();
  }
}

class _ChallengesScreen extends State<ChallengesScreen> with TickerProviderStateMixin {
  late final AnimationController _titleController;
  late final Animation<double> _titleAnimation;
  late final AnimationController _widgetController;
  late final Animation<Offset> _widgetAnimation;

  @override
  void initState() {
    super.initState();

    _titleController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _titleAnimation = CurvedAnimation(
      parent: _titleController,
      curve: Curves.easeIn,
    );

    _widgetController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _widgetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _widgetController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _widgetController.dispose();
    super.dispose();
  }

  final idProvider = StateProvider<String?>((ref)=> null);

  @override
  Widget build(BuildContext context) {

    // Future<bool> activation() async{
    //   final response = await http.post(
    //     Uri.parse('http://192.168.43.188:5050/activate'),
    //     headers: {'Content-Type': 'application/json'},
    //     body: jsonEncode({
    //       'id' :
    //     })
    //   )
    // }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: _titleAnimation,
                child: Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'Challenges',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('lib/assets/Home_screen/gemini.png', width: 25, height: 25,),
                  Text('Generated with Gemini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                ],
              ),
              const SizedBox(height: 30),
              SlideTransition(
                position: _widgetAnimation,
                child: const CurrentChallenge(),
                ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _widgetAnimation,
                child: Levels(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:ecocred/Widgets/Challenges_Widget/current_challenge.dart';
// import 'package:ecocred/Widgets/Challenges_Widget/levels.dart';
// import 'package:ecocred/Widgets/Challenges_Widget/new_challenges.dart';
// import 'package:flutter/material.dart';
//
// class ChallengesScreen extends StatefulWidget {
//   const ChallengesScreen({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ChallengesScreen();
//   }
//
// }
// class _ChallengesScreen extends State<ChallengesScreen>{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//               const Text('Challenges',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 30,),
//               CurrentChallenge(),
//               Levels(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
