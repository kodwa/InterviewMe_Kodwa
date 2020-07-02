enum QuestionDifficulty { easy, medium, hard }

enum QuestionType { boolean, multiple }


class QuestionModel {
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  QuestionModel({this.question, this.correctAnswer, this.incorrectAnswers});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        question: json['question'],
        correctAnswer: json['correct_answer'],
        incorrectAnswers: (json['incorrect_answers'] as List)
            .map((answer) => answer.toString())
            .toList());
  }


}

class Question {
  String question;
  List<String> answers;
  int correctAnswerIndex;
  int chosenAnswerIndex;

  Question({this.question, this.answers, this.correctAnswerIndex});

  factory Question.fromQuestionModel(QuestionModel model) {
// hne bsh nhadhrou list taa les  rep lkol s7a7 wl ghaltin
    final List<String> answers = []
      ..add(model.correctAnswer)
      ..addAll(model.incorrectAnswers)
      ..shuffle();
//l'indice taa rep s7ii7a 7atyineha fi index
    final index = answers.indexOf(model.correctAnswer);

    return Question(
        question: model.question, answers: answers, correctAnswerIndex: index);
  }



  bool isCorrect(String answer) {
    return answers.indexOf(answer) == correctAnswerIndex;
  }

  bool isChosen(String answer) {
    return answers.indexOf(answer) == chosenAnswerIndex;
  }
}
