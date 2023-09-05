import 'dart:async';
import 'package:flutter/material.dart';

import 'data/questions.dart';

class TimerWidget extends StatefulWidget {


  void Function(String answer) answerQuestionFunc;

  TimerWidget({required this.answerQuestionFunc});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _secondsRemaining = 8; // Initial timer duration in seconds
  Timer? _timer;
  int _currentQuestionIndex = 0; // Track the current question index


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        if (_currentQuestionIndex < questions.length - 1) {
          // Move to the next question if available
          setState(() {
            _currentQuestionIndex++;
            _secondsRemaining = 8; // Reset the timer for the next question
          });
          startTimer(); // Start the timer for the next question
        } else {
          // All questions answered, navigate to the result screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResultScreen(),
            ),
          );
        }
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Question ${_currentQuestionIndex + 1}',
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          'Timer: $_secondsRemaining',
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: const Center(
        child: Text('Congratulations! You have completed all questions.'),
      ),
    );
  }
}
