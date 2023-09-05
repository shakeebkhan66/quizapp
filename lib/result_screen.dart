import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary.dart';
import 'package:quizapp/questions_screen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key,  this.chosenAnswers, required this.onRestart});

  final List<String>? chosenAnswers;
  final void Function()? onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers!.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].question,
        'correct_answers': questions[i].answers[0],
        'user_answers': chosenAnswers![i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((e) => e['user_answers'] == e['correct_answers'])
        .length;

    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 18.0)),
            const SizedBox(
              height: 30.0,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30.0,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              label: Text(
                "Restart Quiz!",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
