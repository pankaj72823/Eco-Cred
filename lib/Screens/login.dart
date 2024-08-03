import 'dart:convert';
import 'package:ecocred/Provider/answers_provider.dart';
import 'package:ecocred/Provider/result_provider.dart';
import 'package:ecocred/Screens/Slides/slides_transportation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


final tokenProvider = StateProvider<String?>((ref)=>null);
class Login extends ConsumerStatefulWidget {
  @override
  ConsumerState<Login> createState() => _Login();

}

class _Login extends ConsumerState<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

  void dispose(){
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  Future<void> _login() async {
    if(formKey.currentState?.validate() ??false ) {
      final username = usernameController.text;
      final password = passwordController.text;

      final response = await http.post(
        Uri.parse("http://192.168.43.188:5050/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      print('error loaded');
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final token = data['token'];
          ref.read(questionnaireProvider.notifier).setToken(token);
          ref.read(resulttokenProvider.notifier).set(token);
          print(token);
          print('Login Succesful');
          Navigator.push(
            context, MaterialPageRoute(
            builder: (ctx) => Login(),
          ),
          );


          print('update');
        }
        else {
          // Handle error response
          print('Login failed: ${response.statusCode}');
        }
      }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome back ! Time to resume your green journey',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),child:
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.verified_user),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your Username';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),

                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),child:
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your reason of using Eco Cred';
                      }
                      return null;
                    },
                    obscureText: !passwordVisible,
                  ),
                  ),
                  const SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           rememberMe = !rememberMe;
                  //         });
                  //       },
                  //       child: Row(
                  //         children: [
                  //           Checkbox(
                  //             value: rememberMe,
                  //             onChanged: (bool? value) {
                  //               setState(() {
                  //                 rememberMe = value!;
                  //               });
                  //             },
                  //           ),
                  //           Text('Remember'),
                  //         ],
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         // Handle "Forgot your password?"
                  //       },
                  //       child: Text('Forgot your password?'),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()  async {
                       await _login();
                         Navigator.push(
                          context, MaterialPageRoute(
                          builder: (ctx)=> SlidesTransportation(),
                        ),
                        );
                      },

                        // if (formKey.currentState?.validate() ?? false) {
                        //
                        // }

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Or log in with'),
                      SizedBox(width: 8),
                      ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            // backgroundColor: Colors.tealAccent.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                        child: IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.g_mobiledata,
                            size: 45,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
