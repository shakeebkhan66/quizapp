class QuizQuestion{

  QuizQuestion({required this.question,  required this.answers});

  String? question;
  List<String>? answers;

   List getShuffledAnswers(){
   final shuffledList = List.of(answers as Iterable);
   shuffledList.shuffle();
   return shuffledList;
  }

}