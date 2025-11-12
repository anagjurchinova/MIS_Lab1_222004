import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam examData;

  const ExamCard({super.key, required this.examData});

  @override
  Widget build(BuildContext context) {
    bool hasPassed = examData.dateTime.isBefore(DateTime.now());

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: examData);
      },
      child: Card(
        color: hasPassed ? Colors.red.shade100 : Colors.green.shade50,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF403553), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                examData.subjectName,
                style: const TextStyle(
                  color: Color(0xFF403553),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    '${examData.dateTime.day}.${examData.dateTime.month}.${examData.dateTime.year}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    '${examData.dateTime.hour.toString().padLeft(2,'0')}:${examData.dateTime.minute.toString().padLeft(2,'0')}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.room, size: 16, color: Colors.grey),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      examData.examHalls.join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
