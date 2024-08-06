import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecocred/Widgets/Rewards/upcoming_card.dart';

class UpcomingRewards extends ConsumerWidget {
  const UpcomingRewards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingRewardsAsyncValue = ref.watch(rewardsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.upcoming, color: Colors.red, size: 40,),
              const SizedBox(width: 10,),
              Text(
                'Upcoming Rewards',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        upcomingRewardsAsyncValue.when(
          data: (data) {
            final upcomingRewards = data['upcoming_reward'] as Map<String, dynamic>;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: upcomingRewards.entries.map((entry) {
                  final reward = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: UpcomingCard(
                      level: reward['level'].toString(),
                      reward: reward['reward'],
                      difficulty: reward['difficulty'],
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
