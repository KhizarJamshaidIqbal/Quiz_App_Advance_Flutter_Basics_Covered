class QuizQuestion {
  const QuizQuestion(this.text, this.answer, this.id);

  final String text;
  final int id;
  final List<String> answer;

  List<String> getShuffleAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
