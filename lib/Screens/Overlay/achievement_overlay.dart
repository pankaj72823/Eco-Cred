import 'package:ecocred/Provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AchievementOverlay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return userAsyncValue.when(
      data: (user) => AlertDialog(
        title: Text('Achievements'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            children: [
              ...user.achievementsEasy.map((achievement) => ListTile(
                // leading: Image.asset('assets/images/${achievement['file']}'),
                title: Text(achievement['reward']),
                subtitle: Text(achievement['description']),
              )),
              ...user.achievementsMedium.map((achievement) => ListTile(
                // leading: Image.asset('assets/images/${achievement['file']}'),
                title: Text(achievement['reward']),
                subtitle: Text(achievement['description']),
              )),
              ...user.achievementsHard.map((achievement) => ListTile(
                // leading: Image.asset('assets/images/${achievement['file']}'),
                title: Text(achievement['reward']),
                subtitle: Text(achievement['description']),
              )),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => AlertDialog(
        title: Text('Error'),
        content: Text('Failed to load achievements: $error'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
