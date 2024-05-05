import 'package:flutter/material.dart';

class FlutterLanguage extends StatefulWidget {
  const FlutterLanguage({Key? key}) : super(key: key);

  @override
  _FlutterLanguageState createState() => _FlutterLanguageState();
}

class _FlutterLanguageState extends State<FlutterLanguage> {
  int _currentIndex = 0; // Index to track current question
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Question01 : What is Flutter?',
      'options': [
        'A. A programming language',
        'B. A framework for building user interfaces',
        'C. A design pattern',
        'D. A database management system'
      ],
      'correctAnswer': 'B. A framework for building user interfaces'
    },
    {
      'question': 'Question02 : What language is Flutter based on?',
      'options': [
        'A. Java',
        'B. Swift',
        'C. Dart',
        'D. Kotlin'
      ],
      'correctAnswer': 'C. Dart'
    },
    {
      'question': 'Question03: Which IDE is commonly used for Flutter development?',
      'options': [
        'A. Visual Studio Code',
        'B. Android Studio',
        'C. Xcode',
        'D. IntelliJ IDEA'
      ],
      'correctAnswer': 'A. Visual Studio Code'
    },
    {
      'question': 'Question04: What widget is used to create a material design button in Flutter?',
      'options': [
        'A. Button',
        'B. FlatButton',
        'C. MaterialButton',
        'D. RaisedButton'
      ],
      'correctAnswer': 'D. RaisedButton'
    },
    {
      'question': 'Question05: What command is used to create a new Flutter project?',
      'options': [
        'A. flutter create',
        'B. flutter start',
        'C. dart create',
        'D. dart start'
      ],
      'correctAnswer': 'A. flutter create'
    },
    {
      'question': 'Question06: What method is called to build the UI in a Flutter widget?',
      'options': [
        'A. render()',
        'B. buildUI()',
        'C. build()',
        'D. createUI()'
      ],
      'correctAnswer': 'C. build()'
    },
    {
      'question': 'Question07: What command is used to run a Flutter project in debug mode?',
      'options': [
        'A. flutter run',
        'B. flutter start',
        'C. flutter debug',
        'D. flutter launch'
      ],
      'correctAnswer': 'A. flutter run'
    },
    {
      'question': 'Question08: Which widget is used to create a list of items with a fixed number of children in Flutter?',
      'options': [
        'A. ListView.builder',
        'B. ListView',
        'C. List',
        'D. ListTile'
      ],
      'correctAnswer': 'A. ListView.builder'
    },
    {
      'question': 'Question09: What does MaterialApp widget do in a Flutter app?',
      'options': [
        'A. Manages material design layout',
        'B. Manages the application\'s navigation',
        'C. Manages the application\'s theme',
        'D. Manages the application\'s state'
      ],
      'correctAnswer': 'C. Manages the application\'s theme'
    },
    {
      'question': 'Question10: Which command is used to install dependencies in a Flutter project?',
      'options': [
        'A. flutter get',
        'B. flutter install',
        'C. flutter pub get',
        'D. flutter dependencies'
      ],
      'correctAnswer': 'C. flutter pub get'
    },
  ];

  List<String?> _selectedAnswers = List.filled(10, null);
  String _result = ''; // Variable to hold the result message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Flutter Quiz',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  _questions[_currentIndex]['question'],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                Column(
                  children: _buildOptions(),
                ),
                const SizedBox(height: 20),
                if (_currentIndex == _questions.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      _finishQuiz();
                    },
                    child: const Text('Finish'),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      _checkAnswer();
                      _nextQuestion();
                    },
                    child: const Text('Next'),
                  ),
                const SizedBox(height: 10), // Added SizedBox
                ElevatedButton( // Added SAVE button
                  onPressed: () {
                    _saveAnswer();
                  },
                  child: const Text('SAVE'),
                ),
                const SizedBox(height: 10), // Added SizedBox
                Text( // Added Text widget to display result
                  _result,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _result.contains('Correct') ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    return List.generate(_questions[_currentIndex]['options'].length, (index) {
      return RadioListTile<String>(
        title: Text(_questions[_currentIndex]['options'][index]),
        value: _questions[_currentIndex]['options'][index],
        groupValue: _selectedAnswers[_currentIndex],
        onChanged: (value) {
          setState(() {
            _selectedAnswers[_currentIndex] = value;
          });
        },
      );
    });
  }

  void _checkAnswer() {
    if (_selectedAnswers[_currentIndex] == _questions[_currentIndex]['correctAnswer']) {
      setState(() {
        _result = 'Correct Answer!';
      });
    } else {
      setState(() {
        _result = 'Wrong Answer!';
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex++;
      _result = ''; // Reset result message
    });
  }

  void _saveAnswer() {
    if (_selectedAnswers[_currentIndex] != null) {
      print('Selected Answer: ${_selectedAnswers[_currentIndex]}');
      _checkAnswer(); // Check if the selected answer is correct
    } else {
      print('No answer selected');
    }
  }

  void _finishQuiz() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_questions[i]['correctAnswer'] == _selectedAnswers[i]) {
        correctAnswers++;
      }
    }
    final int totalQuestions = _questions.length;
    final int score = (correctAnswers / totalQuestions * 100).round();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quiz Finished'),
          content: Text('Your score: $score% ($correctAnswers out of $totalQuestions)'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
