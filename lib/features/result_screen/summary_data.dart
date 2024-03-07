// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .46,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Column(
            children: summaryData.map((data) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.kodeMono(
                          textStyle: const TextStyle(
                              fontSize: 16.0, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q:" + ((data['question'] as String)),
                            style: GoogleFonts.kodeMono(
                              textStyle: const TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          Text(
                            'Correct Answer:' +
                                ((data['correct_answer'] as String)),
                            style: GoogleFonts.kodeMono(
                              textStyle: const TextStyle(
                                  fontSize: 16.0, color: Colors.green),
                            ),
                          ),
                          Text(
                            "User Answer: " + ((data['user_answer'] as String)),
                            style: GoogleFonts.kodeMono(
                              textStyle: const TextStyle(
                                  fontSize: 16.0, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
