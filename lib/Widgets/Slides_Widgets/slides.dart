import 'package:ecocred/Provider/answers_provider.dart';
import 'package:ecocred/Screens/Slides/results.dart';
import 'package:ecocred/Screens/Slides/slides_diet.dart';
import 'package:ecocred/Screens/Slides/slides_home_energy_usage.dart';
import 'package:ecocred/Screens/Slides/slides_miscellanous.dart';
import 'package:ecocred/Screens/Slides/slides_waste_management.dart';
import 'package:ecocred/Widgets/Slides_Widgets/questions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Slides extends ConsumerWidget {
  Slides({
    super.key,
    required this.question,
    required this.isFinalQuestion,
    required this.category,
  });

  final Map<String, dynamic> question;
  bool isFinalQuestion;
  final category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          QuestionsCard(
            question: question,
            isFinalQuestion: isFinalQuestion,
            category: category,
          ),
          if (isFinalQuestion)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (category == 'transportation')
                  _buildNavigationButton(
                    context,
                    'Home Energy Use',
                    SlidesHomeEnergyUsage(),
                  ),
                if (category == 'home_energy_use')
                  _buildNavigationButton(
                    context,
                    'Diet',
                    SlidesDiet(),
                  ),
                if (category == 'diet')
                  _buildNavigationButton(
                    context,
                    'Waste Management',
                    SlidesWasteManagement(),
                  ),
                if (category == 'waste_management')
                  _buildNavigationButton(
                    context,
                    'Miscellaneous',
                    SlidesMiscellaneous(),
                  ),
              ],
            ),
          if (category == 'miscellaneous')
            ElevatedButton(
              onPressed: () async {
                await ref.read(questionnaireProvider.notifier).submitAnswers();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ResultsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent.withOpacity(0.8),
                padding: EdgeInsets.all(20),
                side: BorderSide(color: Colors.black, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Submit your Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }

  ElevatedButton _buildNavigationButton(
      BuildContext context, String text, Widget destination) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => destination),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.tealAccent.withOpacity(0.8),
        padding: EdgeInsets.all(20),
        side: BorderSide(color: Colors.black, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
