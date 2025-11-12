import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exams_list.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Exam> exams = [
    Exam(
      subjectName: 'Алгоритми и податочни структури',
      dateTime: DateTime(2025, 11, 06, 9, 0),
      examHalls: ['Лаб.138', 'Лаб.117'],
    ),
    Exam(
      subjectName: 'Компјутерски мрежи',
      dateTime: DateTime(2025, 11, 07, 14, 0),
      examHalls: ['Лаб.200B'],
    ),
    Exam(
      subjectName: 'Структурно програмирање',
      dateTime: DateTime(2025, 11, 16, 10, 0),
      examHalls: ['Лаб.2'],
    ),
    Exam(
      subjectName: 'Мобилни информациски системи',
      dateTime: DateTime(2025, 11, 16, 15, 0),
      examHalls: ['Лаб.200AB', 'Лаб.138'],
    ),
    Exam(
      subjectName: 'Математика 1',
      dateTime: DateTime(2025, 11, 17, 9, 30),
      examHalls: ['Лаб.12'],
    ),
    Exam(
      subjectName: 'Вовед во науката за податоци',
      dateTime: DateTime(2025, 11, 17, 14, 30),
      examHalls: ['Барака 3.1'],
    ),
    Exam(
      subjectName: 'Интернет програмирање на клиентска страна',
      dateTime: DateTime(2025, 11, 18, 9, 0),
      examHalls: ['Лаб.13'],
    ),
    Exam(
      subjectName: 'Вовед во компјутерските науки',
      dateTime: DateTime(2025, 11, 19, 10, 0),
      examHalls: ['Лаб.117', 'Лаб.200В'],
    ),
    Exam(
      subjectName: 'Основи на теорија на информации',
      dateTime: DateTime(2025, 11, 20, 13, 0),
      examHalls: ['Лаб.3'],
    ),
    Exam(
      subjectName: 'Бази на податоци',
      dateTime: DateTime(2025, 11, 22, 11, 0),
      examHalls: ['Барака 2'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF766495),
        foregroundColor: Colors.white,
      ),
      body: ExamList(exams: exams),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF766495),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            "Вкупно испити: ${exams.length}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}