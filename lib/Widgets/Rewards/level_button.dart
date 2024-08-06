import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LevelButton extends StatefulWidget {
  final String level;
  const LevelButton({super.key, required this.level});

  @override
  _LevelButtonState createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  bool _isClicked = false;

  void _animateButton() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animateButton,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.greenAccent.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: _isClicked
            ? AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              widget.level,
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              colors: [
                Colors.green,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],
            ),
          ],
          isRepeatingAnimation: false,
          onFinished: () {
            setState(() {
              _isClicked = false;
            });
          },
        )
            : Text(
          widget.level,
          style: TextStyle(
            color: Colors.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
