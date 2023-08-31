import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  String? answerText;
  void Function() onTap;

  AnswerButton({required this.answerText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0)
      ),
      child: Text(
        answerText.toString(),
        style: const TextStyle(color: Colors.indigo, fontSize: 12.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
