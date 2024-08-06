
import 'package:ecocred/Screens/Slides/slides_diet.dart';
import 'package:ecocred/Screens/home_screen.dart';
import 'package:ecocred/Screens/login.dart';
import 'package:ecocred/Screens/signup.dart';
import 'package:ecocred/Screens/Slides/slides_transportation.dart';
import 'package:ecocred/Screens/tabsScreen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget{
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(0.7),
      body: Padding(
        
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage('lib/assets/Welcome_Screen/welcome2.png'),
                ),
                SizedBox(height: 30,),
                const Text(
                  'Welcome to Carbon Credits ',
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
                      ]
                  ),
                  textAlign: TextAlign.center,

                ),
                const Text(
                  'Track your carbon footprint and get your rewards ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.black, // Filled circle
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10), // Space between dots
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black), // Outlined circle
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10), // Space between dots
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black), // Outlined circle
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () => Navigator.push(
                      context, MaterialPageRoute(
                        builder: (ctx) => Login(),
                    ),), child:
                    Text('Log in',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                        ]
                    ),
                    ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(20),
                          side: BorderSide(color: Colors.black, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                      ),
                    ),
                    ElevatedButton(onPressed: () =>Navigator.push(
                      context, MaterialPageRoute(
                      builder: (ctx)=> Signup(),
                          // Signup(),
                    ),
                    ),child: Text('Join now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                        ]

                    ),
                    ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(0.8),
                          padding: EdgeInsets.all(20),
                          side: BorderSide(color: Colors.black, width: 2),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
      ),
    );
  }

}