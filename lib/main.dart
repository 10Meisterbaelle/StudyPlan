import 'package:flutter/material.dart';
import 'package:studyplan/add.dart';

import 'state.dart';

final homeworkList = <String>[]; // Creates the list of homework
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
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Homework'),
        '/add': (context) => Add(),
      },
      // home: const MyHomePage(title: 'Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}
