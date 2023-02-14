import 'package:flutter/material.dart';

import 'add.dart';
import 'main.dart';

class MyHomePageState extends State<MyHomePage> {
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
    return Scaffold( // Contains the app content
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
        return _buildRow(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(); // Separates list elements with lines
      },
      itemCount: homeworkList.length, // The number of items in the ListView = The number of elements in _homeworkList
    );
  }
  Widget _buildRow(int index) {
    final markedDone = doneHomework.contains(index);
    return ListTile(
      title: Text(homeworkList[index]),
      onTap: () => _editItem(index),
      trailing: IconButton(
        icon: Icon(
          markedDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: markedDone ? Colors.blue : null,
        ),
        onPressed: () => _markDone(markedDone, index),
      ),
    );
  }

  _markDone(bool markedDone, int index) {
    // TODO: Store in Database
    setState(() {
      markedDone ? doneHomework.remove(index) : doneHomework.add(index);
    });
  }
}