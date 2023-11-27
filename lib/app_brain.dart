import 'questions.dart';

class AppBrain {
  int _questionNumber = 0;

  final List<Questions> _questionsGroup = [
    Questions(
      questionText: 'هذه صورة المسجد الأقصى',
      questionImage: "images/image-1.jpeg",
      questionAnswer: true,
    ),
    Questions(
      questionText: 'الكفتة هي أكلة فلسطينية',
      questionImage: "images/image-2.jpeg",
      questionAnswer: false,
    ),
    Questions(
      questionText: 'القدس هي عاصمة فلسطين',
      questionImage: "images/image-1.jpeg",
      questionAnswer: true,
    ),
    Questions(
      questionText: 'محمد هو خاتم الانبياء',
      questionImage: "images/image-2.jpeg",
      questionAnswer: true,
    )
  ];

  void nextQuestion() {
    if (_questionNumber < _questionsGroup.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinishedQuestions() {
    if (_questionNumber >= _questionsGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestionText() {
    return _questionsGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionsGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionsGroup[_questionNumber].questionAnswer;
  }

  void reSet() {
    _questionNumber = 0;
  }
}
