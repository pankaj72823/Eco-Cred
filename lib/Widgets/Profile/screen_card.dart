import 'package:flutter/material.dart';

class ScreenCard extends StatelessWidget{
  const ScreenCard({super.key, required this.name, required this.overlaymain});

  final String name;
  final VoidCallback overlaymain;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 12,
        shadowColor: Colors.grey,
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
            ),
            IconButton(onPressed: () {},

                icon: Icon(Icons.arrow_right, size: 50,),
            ),
          ],
        ),
    ),
    );
  }

}