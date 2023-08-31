import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/clippath_class.dart';

class StartScreen extends StatelessWidget {
  void Function() quiz;

  StartScreen(this.quiz, {super.key});

  final String _imageUrl = "assets/images/quiz.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: ClipPath(
            clipper: ClipPathClass(),
            child: SizedBox(
              width: 150,
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  _imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.acme(color: Colors.white, letterSpacing: 1.5, fontSize: 18.0),
        ),
        const SizedBox(
          height: 40.0,
        ),
        OutlinedButton.icon(
            onPressed: quiz,
            icon: const Icon(
              Icons.arrow_forward_outlined,
              size: 25.0,
              color: Colors.white,
            ),
            label: const Text(
              "Let's Chat",
              style:
                  TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
