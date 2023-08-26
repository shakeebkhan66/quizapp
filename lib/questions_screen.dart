import 'package:flutter/material.dart';
import 'package:quizapp/constants/answer_button.dart';
import 'package:quizapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[0];

    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ...currentQuestion.answers.map((answer){
            return AnswerButton(answerText: answer, onTap: (){});
          }),
          // AnswerButton(answerText: currentQuestion.answers[0], onTap: (){}),
          // AnswerButton(answerText: currentQuestion.answers[1], onTap: (){}),
          // AnswerButton(answerText: currentQuestion.answers[2], onTap: (){}),
          // AnswerButton(answerText: currentQuestion.answers[3], onTap: (){}),
        ],
      ),
    );
  }
}
