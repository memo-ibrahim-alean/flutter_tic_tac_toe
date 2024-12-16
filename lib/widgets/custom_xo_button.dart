import 'package:flutter/material.dart';

class CustomXoButton extends StatelessWidget {
  final String text;
  final Function() onPress;

  const CustomXoButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 100,
            color: text == "x" ? Colors.blue : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
