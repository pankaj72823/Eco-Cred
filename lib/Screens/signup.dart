
import 'dart:convert';

import 'package:ecocred/Provider/activation_provider.dart';
import 'package:ecocred/Provider/token_provider.dart';
import 'package:ecocred/Screens/Slides/slides_transportation.dart';
import 'package:ecocred/Screens/tabsScreen.dart';
import 'package:ecocred/Provider/answers_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Signup();

}

class _Signup extends ConsumerState<Signup> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phone_numberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController professionController = TextEditingController();


  String? gender;
  String? why_EcoCred;
  bool passwordVisible = false;

  void dispose(){
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phone_numberController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    professionController.dispose();
  }

  Future<void> _signup() async {
    if(formKey.currentState?.validate() ??false ){
      final name = nameController.text;
      final email = emailController.text;
      final phone_number = phone_numberController.text;
      final username = usernameController.text;
      final password = passwordController.text;
      final profession = professionController.text;

      final response = await http.post(
        Uri.parse("http://192.168.43.188:5050/auth/signup"),
        headers: {'Content-Type' : 'application/json'},
        body: jsonEncode({
          'name' : name,
          'email' : email,
          'phone_number' : phone_number,
          'username' : username,
          'password' : password,
          'gender' : gender,
          'profession' : profession,
          'why_EcoCred' : why_EcoCred,
        }),
      );
      print('pankaj');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(response.statusCode ==200){
        final data = jsonDecode(response.body);
        final token  = data['token'];
        ref.read(userTokenProvider.notifier).setToken(token);
        ref.read(questionnaireProvider.notifier).setToken(token);
        ref.read(ActivationProvider.notifier).setToken(token);
        // ref.read(resulttokenProvider.notifier).set(token);
        // ref.read(tokenProvider.notifier).set(token);
        print(token);
        print(" Sign up Successful");
        Navigator.push(
            context, MaterialPageRoute(
            builder: (ctx)=> Signup(),
            ),
        );
      }
      else{
        print("There is error");
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
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create a new Account',
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
                    'Fill your details to start tracking your emission',
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
                ),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
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
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
              ),
              const SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child:
              IntlPhoneField(
                  controller: phone_numberController,
                decoration: InputDecoration(
                  labelText: 'Phone_number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                  validator: (value) {
                    if(value == null || value.isValidNumber()){
                      return 'Please enter your Phone Number';
                    }
                    return null;
                  },
                initialCountryCode: 'US',
                onChanged: (phone) {
                }
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
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
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
                  ),
              ),
                  const SizedBox(height: 10),
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
                        return 'Please enter your Password';
                      }
                      return null;
                    },
                    obscureText: !passwordVisible,
                  ),
              ),
                  const SizedBox(height: 10),
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
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      // prefixIcon: Icon(Icons.transgender_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                    value: gender,
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue;
                      });
                    },
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your Gender';
                      }
                      return null;
                    },
                  ),
              ),
                  const SizedBox(height: 10),
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
                    controller: professionController,
                    decoration: InputDecoration(
                      labelText: 'Profession',
                      prefixIcon: Icon(Icons.work),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your Profession';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
              ),
                  const SizedBox(height: 10),
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
                  DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Why EcoCred?',
                        // prefixIcon: Icon(Icons.list),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      value: why_EcoCred,
                      onChanged: (String? newValue) {
                        setState(() {
                          why_EcoCred = newValue;
                        });
                      },
                      items: <String>[
                        'Environment Conservation',
                        'Rewards',
                        'Rewards and Enovironment Conservation both',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your reason of using Eco Cred';
                      }
                      return null;
                    },
                    ),
              ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _signup();
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (ctx)=> SlidesTransportation(),
                        ),
                        );
                      },
                      // onPressed: () {
                      //   if (formKey.currentState?.validate() ?? false) {
                      //     // Handle signup
                      //   }
                      // },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Signup',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text('Or sign up with'),
                  //     SizedBox(width: 8),
                  //     ElevatedButton(onPressed: () {},
                  //        style: ElevatedButton.styleFrom(
                  //          // backgroundColor: Colors.tealAccent.withOpacity(0.3),
                  //          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  //          shape: RoundedRectangleBorder(
                  //            borderRadius: BorderRadius.circular(10),
                  //          )
                  //        ),
                  //         child: IconButton(
                  //       onPressed: () {
                  //       },
                  //       icon: const Icon(
                  //         Icons.g_mobiledata,
                  //         size: 45,
                  //         color: Colors.red,
                  //       ),
                  //     ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
