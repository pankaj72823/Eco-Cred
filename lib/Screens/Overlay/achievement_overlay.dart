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
        content: ListView.builder(
          itemCount: user.achievements.length,
          itemBuilder: (context, index) {
            final achievement = user.achievements[index];
            return ListTile(
              leading: Image.asset('assets/images/${achievement['file']}'),
              title: Text(achievement['reward']),
              subtitle: Text(achievement['description']),
            );
          },
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
        content: Text('Failed to load achievements'),
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

// import 'package:flutter/material.dart';
//
// class AchievementOverlay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy data for achievements
//     final achievements = [
//       {
//         "file": "assets/images/green_commute_badge.jpeg",
//         "reward": "🏅 Green Commute Champion Badge",
//         "description": "Earn the prestigious Green Commute Champion Badge! Flaunt your dedication to a greener world.",
//       },
//       {
//         "file": "assets/images/5_percent_discount_coupon.jpeg",
//         "reward": "💸 5% Discount on Eco-Friendly Products",
//         "description": "Enjoy a 5% discount on eco-friendly products. Save money while saving the planet!",
//       },
//       {
//         "file": "assets/images/order_summary.jpeg",
//         "reward": "🛍️ Premium Set of Reusable Eco-Friendly Bags",
//         "description": "Receive a stylish premium set of reusable eco-friendly bags. Carry your groceries sustainably and in style.",
//       },
//     ];
//
//     return AlertDialog(
//       title: Text('Achievements'),
//       content: ListView.builder(
//         shrinkWrap: true,
//         itemCount: achievements.length,
//         itemBuilder: (context, index) {
//           final achievement = achievements[index];
//           return SingleChildScrollView(
//             child: ListTile(
//               // leading: Image.asset(achievement['file']!),
//               title: Text('reward'),
//               subtitle: Text('description'),
//             ),
//           );
//         },
//       ),
//       // actions: <Widget>[
//       //   TextButton(
//       //     onPressed: () => Navigator.of(context).pop(),
//       //     child: Text('Close'),
//       //   ),
//       // ],
//     );
//   }
// }


// import 'package:ecocred/Provider/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class AchievementOverlay extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userAsyncValue = ref.watch(userProvider);
//
//     return userAsyncValue.when(
//       data: (user) => AlertDialog(
//         title: Text('Achievements'),
//         content: ListView.builder(
//           shrinkWrap: true,
//           itemCount: user.achievements.length,
//           itemBuilder: (context, index) {
//             final achievement = user.achievements[index];
//             return ListTile(
//               leading: Image.asset(achievement['file']),
//               title: Text(achievement['reward']),
//               subtitle: Text(achievement['description']),
//             );
//           },
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('Close'),
//           ),
//         ],
//       ),
//       loading: () => Center(child: CircularProgressIndicator()),
//       error: (error, stack) => AlertDialog(
//         title: Text('Error'),
//         content: Text('Failed to load achievements'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DummyAchievementOverlay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy data for achievements
//     final achievements = [
//       {
//         "file": "assets/images/green_commute_badge.jpeg",
//         "reward": "🏅 Green Commute Champion Badge",
//         "description": "Earn the prestigious Green Commute Champion Badge! Flaunt your dedication to a greener world.",
//       },
//       {
//         "file": "assets/images/5_percent_discount_coupon.jpeg",
//         "reward": "💸 5% Discount on Eco-Friendly Products",
//         "description": "Enjoy a 5% discount on eco-friendly products. Save money while saving the planet!",
//       },
//       {
//         "file": "assets/images/order_summary.jpeg",
//         "reward": "🛍️ Premium Set of Reusable Eco-Friendly Bags",
//         "description": "Receive a stylish premium set of reusable eco-friendly bags. Carry your groceries sustainably and in style.",
//       },
//     ];
//
//     return AlertDialog(
//       title: Text('Achievements'),
//       content: ListView.builder(
//         shrinkWrap: true,
//         itemCount: achievements.length,
//         itemBuilder: (context, index) {
//           final achievement = achievements[index];
//           return ListTile(
//             leading: Image.asset(achievement['file']!),
//             title: Text(achievement['reward']!),
//             subtitle: Text(achievement['description']!),
//           );
//         },
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text('Close'),
//         ),
//       ],
//     );
//   }
// }

