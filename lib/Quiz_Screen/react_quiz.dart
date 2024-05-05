import 'package:flutter/material.dart';

class ReactLanguage extends StatefulWidget {
  const ReactLanguage({Key? key}) : super(key: key);

  @override
  _ReactLanguageState createState() => _ReactLanguageState();
}

class _ReactLanguageState extends State<ReactLanguage> {
  int _currentIndex = 0; // Index to track current question
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Question01 : What is React?',
      'options': [
        'A. A programming language',
        'B. A framework for building user interfaces',
        'C. A design pattern',
        'D. A database management system'
      ],
      'correctAnswer': 'B. A framework for building user interfaces'
    },
    {
      'question': 'Question02 : What language is primarily used in React development?',
      'options': [
        'A. JavaScript',
        'B. Python',
        'C. Java',
        'D. Ruby'
      ],
      'correctAnswer': 'A. JavaScript'
    },
    {
      'question': 'Question03: What is JSX?',
      'options': [
        'A. JavaScript Syntax Extension',
        'B. JavaScript XML',
        'C. JavaScript XML Syntax',
        'D. Java Script Extension'
      ],
      'correctAnswer': 'B. JavaScript XML'
    },
    {
      'question': 'Question04: Which command is used to create a new React app?',
      'options': [
        'A. react new',
        'B. create-react-app',
        'C. new-react-app',
        'D. react-app-create'
      ],
      'correctAnswer': 'B. create-react-app'
    },
    {
      'question': 'Question05: What method is called when a React component is rendered on the screen for the first time?',
      'options': [
        'A. render',
        'B. componentDidMount',
        'C. componentWillMount',
        'D. componentDidUpdate'
      ],
      'correctAnswer': 'B. componentDidMount'
    },
    {
      'question': 'Question06: Which tool is commonly used for state management in React applications?',
      'options': [
        'A. Redux',
        'B. MobX',
        'C. Flux',
        'D. All of the above'
      ],
      'correctAnswer': 'D. All of the above'
    },
    {
      'question': 'Question07: What is the purpose of React Router?',
      'options': [
        'A. To manage HTTP requests in React applications',
        'B. To manage state in React applications',
        'C. To provide routing and navigation in React applications',
        'D. To handle animations in React applications'
      ],
      'correctAnswer': 'C. To provide routing and navigation in React applications'
    },
    {
      'question': 'Question08: What is the entry point of a React application?',
      'options': [
        'A. index.js',
        'B. app.js',
        'C. main.js',
        'D. entry.js'
      ],
      'correctAnswer': 'A. index.js'
    },
    {
      'question': 'Question09: What is the purpose of props in React?',
      'options': [
        'A. To manage component state',
        'B. To define the structure of a component',
        'C. To pass data from parent to child components',
        'D. To handle user input events'
      ],
      'correctAnswer': 'C. To pass data from parent to child components'
    },
    {
      'question': 'Question10: What command is used to start a React development server?',
      'options': [
        'A. react server start',
        'B. start-react-server',
        'C. npm start',
        'D. react start'
      ],
      'correctAnswer': 'C. npm start'
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
                  'React Quiz',
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

