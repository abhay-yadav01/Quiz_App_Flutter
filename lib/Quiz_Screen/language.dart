import 'package:flashcard_quiz_app/Quiz_Screen/css_quiz.dart';
import 'package:flashcard_quiz_app/Quiz_Screen/flutter_quiz.dart';
import 'package:flashcard_quiz_app/Quiz_Screen/html_quiz.dart';
import 'package:flashcard_quiz_app/Quiz_Screen/javascript_quiz.dart';
import 'package:flashcard_quiz_app/Quiz_Screen/react_quiz.dart';
import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text(
            'Welcome to Quiz Game..😊',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        backgroundColor: const Color(0xFF7B5AFF),
      ),
      body: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  const  Padding(
      padding: EdgeInsets.only(top: 33),
      child: Center(
        child: Text(
          'Select your language to attempt the quiz',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
        ),
      ),
    ),

//HTML Button    
  const  SizedBox(height: 40),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HtmlLanguage()),);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        textStyle: const TextStyle(fontSize: 33),
        backgroundColor: (const Color.fromARGB(255, 30, 30, 30)), // Set the background color
      ),
      child: const Text('HTML', style: TextStyle(color: Colors.white),),
    ),

//CSS button    
  const  SizedBox(height: 30),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CssLanguage()),);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
        textStyle: const TextStyle(fontSize: 33),
        backgroundColor: (const Color.fromARGB(255, 30, 30, 30)), // Set the background color
      ),
      child: const Text('CSS', style: TextStyle(color: Colors.white),),
    ),

//Javascript button    
  const  SizedBox(height: 30),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JavaScriptLanguage()),);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        textStyle: const TextStyle(fontSize: 33),
        backgroundColor: (const Color.fromARGB(255, 30, 30, 30)), // Set the background color
      ),
      child: const Text('JavaScript', style: TextStyle(color: Colors.white),),
      ),

//Flutter button    
  const  SizedBox(height: 30),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterLanguage()),);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        textStyle: const TextStyle(fontSize: 33),
        backgroundColor: (const Color.fromARGB(255, 30, 30, 30)), // Set the background color
      ),
      child: const Text('Flutter', style: TextStyle(color: Colors.white),),
      ), 

//React button    
  const  SizedBox(height: 30),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReactLanguage()),);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        textStyle: const TextStyle(fontSize: 33),
        backgroundColor: (const Color.fromARGB(255, 30, 30, 30)), // Set the background color
      ),
      child: const Text('React', style: TextStyle(color: Colors.white),),
      ),   

    ],
  ),
);
}
}

