import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddState();

}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Implement input fields
        title: Text("Add Homework"),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return const Center(
      child: Text("Hello World"),
    );
  }
}