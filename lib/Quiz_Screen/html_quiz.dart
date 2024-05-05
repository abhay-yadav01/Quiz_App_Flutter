import 'package:flutter/material.dart';

class HtmlLanguage extends StatefulWidget {
  const HtmlLanguage({Key? key}) : super(key: key);

  @override
  _HtmlLanguageState createState() => _HtmlLanguageState();
}

class _HtmlLanguageState extends State<HtmlLanguage> {
  int _currentIndex = 0; // Index to track current question
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Question01 : What does HTML stand for?',
      'options': [
        'A. Hyper Text Markup Language',
        'B. Hyperlinks and Text Markup Language',
        'C. Home Tool Markup Language',
        'D. Hyper Tool Markup Language'
      ],
      'correctAnswer': 'A. Hyper Text Markup Language'
    },
    {
      'question': 'Question02 : What does CSS stand for?',
      'options': [
        'A. Cascading Style Sheets',
        'B. Computer Style Sheets',
        'C. Colorful Style Sheets',
        'D. Creative Style Sheets'
      ],
      'correctAnswer': 'A. Cascading Style Sheets'
    },
    {
      'question': 'Question03: What is the purpose of the <div> element?',
      'options': [
        'A. To define a hyperlink',
        'B. To group elements and apply styles',
        'C. To create a new webpage',
        'D. To display an image'
      ],
      'correctAnswer': 'B. To group elements and apply styles'
    },
    {
      'question': 'Question04: Which HTML tag is used to define an unordered list?',
      'options': [
        'A. <ul>',
        'B. <ol>',
        'C. <li>',
        'D. <dl>'
      ],
      'correctAnswer': 'A. <ul>'
    },
    {
      'question': 'Question05: Which attribute is used to provide an advisory text about an element or its contents?',
      'options': [
        'A. title',
        'B. alt',
        'C. href',
        'D. src'
      ],
      'correctAnswer': 'A. title'
    },
    {
      'question': 'Question06: What does the <a> tag represent in HTML?',
      'options': [
        'A. Image',
        'B. Hyperlink',
        'C. Paragraph',
        'D. List item'
      ],
      'correctAnswer': 'B. Hyperlink'
    },
    {
      'question': 'Question07: Which HTML attribute specifies the URL of the page the link goes to?',
      'options': [
        'A. href',
        'B. src',
        'C. link',
        'D. url'
      ],
      'correctAnswer': 'A. href'
    },
    {
      'question': 'Question08: What is the correct HTML for adding a background color?',
      'options': [
        'A. <background>',
        'B. <bgcolor>',
        'C. <body background>',
        'D. style="background-color: yellow;"'
      ],
      'correctAnswer': 'D. style="background-color: yellow;"'
    },
    {
      'question': 'Question09: What does the <img> tag represent in HTML?',
      'options': [
        'A. Image',
        'B. Hyperlink',
        'C. Paragraph',
        'D. List item'
      ],
      'correctAnswer': 'A. Image'
    },
    {
      'question': 'Question10: Which tag is used to define a paragraph in HTML?',
      'options': [
        'A. <paragraph>',
        'B. <p>',
        'C. <para>',
        'D. <pg>'
      ],
      'correctAnswer': 'B. <p>'
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
                  'HTML Quiz',
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
