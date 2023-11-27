import 'package:rflutter_alert/rflutter_alert.dart';
import 'app_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("Quistions"),
        ),
        body: const ExamPage(),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

AppBrain appbrain = AppBrain();

class _ExamPageState extends State<ExamPage> {
  int correctResult = 0;

  List<Widget> answerResult = [];
  void checkAnswer(bool whatUserIsPicked) {
    bool currentAnswer = appbrain.getQuestionAnswer();
    setState(() {
      if (currentAnswer == whatUserIsPicked) {
        correctResult++;
        answerResult.add(const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      } //lkl
      if (appbrain.isFinishedQuestions() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "RFLUTTER ALERT",
          desc: "your correct answer is $correctResult",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: const Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        appbrain.reSet();
        correctResult = 0;
      } else {
        appbrain.nextQuestion();
        answerResult = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: answerResult),
        Expanded(
          flex: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(appbrain.getQuestionImage()),
              ),
              Text(
                appbrain.getQuestionText(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
          child: Expanded(
              child: ElevatedButton(
            onPressed: () {
              //bool currentAnswer = questionsGroup[questionNumber].questionAnswer;
              checkAnswer(true);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
            ),
            child: const Text(
              'صح',
              style: TextStyle(fontSize: 22.0),
            ),
          )),
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 100.0, right: 10.0, left: 10.0),
          child: Expanded(
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red[800]!)),
              child: const Text(
                "خطأ",
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
