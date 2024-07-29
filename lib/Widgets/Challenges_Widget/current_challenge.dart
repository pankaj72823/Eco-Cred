import 'package:flutter/material.dart';

class CurrentChallenge extends StatelessWidget{
  const CurrentChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              'Your Current Challenge',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10,),
            LinearProgressIndicator(
              minHeight: 20,
              borderRadius: BorderRadius.circular(10),
              value: 0.8,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
            ),
            const SizedBox(height: 10,),
            Text(
              'Reduce your Air conditioner usage by 30%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
