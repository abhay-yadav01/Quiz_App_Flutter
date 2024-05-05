import 'package:flutter/material.dart';

class CssLanguage extends StatefulWidget {
  const CssLanguage({Key? key}) : super(key: key);

  @override
  _CssLanguageState createState() => _CssLanguageState();
}

class _CssLanguageState extends State<CssLanguage> {
  int _currentIndex = 0; // Index to track current question
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Question01 : What does CSS stand for?',
      'options': [
        'A. Cascading Style Sheets',
        'B. Computer Style Sheets',
        'C. Colorful Style Sheets',
        'D. Creative Style Sheets'
      ],
      'correctAnswer': 'A. Cascading Style Sheets'
    },
    {
      'question': 'Question02 : Which CSS property is used to change the text color of an element?',
      'options': [
        'A. color',
        'B. text-color',
        'C. font-color',
        'D. text-style'
      ],
      'correctAnswer': 'A. color'
    },
    {
      'question': 'Question03: Which CSS property is used to change the background color of an element?',
      'options': [
        'A. background-color',
        'B. color',
        'C. bg-color',
        'D. background'
      ],
      'correctAnswer': 'A. background-color'
    },
    {
      'question': 'Question04: Which CSS property is used to set the width of a border?',
      'options': [
        'A. border-width',
        'B. width',
        'C. border-style',
        'D. border'
      ],
      'correctAnswer': 'A. border-width'
    },
    {
      'question': 'Question05: Which CSS property is used to specify the font-size of text?',
      'options': [
        'A. text-size',
        'B. font-size',
        'C. size',
        'D. text-font'
      ],
      'correctAnswer': 'B. font-size'
    },
    {
      'question': 'Question06: Which CSS property is used to change the font family of an element?',
      'options': [
        'A. font-family',
        'B. text-family',
        'C. family',
        'D. font'
      ],
      'correctAnswer': 'A. font-family'
    },
    {
      'question': 'Question07: Which CSS property is used to specify the space between lines of text?',
      'options': [
        'A. line-height',
        'B. text-spacing',
        'C. space-between',
        'D. line-spacing'
      ],
      'correctAnswer': 'A. line-height'
    },
    {
      'question': 'Question08: Which CSS property is used to specify the size of an element?',
      'options': [
        'A. width',
        'B. size',
        'C. element-size',
        'D. dimension'
      ],
      'correctAnswer': 'A. width'
    },
    {
      'question': 'Question09: Which CSS property is used to hide an element from the rendering process?',
      'options': [
        'A. visibility',
        'B. display',
        'C. hidden',
        'D. hide'
      ],
      'correctAnswer': 'B. display'
    },
    {
      'question': 'Question10: Which CSS property is used to specify the type of cursor to be displayed?',
      'options': [
        'A. cursor-type',
        'B. pointer',
        'C. cursor',
        'D. mouse-cursor'
      ],
      'correctAnswer': 'C. cursor'
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
                  'CSS Quiz',
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
