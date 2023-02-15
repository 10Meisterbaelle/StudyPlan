import 'package:flutter/material.dart';

import 'state.dart';

final homeworkList = <String>[
  "Test1",
  "Test2",
  "Test3",
  "Test4",
  "Test5",
  "Test6",
  "Test7",
  "Test8",
  "Test9",
  "Test10",
  "Test11",
  "Test12",
  "Test13",
  "Test14",
  "Test15",
  "Test16",
  "Test17",
  "Test18",
  "Test19",
  "Test20",
  "Test21",
  "Test22",
  "Test23",
  "Test24",
  "Test25"
]; // Creates the list of homework
// TODO: Don't forget to remove list items!

void main() => runApp(const MyApp());
final GlobalKey<MyHomePageState> myHomePageKey = GlobalKey<MyHomePageState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyPlan',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}
