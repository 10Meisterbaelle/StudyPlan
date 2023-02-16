import 'package:flutter/material.dart';

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
    Navigator.of(context).pushNamed("/add").then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
      // Contains the app content
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
      itemBuilder: (BuildContext context, int index) {
        // Creates items in list
        return _buildRow(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(); // Separates list elements with lines
      },
      itemCount: homeworkList
          .length, // The number of items in the ListView = The number of elements in _homeworkList
    );
  }

  Widget _buildRow(int index) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 30),
        child: const Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        child: const Icon(Icons.delete),
      ),
      child: ListTile(
        title: Text(homeworkList[index]),
        onTap: () => _editItem(index),
      ),
      onDismissed: (direction) => _deleteItem(index, direction),
    );
  }

/*  _markDone(bool markedDone, int index) {
    // TODO: Store in Database
    setState(() {
      markedDone ? doneHomework.remove(index) : doneHomework.add(index);
    });
  }*/

  void _deleteItem(int index, DismissDirection direction) {
    final item = homeworkList[index];
    setState(() {
      homeworkList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$item deleted"),
      ),
    );
  }


}
