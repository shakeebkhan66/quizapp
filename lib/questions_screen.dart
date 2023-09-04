import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/constants/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/timer_widget.dart';

class QuestionScreen extends StatefulWidget {
  
  final Function(String answer)? onSelectedAnswers;
  const QuestionScreen({this.onSelectedAnswers});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  // TODO Answer Questions Function, Pressing the Tab Move on the Next Question
  void answerQuestions(String selectedAnswer){
    widget.onSelectedAnswers!(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  // TODO Change Question After 15 Seconds
  changeQuestionsAfterFifteenSecond(){
    setState(() {
      currentQuestionIndex++;
    });
  }


  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex];

    Timer(const Duration(seconds: 5), () {
      print("Questions ${questions.length}");
        answerQuestions("Not Selected");
    });


    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TimerWidget(answerQuestionFunc: answerQuestions,),
            const SizedBox(height: 20.0,),
            Text(
              currentQuestion.question,
              style: GoogleFonts.acme(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestions(answer);
              });
            }),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: (){}),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: (){}),
          ],
        ),
      ),
    );
  }
}
