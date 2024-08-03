import 'package:ecocred/Provider/questions_provider.dart';
import 'package:ecocred/Widgets/Slides_Widgets/questions_card.dart';
import 'package:ecocred/Widgets/Slides_Widgets/slides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SlidesMiscellaneous extends ConsumerWidget {
  const SlidesMiscellaneous({super.key});

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final questionsAsyncValue = ref.watch(questionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Questions',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 8,
        ),
      body: questionsAsyncValue.when(
        loading: () => Center(child: LinearProgressIndicator(
          backgroundColor: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          minHeight: 20,
        ),
        ),
        error: (error, stack) => Center(child: Text('Failed to load questions')),
        data: (questions) {
          final transportationQuestions = questions.where((question)=> question['category'] == 'miscellaneous').toList();
          return ListView.builder(
            itemCount: transportationQuestions.length,
            itemBuilder: (context, index) {
              var question = transportationQuestions[index];
              return Slides(question: question, isFinalQuestion: index== transportationQuestions.length -1,category: 'miscellaneous');
            },

          );
        },
      ),
    );
  }
}
