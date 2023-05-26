import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_Screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start_screen';

  List<String> selectedAnswers = [];

  void chooseAnswer(String selectedanswer) {
    selectedAnswers.add(selectedanswer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start_screen';
      selectedAnswers = [];
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    } else if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(selectedAnswers, restartQuiz);
    } else {
      screenWidget = StartScreen(switchScreen);
    }
    return MaterialApp(
        home: Scaffold(backgroundColor: Colors.deepPurple, body: screenWidget));
  }
}
