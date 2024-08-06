import 'package:ecocred/Provider/rewards_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecocred/Widgets/Rewards/rewardCard.dart';

class PresentRewards extends ConsumerWidget {
  const PresentRewards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewardsAsyncValue = ref.watch(rewardsProvider);

    return Column(
      children: [
        const SizedBox(width: 10),
        Row(
          children: [
            Icon(Icons.nature, color: Colors.red, size: 40,),
            const SizedBox(width: 10,),
            Text(
              'Present Rewards',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
        rewardsAsyncValue.when(
          data: (data) {
            final presentRewards = data['rewards_completed']['easy'] as List<dynamic>;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: presentRewards.map((rewardData) {
                  final reward = rewardData as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RewardCard(
                      level: reward['level'].toString(),
                      reward: reward['reward'],
                      difficulty: reward['difficulty'],
                      file: reward['file'],
                    ),
                  );
                }).toList(),
              ),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }
}
