import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecocred/Provider/activation_provider.dart';
import 'package:ecocred/Provider/challenge_provider.dart';

class ChallengeCard extends ConsumerWidget {
  const ChallengeCard({super.key, required this.challenge});
  final Challenge challenge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activationState = ref.watch(ActivationProvider);
    final isActivated = activationState[challenge.id] ?? false;

    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isActivated ? [Colors.green[100]!, Colors.green[200]!] : [Colors.lightGreen[50]!, Colors.lightGreen[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                challenge.challenge,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: isActivated ? Colors.green[800] : Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(isActivated ? 16 : 8),
                child: Text(
                  'Category: ${challenge.category}',
                  style: TextStyle(
                    fontSize: 16,
                    color: isActivated ? Colors.green[800] : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.all(isActivated ? 16 : 8),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: isActivated ? Colors.green[800] : Colors.red),
                        const SizedBox(width: 4),
                        Text(
                          'Time: ${challenge.timetoComplete} min',
                          style: TextStyle(
                            fontSize: 16,
                            color: isActivated ? Colors.green[800] : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: isActivated
                        ? null
                        : () async {
                      try {
                        await ref.read(ActivationProvider.notifier).activateChallenge(challenge.id);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to activate challenge: $e')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      side: const BorderSide(color: Colors.black, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}
