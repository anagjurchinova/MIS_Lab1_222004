
class Exam {
  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.examHalls
  });

  String subjectName;
  DateTime dateTime;
  List<String> examHalls;
}