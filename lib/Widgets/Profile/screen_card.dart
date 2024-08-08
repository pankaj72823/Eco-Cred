import 'package:flutter/material.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({super.key, required this.name, required this.overlaymain});

  final String name;
  final VoidCallback overlaymain;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: overlaymain,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
