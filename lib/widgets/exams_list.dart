import 'package:flutter/cupertino.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamList extends StatefulWidget {
  final List<Exam> exams;

  const ExamList({super.key, required this.exams});

  @override
  State<StatefulWidget> createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.exams.length,
      itemBuilder: (context, index) {
        return ExamCard(
          examData: widget.exams[index],
        );
      },
    );
  }
}
