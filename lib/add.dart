import 'package:flutter/material.dart';
import 'package:studyplan/main.dart';

class Add extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddState();

}

class _AddState extends State<Add> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.house),
                  labelText: "Homework Name",
                ),
                onSaved: (value) {
                  homeworkList.add(value!);
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}