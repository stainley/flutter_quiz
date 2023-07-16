import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Row(
        children: [
          Icon(
            Icons.ice_skating,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Text('Would you like to start?'),
        ],
      ),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Action',
        onPressed: startQuiz,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: const Color.fromARGB(75, 255, 255, 255),
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                //showSnackBar(context);
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text(
                'Start Quiz',
              ),
              icon: const Icon(Icons.arrow_right_alt_outlined),
            ),
          ],
        )),
      ),
    );
  }
}
