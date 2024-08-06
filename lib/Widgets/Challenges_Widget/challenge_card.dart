
import 'package:ecocred/Provider/activation_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecocred/Provider/challenge_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeCard extends ConsumerWidget {
  const ChallengeCard({super.key, required this.challenge});
  final Challenge challenge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activationState = ref.watch(ActivationProvider);
    final isActivated = activationState[challenge.id] ?? false;

    return Card(
      color: isActivated ? Colors.green[100] : Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: Colors.grey.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              challenge.challenge,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Icon(
              Icons.account_circle_rounded,
              color: Colors.greenAccent,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              'Category: ${challenge.category}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time: ${challenge.timetoComplete} minutes',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 35,),
                ElevatedButton(
                  onPressed: isActivated ? null : () async {
                    try {
                      await ref.read(ActivationProvider.notifier).activateChallenge(challenge.id);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to activate challenge: $e')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    side: BorderSide(color: Colors.black, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Activate',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// class ChallengeCard extends ConsumerWidget{
//   const ChallengeCard({super.key, required this.challenge});
//   final Challenge challenge;
//
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Card(
//       color: Colors.white,
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       shadowColor: Colors.grey.withOpacity(0.5),
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               challenge.challenge,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Icon(
//               Icons.account_circle_rounded,
//               color: Colors.greenAccent,
//               size: 40,
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Category: ${challenge.category}',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Time: ${challenge.timetoComplete} minutes',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.red,
//                   ),
//                 ),
//                 const SizedBox(width: 35,),
//                 ElevatedButton(
//                   onPressed: () async {
//                     ref.read(ActivationProvider.notifier).activateChallenge(challenge.id);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.redAccent.withOpacity(0.8),
//                     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                     side: BorderSide(color: Colors.black, width: 2),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                   child: const Text(
//                     'Activate',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



