import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;

  const QuestionScreen({super.key, required this.onSelectAnswer});
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  // int? selectedAnswerIndex;

  // void selectAnswer(int index) {
  //   setState(() {
  //     selectedAnswerIndex = index;
  //   });
  // }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
    // if (selectedAnswerIndex != null) {
    //   final currentQuestion = questions[currentQuestionIndex];
    //   widget.onSelectAnswer(
    //       currentQuestion.getShuffleAnswers()[selectedAnswerIndex!]);
    //   setState(() {
    //     widget.onSelectAnswer(
    //         currentQuestion.getShuffleAnswers()[selectedAnswerIndex!]);
    //     currentQuestionIndex++;
    //     selectedAnswerIndex = null;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/flutter_logo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      '1)',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kodeMono(
                        textStyle: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      currentQuestion.text,
                      style: GoogleFonts.kodeMono(
                        textStyle: const TextStyle(
                            fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return InkWell(
                onTap: () => answerQuestion(answer),
                child: Container(
                  margin:
                      const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white),
                  ),
                  height: 50.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15.0,
                        ),
                        const CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              answer,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: GoogleFonts.kodeMono(
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            const Spacer(),
            // const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: SizedBox(
            //     height: 50.0,
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromARGB(255, 16, 98, 221),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8.0),
            //         ),
            //       ),
            //       onPressed: () => answerQuestion,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             'Next',
            //             style: GoogleFonts.kodeMono(
            //               textStyle: const TextStyle(
            //                   fontSize: 20.0, color: Colors.white),
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 10.0,
            //           ),
            //           const Icon(
            //             Icons.arrow_right_alt_rounded,
            //             color: Colors.white,
            //             size: 30.0,
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 50.0,
            // ),
          ],
        ),
      ),
    );
  }
}
