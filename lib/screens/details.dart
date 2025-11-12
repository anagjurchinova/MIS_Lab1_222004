import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailsPage extends StatelessWidget {
  const ExamDetailsPage({super.key});

  String remainingTime(DateTime examDate) {
    final now = DateTime.now();
    final difference = examDate.difference(now);

    if (difference.isNegative) {
      return 'Испитот е завршен.';
    }
    final int days = difference.inDays;
    final int hours = difference.inHours % 24;

    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FA),
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: const Color(0xFF766495),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subjectName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4A3F60),
                shadows: [
                  Shadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 1.2, color: Color(0xFFD9CFF0)),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20, color: Color(0xFF6B5A92)),
                const SizedBox(width: 8),
                Text(
                  '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}',
                  style: const TextStyle(fontSize: 17, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 20, color: Color(0xFF6B5A92)),
                const SizedBox(width: 8),
                Text(
                  '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 17, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.room, size: 20, color: Color(0xFF6B5A92)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    exam.examHalls.join(', '),
                    style: const TextStyle(fontSize: 17, color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 1.2, color: Color(0xFFD9CFF0)),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.timer, size: 20, color: Color(0xFF6B5A92)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Преостанато време: ${remainingTime(exam.dateTime)}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4A3F60),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}