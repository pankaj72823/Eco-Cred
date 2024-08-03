import 'package:ecocred/Provider/answers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionsCard extends ConsumerStatefulWidget {
  QuestionsCard({
    required this.question,
    required this.isFinalQuestion,
    required this.category,
  });

  final Map<String, dynamic> question;
  bool isFinalQuestion;
  final category;

  @override
  ConsumerState<QuestionsCard> createState() {
    return _QuestionsCard();
  }
}

class _QuestionsCard extends ConsumerState<QuestionsCard> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.teal,
            width: 2,
          ),
        ),
        elevation: 8,
        shadowColor: Colors.tealAccent.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question['question'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              SizedBox(height: 16),
              if (widget.question['options'].isNotEmpty)
                StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      children: widget.question['options'].map<Widget>((option) {
                        return ListTile(
                          title: Text(option),
                          leading: Radio<String>(
                            value: option,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                              ref.read(questionnaireProvider.notifier).addAnswer(
                                widget.question['question'], value!,
                              );
                            },
                          ),
                        );
                      }).toList(),
                    );
                  },
                )
              else
                TextField(
                  onChanged: (value) {
                    ref.read(questionnaireProvider.notifier).addAnswer(
                      widget.question['question'], value,
                    );
                  },
                  decoration: InputDecoration(
                    labelText: 'Type your answer here',
                    labelStyle: TextStyle(color: Colors.teal.shade700),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}


// class QuestionsCard extends StatefulWidget{
//   const QuestionsCard({super.key});
//
//   @override
//   State<QuestionsCard> createState() {
//     return _QuestionsCard();
//   }
//
// }
//
//
// class _QuestionsCard extends State<QuestionsCard>{
//
//
//   String ? commute;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(16),
//         child: Container(
//           width: 100,
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.teal,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 4,
//                 blurRadius: 2,
//                 offset: Offset(0, 3),
//               ),
//             ]
//           ),
//           child: Column(
//             children: [
//               Text('How do you usually commute to School or work?'),
//               // DropdownButtonFormField<String>(
//               //   decoration: InputDecoration(
//               //     labelText:'commute',
//               //     // prefixIcon: Icon(Icons.transgender_rounded),
//               //     border: OutlineInputBorder(
//               //       borderRadius: BorderRadius.circular(10),
//               //     ),
//               //
//               //   ),
//               //   value: 'commute',
//               //   onChanged: (String? newValue) {
//               //     setState(() {
//               //       commute = newValue;
//               //     });
//               //   },
//               //   items: <String>['Male', 'Female', 'Other']
//               //       .map<DropdownMenuItem<String>>((String value) {
//               //     return DropdownMenuItem<String>(
//               //       value: value,
//               //       child: Text(value),
//               //     );
//               //   }).toList(),
//               //   validator: (value) {
//               //     if(value == null || value.isEmpty){
//               //       return 'Please enter your Gender';
//               //     }
//               //     return null;
//               //   },
//               // ),
//             ],
//           )
//         )
//     );
//   }
// }