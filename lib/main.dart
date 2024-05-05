import 'package:flashcard_quiz_app/Quiz_Screen/language.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flash Card Quiz',
      home: LanguageSelection(),
    );
  }
}

