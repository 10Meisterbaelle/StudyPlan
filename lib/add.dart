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

        title: Text("Add Homework"),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return const Center(
      // TODO: Implement input fields
      child: Text("Hello World"),
    );
  }
}