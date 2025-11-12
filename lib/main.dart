import 'package:flutter/material.dart';
import '../screens/details.dart';
import '../screens/home.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лаб 1 - МИС',
      initialRoute: '/',
      routes: {
        '/':(context)=>const MyHomePage(title:'Распоред за испити - 222004'),
        '/details':(context)=>const ExamDetailsPage(),
      },
    );
  }
}