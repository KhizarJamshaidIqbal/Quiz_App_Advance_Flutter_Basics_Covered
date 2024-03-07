// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/features/result_screen/summary_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onReStart,
  });
  final List<String> chosenAnswer;
  final void Function() onReStart;

  void rest() {}
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60.0),
                Image.asset(
                  "assets/images/trophy.png",
                  width: 150,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Congratulations',
                  style: GoogleFonts.kodeMono(
                    textStyle: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Your Score',
                  style: GoogleFonts.kodeMono(
                    textStyle:
                        const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  '$numCorrectQuestion/$numTotalQuestion',
                  style: GoogleFonts.kodeMono(
                    textStyle:
                        const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                QuestionSummary(summaryData),
                TextButton(
                  onPressed: onReStart,
                  child: Text(
                    'Try Again',
                    style: GoogleFonts.kodeMono(
                      textStyle: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationStyle: TextDecorationStyle.dashed),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
