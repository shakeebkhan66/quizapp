import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  Widget? currentScreen;

  @override
  void initState() {
    currentScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      currentScreen = const QuestionScreen();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.deepPurple,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
