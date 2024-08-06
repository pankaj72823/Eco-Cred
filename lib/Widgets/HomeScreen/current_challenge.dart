import 'package:flutter/material.dart';

class CurrentChallenge extends StatelessWidget {
  const CurrentChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      shadowColor: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Public Transportation week Challenge',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                minHeight: 20,
                value: 0.8,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Reduce your transportation by Car',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
