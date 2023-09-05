import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ListTile(
                    leading: Container(
                      height: 30.0,
                      width: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: data['user_answers'] == data['correct_answers'] ? Colors.green : Colors.red
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(data['questions'] as String,
                        style: GoogleFonts.acme(
                            color: Colors.white, fontSize: 14.0)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['user_answers'] as String,
                            style: GoogleFonts.acme(color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            data['correct_answers'] as String,
                            style: GoogleFonts.acme(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    trailing: data['user_answers'] == data['correct_answers']
                        ? const Icon(
                            Icons.done,
                            color: Colors.green,
                            size: 25.0,
                          )
                        : const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 25.0,
                          ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
