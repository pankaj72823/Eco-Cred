// levels.dart
import 'package:ecocred/Widgets/Challenges_Widget/challenge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecocred/Widgets/Challenges_Widget/single_level_row.dart';
import 'package:ecocred/Provider/challenge_provider.dart';

// class Levels extends ConsumerWidget {
//   const Levels({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final challengeData = ref.watch(ChallengeProvider);
//
//     return challengeData.when(
//       data: (challenges) {
//         return Column(
//           children: [
//             const SizedBox(height: 30,),
//             SingleLevelRow(
//                 level: 'Easy Level', challenges: challenges['easy']!),
//             const SizedBox(height: 30,),
//             SingleLevelRow(
//                 level: 'Medium Level', challenges: challenges['medium']!),
//             const SizedBox(height: 30,),
//             SingleLevelRow(
//                 level: 'Hard Level', challenges: challenges['hard']!),
//           ],
//         );
//       },
//       loading: () => Center(child: CircularProgressIndicator()),
//       error: (err, stack) => Center(child: Text('Error: $err')),
//     );
//   }
// }
//
//   Widget _buildLevelRow(BuildContext context, String level, List<Challenge> challenges) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Icon(Icons.leaderboard, color: Colors.green, size: 30),
//             const SizedBox(width: 10),
//             Text(
//               level,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: challenges.map((challenge) => ChallengeCard(challenge: challenge)).toList(),
//           ),
//         ),
//       ],
//     );
//   }





// import 'package:ecocred/Widgets/Challenges_Widget/challenge_card.dart';
// import 'package:flutter/material.dart';
//
// class Levels extends StatefulWidget{
//   const Levels({super.key});
//
//   @override
//   State<Levels> createState() {
//     return _Levels();
//   }
//
// }
//
// class _Levels extends State<Levels>{
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//             children: [
//               const SizedBox(height: 30,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(Icons.leaderboard, color: Colors.green, size: 30),
//                   const SizedBox(width: 10),
//                   Text(
//                     'Easy level',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     ChallengeCard(),
//                     ChallengeCard(),
//                     ChallengeCard(),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(Icons.leaderboard, color: Colors.green, size: 30),
//                   const SizedBox(width: 10),
//                   Text(
//                     'Medium level',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     ChallengeCard(),
//                     ChallengeCard(),
//                     ChallengeCard(),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(Icons.leaderboard, color: Colors.green, size: 30),
//                   const SizedBox(width: 10),
//                   Text(
//                     'Hard Level ',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     ChallengeCard(),
//                     ChallengeCard(),
//                     ChallengeCard(),
//                   ],
//                 ),
//               ),
//             ],
//     );
//   }
//
// }

class Levels extends ConsumerWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengeData = ref.watch(ChallengeProvider);

    return challengeData.when(
      data: (challenges) {
        return Column(
          children: [
            const SizedBox(height: 30,),
            SingleLevelRow(
                level: 'Easy Level', challenges: challenges['easy'] ?? []),
            const SizedBox(height: 30,),
            SingleLevelRow(
                level: 'Medium Level', challenges: challenges['medium'] ?? []),
            const SizedBox(height: 30,),
            SingleLevelRow(
                level: 'Hard Level', challenges: challenges['hard'] ?? []),
          ],
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
