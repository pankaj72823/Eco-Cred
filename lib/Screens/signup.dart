import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String? gender;
  String? preference;
  // bool rememberMe = false;
  bool passwordVisible = false;

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
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                    obscureText: !passwordVisible,
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
                    decoration: InputDecoration(
                      labelText: 'Profession',
                      prefixIcon: Icon(Icons.work),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Preference',
                      prefixIcon: Icon(Icons.list),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: preference,
                    onChanged: (String? newValue) {
                      setState(() {
                        preference = newValue;
                      });
                    },
                    items: <String>[
                      'Clothing',
                      'Electronics',
                      'Home Appliances',
                      'Furniture',
                      'Beauty Products'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                  // SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          // Handle signup
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Or sign up with'),
                      SizedBox(width: 8),
                      ElevatedButton(onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           // backgroundColor: Colors.tealAccent.withOpacity(0.3),
                           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10),
                           )
                         ),
                          child: IconButton(
                        onPressed: () {
                          // Handle Google signup
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
