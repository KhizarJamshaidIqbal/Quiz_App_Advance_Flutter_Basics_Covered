import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/flutter_logo.png',
            color: Colors.white.withOpacity(0.4),
            width: 150,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            "Let's Play!",
            style: GoogleFonts.kodeMono(
              textStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.double_arrow_sharp),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white)),
            label: Text(
              "Start Play",
              style: GoogleFonts.kodeMono(
                textStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
