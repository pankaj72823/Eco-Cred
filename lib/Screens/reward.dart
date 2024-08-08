// import 'package:ecocred/Widgets/Rewards/levels.dart';
// import 'package:ecocred/Widgets/Rewards/present_rewards.dart';
// import 'package:ecocred/Widgets/Rewards/upcoming_rewards.dart';
//
// import 'package:flutter/material.dart';
//
// class Reward extends StatefulWidget{
//   const Reward({super.key});
//
//   @override
//   State<Reward> createState() {
//     return _Reward();
//   }
//
// }
//
// class _Reward extends State<Reward> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Align(
//                 alignment: Alignment.center,
//                 child: const Text(
//                   'Rewards',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 10,),
//             Levels(userLevel: 1,),
//             UpcomingRewards(),
//             const SizedBox(height: 20,),
//             PresentRewards(),
//
//           ],
//         ),
//       )
//     );
//   }
//
// }


import 'package:ecocred/Provider/rewards_provider.dart';
import 'package:ecocred/Widgets/Rewards/upcoming_rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecocred/Widgets/Rewards/upcoming_card.dart';
import 'package:ecocred/Widgets/Rewards/rewardCard.dart';
import 'package:ecocred/Widgets/Rewards/levels.dart'; // Import your Levels widget if needed

class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewardsAsyncValue = ref.watch(rewardsProvider);

    return Scaffold(
      body: rewardsAsyncValue.when(
        data: (data) {
          // Ensure data is not null and contains expected keys
          final presentRewards = data?['rewards_completed'] ?? {};
          final upcomingRewards = data?['upcoming_reward'] ?? {};

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Rewards',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Upcoming Rewards',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 200, // Adjust height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: presentRewards['easy']?.length ?? 0,
                    itemBuilder: (context, index) {
                      final reward = presentRewards['easy']?[index] ?? {};
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RewardCard(
                          level: reward['level']?.toString() ?? 'N/A',
                          reward: reward['reward'] ?? 'N/A',
                          difficulty: reward['difficulty'] ?? 'N/A',
                          file: reward['file'] ?? 'N/A',
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Present Rewards',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200, // Adjust height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: presentRewards['easy']?.length ?? 0,
                    itemBuilder: (context, index) {
                      final reward = presentRewards['easy']?[index] ?? {};
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RewardCard(
                          level: reward['level']?.toString() ?? 'N/A',
                          reward: reward['reward'] ?? 'N/A',
                          difficulty: reward['difficulty'] ?? 'N/A',
                          file: reward['file'] ?? 'N/A',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error\nStack trace: $stack')),
      ),
    );
  }
}
