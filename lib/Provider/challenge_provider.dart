import 'package:ecocred/Provider/token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class Challenge{
  final String category;
  final String challenge;
  final int timetoComplete;
  final String difficulty;
  final String id;

  Challenge({
        required this.category,
        required this.challenge,
        required this.timetoComplete,
        required this.difficulty,
        required this.id,
      });

  factory Challenge.fromJson(Map<String,dynamic> json){
    return Challenge(
        category: json['category'],
        challenge: json['challenge'],
        timetoComplete: json['timetoComplete'],
        difficulty: json['difficulty'],
        id: json['id'],
    );
  }

  static List<Challenge> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Challenge.fromJson(json)).toList();
  }
}

// final tokenProvider = StateProvider<String?>((ref) => null);

// class TokenNotifier extends StateNotifier< String> {
//   TokenNotifier() : super('');
//
//   void set(String token) {
//     state = token;
//   }
// }
final tokenProvider = StateNotifierProvider<TokenNotifier, String?>((ref) => TokenNotifier());
final ChallengeProvider = FutureProvider<Map<String,dynamic>>((ref) async{

  final token = ref.watch(userTokenProvider);

  if(token==null){
    throw Exception('Token not available');
  }
  final response = await http.post(
      Uri.parse('http://192.168.43.188:5050/challenges'),
      headers: {
     'Content-Type': 'application/json; charset=UTF-8',
      'token': token,
  },);
  print(response.statusCode);
  if(response.statusCode==200){
    final Map<String,dynamic> data = json.decode(response.body);
    return {
      'easy' : Challenge.fromJsonList(data['easy']),
      'medium' : Challenge.fromJsonList(data['medium']),
      'hard' : Challenge.fromJsonList(data['hard']),
    };
  } else{
    throw Exception('Failed to send data');
  }
},
);

