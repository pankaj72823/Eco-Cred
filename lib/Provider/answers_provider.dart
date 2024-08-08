import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnswersProvider extends StateNotifier<List<Map<String, String>>> {
  AnswersProvider() : super([]);
  String? _token;
  void setToken(String token){
    _token = token;
  }


  void addAnswer(String question, String answer) {
    state = [
      for (final answer in state)
        if (answer['question'] != question) answer,
      {'question': question, 'answer': answer},
    ];
  }
  Future<void> submitAnswers() async {

    // final token = ref.watch(userTokenProvider);
    final response = await http.post(
      Uri.parse('http://localhost:5050/answers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'token': _token,
        'data': state,
      }),
    );

    if (response.statusCode == 200) {
      print("Successful");

    } else {
      print("Error is there");
    }
  }
}

final questionnaireProvider =
StateNotifierProvider<AnswersProvider, List<Map<String, String>>>(
      (ref) => AnswersProvider(),
);
