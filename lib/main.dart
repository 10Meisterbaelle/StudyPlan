import 'package:flutter/material.dart';
import 'package:studyplan/add.dart';

final homeworkList = <String>["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10", "Test11", "Test12", "Test13", "Test14", "Test15", "Test16", "Test17", "Test18", "Test19", "Test20", "Test21", "Test22", "Test23", "Test24", "Test25"]; // Creates the list of homework
// TODO: Don't forget to remove list items!

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyPlan',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TODO: Store list in database

  void _editItem(int index) {
    // TODO: Add Reminder Editor
    setState(() {
      homeworkList[index] = "Edited";
    });
  }

  void _addItem() {
    // TODO: Add an item
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Add()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        itemBuilder: (BuildContext context, int index) { // Creates items in list
          return ListTile(
              title: Text(homeworkList[index]),
              onTap: () => _editItem(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(); // Separates list elements with lines
        },
        itemCount: homeworkList.length, // The number of items in the ListView = The number of elements in _homeworkList
    );
  }
}
