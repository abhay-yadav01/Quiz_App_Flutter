import 'package:flutter/material.dart';

class JavaScriptLanguage extends StatefulWidget {
  const JavaScriptLanguage({Key? key}) : super(key: key);

  @override
  _JavaScriptLanguageState createState() => _JavaScriptLanguageState();
}

class _JavaScriptLanguageState extends State<JavaScriptLanguage> {
  int _currentIndex = 0; // Index to track current question
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Question01 : What does JS stand for?',
      'options': [
        'A. JavaScript',
        'B. JustScript',
        'C. JavaSource',
        'D. JScript'
      ],
      'correctAnswer': 'A. JavaScript'
    },
    {
      'question': 'Question02 : Which of the following is not a data type in JavaScript?',
      'options': [
        'A. Number',
        'B. Boolean',
        'C. Double',
        'D. String'
      ],
      'correctAnswer': 'C. Double'
    },
    {
      'question': 'Question03: What is the correct way to include JavaScript code in an HTML file?',
      'options': [
        'A. <script src="script.js"></script>',
        'B. <js>script.js</js>',
        'C. <javascript>script.js</javascript>',
        'D. <include src="script.js">'
      ],
      'correctAnswer': 'A. <script src="script.js"></script>'
    },
    {
      'question': 'Question04: Which method is used to print something in the console in JavaScript?',
      'options': [
        'A. print()',
        'B. log()',
        'C. console.log()',
        'D. write()'
      ],
      'correctAnswer': 'C. console.log()'
    },
    {
      'question': 'Question05: Which keyword is used to declare variables in JavaScript?',
      'options': [
        'A. dim',
        'B. var',
        'C. let',
        'D. int'
      ],
      'correctAnswer': 'B. var'
    },
    {
      'question': 'Question06: What is the correct way to write a comment in JavaScript?',
      'options': [
        'A. //This is a comment',
        'B. <!--This is a comment-->',
        'C. /*This is a comment*/',
        'D. \\This is a comment'
      ],
      'correctAnswer': 'A. //This is a comment'
    },
    {
      'question': 'Question07: Which operator is used for strict equality in JavaScript?',
      'options': [
        'A. =',
        'B. ==',
        'C. ===',
        'D. !=='
      ],
      'correctAnswer': 'C. ==='
    },
    {
      'question': 'Question08: Which method is used to add a new element to an array in JavaScript?',
      'options': [
        'A. push()',
        'B. append()',
        'C. add()',
        'D. insert()'
      ],
      'correctAnswer': 'A. push()'
    },
    {
      'question': 'Question09: What is the output of `typeof null` in JavaScript?',
      'options': [
        'A. Object',
        'B. Null',
        'C. Undefined',
        'D. Error'
      ],
      'correctAnswer': 'A. Object'
    },
    {
      'question': 'Question10: Which method is used to remove the last element from an array in JavaScript?',
      'options': [
        'A. pop()',
        'B. remove()',
        'C. delete()',
        'D. splice()'
      ],
      'correctAnswer': 'A. pop()'
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
                  'JavaScript Quiz',
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
