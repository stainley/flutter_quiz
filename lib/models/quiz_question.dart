class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  const QuizQuestion.random(this.text, {required this.answers});

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
