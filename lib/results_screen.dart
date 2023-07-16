import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summary.dart';

import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var index = 0; index < chosenAnswers.length; index++) {
      summary.add({
        'question_index': index,
        'question': questions[index].text,
        'correct_answer': questions[index].answers[0],
        'user_answer': chosenAnswers[index]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: summaryData),
              const SizedBox(height: 30),
              TextButton.icon(
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: onRestart,
                label: const Text('Restart Quiz!'),
              )
            ],
          ),
        ));
  }
}
